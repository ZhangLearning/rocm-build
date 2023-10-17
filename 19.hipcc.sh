#!/bin/bash

set -e

mkdir -p $ROCM_BUILD_DIR/HIPCC
cd $ROCM_BUILD_DIR/HIPCC
pushd .

#ROCclr_DIR=$ROCM_GIT_DIR/ROCclr
#OPENCL_DIR=$ROCM_GIT_DIR/ROCm-OpenCL-Runtime
#HIP_DIR=$ROCM_GIT_DIR/HIP

START_TIME=$(date +%s)

cmake \
    -DCMAKE_INSTALL_PREFIX=$ROCM_INSTALL_DIR \
    -DCPACK_PACKAGING_INSTALL_PREFIX=$ROCM_INSTALL_DIR \
    -DROCM_PATH=$ROCM_INSTALL_DIR \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCPACK_GENERATOR=DEB \
    -G Ninja \
    $ROCM_GIT_DIR/HIPCC

cmake --build .
cmake --build . --target package
# sudo dpkg -i *.deb
cmake --install .

# sudo dpkg -i hip-dev*.deb hip-doc*.deb hip-runtime-amd*.deb hip-samples*.deb

END_TIME=$(date +%s)
EXECUTING_TIME=$(expr $END_TIME - $START_TIME)
echo "elapse : "$EXECUTING_TIME"s"

popd
--rocm-path=/usr \
    --rocm-device-lib-path=/usr/lib/x86_64-linux-gnu/amdgcn/bitcode \
    --hip-version=5.2.21153 \
