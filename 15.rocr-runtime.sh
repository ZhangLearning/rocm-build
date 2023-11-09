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

mkdir -p $ROCM_BUILD_DIR/rocr-runtime
cd $ROCM_BUILD_DIR/rocr-runtime
pushd .

START_TIME=$(date +%s)

cmake \
	-DCMAKE_BUILD_TYPE=Debug \
	-DCMAKE_INSTALL_PREFIX=$ROCM_INSTALL_DIR \
	-DCPACK_PACKAGING_INSTALL_PREFIX=$ROCM_INSTALL_DIR \
	-DCPACK_GENERATOR=DEB \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
	-G Ninja \
	$ROCM_GIT_DIR/ROCR-Runtime/src

cmake --build .
cmake --build . --target package
sudo dpkg -i *.deb

END_TIME=$(date +%s)
EXECUTING_TIME=$(expr $END_TIME - $START_TIME)
echo "elapse : "$EXECUTING_TIME"s"

popd
