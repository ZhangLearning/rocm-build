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

mkdir -p $ROCM_BUILD_DIR/rocm-core
cd $ROCM_BUILD_DIR/rocm-core
pushd .

START_TIME=$(date +%s)

cmake \
	-DCMAKE_INSTALL_PREFIX=${ROCM_INSTALL_DIR} \
	-DPROJECT_VERSION_MAJOR=${ROCM_MAJOR_VERSION} \
	-DPROJECT_VERSION_MINOR=${ROCM_MINOR_VERSION} \
	-DPROJECT_VERSION_PATCH=${ROCM_PATCH_VERSION} \
	-DROCM_PATCH_VERSION=${ROCM_LIBPATCH_VERSION} \
	-DROCM_BUILD_VERSION=${CPACK_DEBIAN_PACKAGE_RELEASE} \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
	$ROCM_BUILD_DIR/../src/rocm-core

cmake --build . --target package
sudo dpkg -i *.deb

END_TIME=$(date +%s)
EXECUTING_TIME=$(expr $END_TIME - $START_TIME)
echo "elapse : "$EXECUTING_TIME"s"

popd
