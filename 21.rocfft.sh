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

echo "|====|"
echo "|SLOW|"
echo "|====|"

mkdir -p $ROCM_BUILD_DIR/rocfft
cd $ROCM_BUILD_DIR/rocfft
pushd .

START_TIME=$(date +%s)

CXX=$ROCM_INSTALL_DIR/hip/bin/hipcc cmake \
	-DAMDGPU_TARGETS=$AMDGPU_TARGETS \
	-DCMAKE_BUILD_TYPE=Debug \
	-DCPACK_SET_DESTDIR=OFF \
	-DCPACK_PACKAGING_INSTALL_PREFIX=$ROCM_INSTALL_DIR \
	-DCMAKE_INSTALL_PREFIX=rocfft-install \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
	-G Ninja \
	$ROCM_GIT_DIR/rocFFT

cmake --build .
cmake --build . --target package
sudo dpkg -i *.deb

END_TIME=$(date +%s)
EXECUTING_TIME=$(expr $END_TIME - $START_TIME)
echo "elapse : "$EXECUTING_TIME"s"

popd
