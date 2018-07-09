#!/bin/bash
set -e
SOURCE_DIR=$(pwd)

if [ -z "${ORTHANC_ROOT}" ];then
  ORTHANC_ROOT=$(find $(pwd) -name Orthanc-* | head -n1)
fi

if [ -z "${VCPKG_DIR}" ]; then
  VCPKG_DIR=${SOURCE_DIR}/vcpkg
fi

if [ -z "${BUILD_DIR}" ]; then
  BUILD_DIR=${SOURCE_DIR}/build/
fi

if [ -z "${INSTALL_DIR}" ]; then
  INSTALL_DIR=${SOURCE_DIR}/install/
fi

if [ -z "${QT5_DIR}" ]; then
  echo "QT5_DIR not defined. CMake probably won't be able to locate your Qt installation"
fi

# use the same cmake version that comes with VCPKG
if [ "$(uname)" == "Darwin" ]; then
  cmake_exec=$(find ${VCPKG_DIR} -type f -perm +111 -name cmake)
  cmake_vcpkg_triplet=""
else
  cmake_exec=$(find ${VCPKG_DIR} -type f -executable -name cmake)
  cmake_vcpkg_triplet="-DVCPKG_TARGET_TRIPLET=x64-linux-fpic"
fi

mkdir -p ${BUILD_DIR}/{debug,release}
mkdir -p ${INSTALL_DIR}

cd ${BUILD_DIR}/debug
${cmake_exec} ${SOURCE_DIR} -G"Unix Makefiles" \
      -DORTHANC_ROOT:PATH="${ORTHANC_ROOT}" \
      -DCMAKE_TOOLCHAIN_FILE:PATH=${VCPKG_DIR}/scripts/buildsystems/vcpkg.cmake \
      -DCMAKE_INSTALL_PREFIX:PATH=${INSTALL_DIR} \
      -DCMAKE_BUILD_TYPE=Debug \
      -DCMAKE_PREFIX_PATH="${QT5_DIR}" \
      ${cmake_vcpkg_triplet}

${cmake_exec} --build . --config Debug --target install -- -j

cd ${BUILD_DIR}/release
${cmake_exec} ${SOURCE_DIR} -G"Unix Makefiles" \
      -DORTHANC_ROOT:PATH="${SOURCE_DIR}/Orthanc-${ORTHANC_VERSION}" \
      -DCMAKE_TOOLCHAIN_FILE:PATH=${VCPKG_DIR}/scripts/buildsystems/vcpkg.cmake \
      -DCMAKE_INSTALL_PREFIX:PATH=${INSTALL_DIR} \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH="${QT5_DIR}" \
      ${cmake_vcpkg_triplet}

${cmake_exec} --build . --config Release --target install -- -j