FROM ubuntu:18.04
MAINTAINER Matthias Schmieder <schmieder.matthias@gmail.com>

ARG ORTHANC_VERSION=1.3.1
ENV ORTHANC_VERSION=${ORTHANC_VERSION}
ENV ORTHANC_VERSION=/bootstrap/Orthanc-${ORTHANC_VERSION}

RUN apt-get update -qq && apt-get install -y \
      wget \
      software-properties-common \
      cmake \
      git \
      gcc \
      g++ \
      curl \
      unzip \
      tar \
      sudo \
    && rm -rf /var/lib/apt/lists/*

COPY bootstrap.sh /bootstrap/
COPY triplets /bootstrap/triplets

ENV CFLAGS=-fPIC
ENV CXXFLAGS=-fPIC
ENV LDFLAGS=-fPIC

WORKDIR /bootstrap
RUN sudo bash bootstrap.sh
RUN rm -rf /bootstrap/vcpkg/buildtrees/*

WORKDIR /