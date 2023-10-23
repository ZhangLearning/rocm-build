#!/bin/bash

set -e



mkdir -p $ROCM_BUILD_DIR/rocm-core
cd $ROCM_BUILD_DIR/rocm-core
pushd .

START_TIME=$(date +%s)



cmake \
    -DCMAKE_CURRENT_BINARY_DIR=$ROCM_BUILD_DIR/rocm-core \
    -DCMAKE_CURRENT_SOURCE_DIR=$ROCM_GIT_DIR/rocm-core \
    -DCMAKE_VERBOSE_MAKEFILE=1 \
    -DCMAKE_INSTALL_PREFIX=${ROCM_INSTALL_DIR} \
    -DROCM_VERSION="${ROCM_MAJOR_VERSION}.${ROCM_MINOR_VERSION}.${ROCM_PATCH_VERSION}" \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
    $ROCM_GIT_DIR/rocm-core

cmake --build . --target package
sudo dpkg -i *.deb
# cmake --install .


END_TIME=$(date +%s)
EXECUTING_TIME=$(expr $END_TIME - $START_TIME)
echo "elapse : "$EXECUTING_TIME"s"

popd
