#!/bin/bash

set -e
SOURCE_DIR=$(pwd)

# INSTALL VCPKG
if [ ! -d "vcpkg" ];then
  git clone https://github.com/mschmieder/vcpkg.git
  cd vcpkg
  
  git checkout fix-boost-compile-flags

  ./bootstrap-vcpkg.sh
  
  # copy triplet into the triplets folder to ensure position independent 
  export PATH=${SOURCE_DIR}/vcpkg:${PATH}
  cp -f ${SOURCE_DIR}/triplets/* triplets/
  
  # use the same cmake version that comes with VCPKG
  if [ "$(uname)" == "Darwin" ]; then
    TRIPLET=""
  else
    TRIPLET="--triplet x64-linux-fpic"
  fi

  cd ${SOURCE_DIR}
fi 

# INSTALL REQUIRED LIBRARIES
vcpkg ${TRIPLET} install jsoncpp gtest

# DOWNLOAD ORTHANC SOURCES
if [ -z "${ORTHANC_VERSION}" ];then
  ORTHANC_VERSION=1.3.1
fi

if [ ! -d "orthanc" ];then
  ORHTANC_FILENAME=Orthanc-${ORTHANC_VERSION}.tar.gz
  wget -q -O ${ORHTANC_FILENAME} https://www.orthanc-server.com/downloads/get.php?path=/orthanc/${ORHTANC_FILENAME}
  tar -xzf ${ORHTANC_FILENAME}
  rm ${ORHTANC_FILENAME}
fi