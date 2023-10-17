#!/bin/bash

set -e

rm -rf $ROCM_BUILD_DIR/clr
mkdir -p $ROCM_BUILD_DIR/clr
cd $ROCM_BUILD_DIR/clr
pushd .

#ROCclr_DIR=$ROCM_GIT_DIR/ROCclr
#OPENCL_DIR=$ROCM_GIT_DIR/ROCm-OpenCL-Runtime
#HIP_DIR=$ROCM_GIT_DIR/HIP

START_TIME=$(date +%s)

cmake \
    -DOFFLOAD_ARCH_STR="--offload-arch=$AMDGPU_TARGETS" \
    -DAMDGPU_TARGETS=$AMDGPU_TARGETS \
    -DCMAKE_INSTALL_PREFIX=$ROCM_INSTALL_DIR \
    -DCPACK_PACKAGING_INSTALL_PREFIX=$ROCM_INSTALL_DIR \
    -DROCM_PATH=$ROCM_INSTALL_DIR \
    -DHIPCC_BIN_DIR=$ROCM_INSTALL_DIR/hip/bin \
    -DHIP_COMMON_DIR=$ROCM_GIT_DIR/HIP \
    -DHIP_ROCCLR_HOME=$ROCM_GIT_DIR/clr/rocclr \
    -DHIP_CLANG_PATH=$ROCM_INSTALL_DIR/llvm/bin \
    -DCLR_BUILD_HIP=ON \
    -DCLR_BUILD_OCL=ON \
    -DHIP_PLATFORM=amd \
    -DHIP_CATCH_TEST=0 \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCPACK_GENERATOR=DEB \
    -G Ninja \
    $ROCM_GIT_DIR/clr

cmake --build .
cmake --build . --target package
# sudo dpkg -i *.deb
cmake --install .
#sudo dpkg -i hip-dev*.deb hip-doc*.deb hip-runtime-amd*.deb hip-samples*.deb

END_TIME=$(date +%s)
EXECUTING_TIME=$(expr $END_TIME - $START_TIME)
echo "elapse : "$EXECUTING_TIME"s"

popd
