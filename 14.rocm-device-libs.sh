#!/bin/bash

set -e

mkdir -p $ROCM_BUILD_DIR/rocm-device-libs
cd $ROCM_BUILD_DIR/rocm-device-libs
pushd .

START_TIME=$(date +%s)

cmake \
    -DCMAKE_INSTALL_PREFIX=$ROCM_INSTALL_DIR \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCPACK_PACKAGING_INSTALL_PREFIX=$ROCM_INSTALL_DIR \
    -DCPACK_GENERATOR=DEB \
    -G Ninja \
    $ROCM_GIT_DIR/ROCm-Device-Libs

cmake --build . -j $(($(nproc) / 2))
cmake --build . --target package -j $(($(nproc) / 2))
sudo dpkg -i *.deb
# cmake --install .

END_TIME=$(date +%s)
EXECUTING_TIME=$(expr $END_TIME - $START_TIME)
echo "elapse : "$EXECUTING_TIME"s"

popd
