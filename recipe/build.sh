#!/bin/bash
set -eu

### Create Makefiles
cmake ${CMAKE_ARGS} -G Ninja \
      -D CMAKE_POLICY_VERSION_MINIMUM=3.5 \
      -D BUILD_ZENLIB=OFF \
      -D BUILD_ZLIB=OFF \
      -D CMAKE_BUILD_TYPE=Release \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_INSTALL_LIBDIR=lib \
      -D BUILD_SHARED_LIBS=ON \
      -S Project/CMake \
      -B build

### Build
cmake --build build -- -j${CPU_COUNT}

### Install
cmake --build build -- install
