#!/bin/bash

set -e

# check source env.sh 是否执行过
if env | grep -q "rocm_env_sourced_flag="; then
    echo "please source env.sh."
else
    # 执行 env.sh 脚本
    source 000.env.sh
    echo "env.sh has already been sourced."
fi

mkdir -p $ROCM_BUILD_DIR/clr
cd $ROCM_BUILD_DIR/clr
pushd .

#ROCclr_DIR=$ROCM_GIT_DIR/ROCclr
#OPENCL_DIR=$ROCM_GIT_DIR/ROCm-OpenCL-Runtime
#HIP_DIR=$ROCM_GIT_DIR/HIP

START_TIME=$(date +%s)
#-DHIPCC_BIN_DIR=${ROCM_BUILD_DIR}/HIP/HIPCC/build \
#-DCLR_BUILD_HIP=ON \
cmake \
	-DCMAKE_INSTALL_PREFIX=$ROCM_INSTALL_DIR \
	-DCPACK_PACKAGING_INSTALL_PREFIX=$ROCM_INSTALL_DIR \
	-DOpenGL_GL_PREFERENCE=GLVND \
	-DHIP_COMMON_DIR=${ROCM_GIT_DIR}/HIP \
	-DHIPCC_BIN_DIR=/opt/rocm/hip/bin \
	-DCLR_BUILD_HIP=ON \
	-DCLR_BUILD_OCL=ON \
	-DHIP_PLATFORM=amd \
	-DHIP_CATCH_TEST=0 \
	-DCMAKE_BUILD_TYPE=Debug \
	-DCPACK_GENERATOR=DEB \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
	-G Ninja \
	$ROCM_GIT_DIR/clr

cmake --build .
cmake --build . --target package
sudo dpkg -i *.deb

END_TIME=$(date +%s)
EXECUTING_TIME=$(expr $END_TIME - $START_TIME)
echo "elapse : "$EXECUTING_TIME"s"

popd
