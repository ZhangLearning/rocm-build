#!/bin/bash

set -e

mkdir -p $ROCM_BUILD_DIR/rocm-cmake
cd $ROCM_BUILD_DIR/rocm-cmake
pushd .

START_TIME=$(date +%s)

cmake \
    -DCMAKE_INSTALL_PREFIX=$ROCM_INSTALL_DIR \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCPACK_PACKAGING_INSTALL_PREFIX=$ROCM_INSTALL_DIR \
    -DCPACK_GENERATOR=DEB \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
    -G Ninja \
    $ROCM_GIT_DIR/rocm-cmake

cmake --build .
cmake --build . --target package
sudo dpkg -i *.deb
# cmake --install .

END_TIME=$(date +%s)
EXECUTING_TIME=$(expr $END_TIME - $START_TIME)
echo "elapse : "$EXECUTING_TIME"s"

popd
