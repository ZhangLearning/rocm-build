#!/bin/bash

export ROCM_INSTALL_DIR=/opt/rocm
# export ROCM_INSTALL_DIR=${HOME}/dev_rocm/opt/rocm
export ROCM_MAJOR_VERSION=5
export ROCM_MINOR_VERSION=7
export ROCM_PATCH_VERSION=0
export ROCM_LIBPATCH_VERSION=50700
export ROCM_LLVM_VERSION=17.0.0.23293
export CPACK_DEBIAN_PACKAGE_RELEASE=63~22.04
# export CPACK_RPM_PACKAGE_RELEASE="local.9999"
export ROCM_PKGTYPE=DEB

export CMAKE_EXPORT_COMPILE_COMMANDS=1
export CMAKE_VERBOSE_MAKEFILE=1

export DEV_ROCM_HOME=${HOME}/dev_rocm/
export ROCM_GIT_DIR=${DEV_ROCM_HOME}/ROCm
export ROCM_BUILD_DIR=${DEV_ROCM_HOME}/rocm-build/build
export ROCM_PATCH_DIR=${DEV_ROCM_HOME}/rocm-build/patch
export AMDGPU_TARGETS="gfx1102"
# export CMAKE_DIR=${DEV_ROCM_HOME}/local/cmake-3.18.6-Linux-x86_64


export ROCM_PATH=$ROCM_INSTALL_DIR
export HIPCC_BIN_DIR=$ROCM_INSTALL_DIR/hip/bin/

export HIP_COMMON_DIR=${ROCM_GIT_DIR}/HIP
export HIP_ROCCLR_HOME=$ROCM_GIT_DIR/clr/rocclr

export HSA_PATH=$ROCM_INSTALL_DIR/hsa
export HIP_PATH=$ROCM_INSTALL_DIR/hip
export HIP_CLANG_PATH=$ROCM_INSTALL_DIR/llvm/bin
export HIPCC_VERBOSE=7
export DEVICE_LIB_PATH=$ROCM_INSTALL_DIR/lib
export PATH=$ROCM_INSTALL_DIR/bin:$ROCM_INSTALL_DIR/llvm/bin:$ROCM_INSTALL_DIR/hip/bin::$PATH
