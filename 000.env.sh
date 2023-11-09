#!/bin/bash

export ROCM_INSTALL_DIR=/opt/rocm
export ROCM_MAJOR_VERSION=5
export ROCM_MINOR_VERSION=7
export ROCM_PATCH_VERSION=0
export ROCM_LIBPATCH_VERSION=50700
export CPACK_DEBIAN_PACKAGE_RELEASE=72~22.04
export ROCM_PKGTYPE=DEB
export ROCM_GIT_DIR=${HOME}/dev_workspace/ROCm
export ROCM_BUILD_DIR=${HOME}/dev_workspace/rocm-build/build
export ROCM_PATCH_DIR=${HOME}/dev_workspace/rocm-build/patch
export AMDGPU_TARGETS="gfx1102"
#export CMAKE_DIR=${HOME}/.local/cmake-3.18.6-Linux-x86_64
export PATH=$ROCM_INSTALL_DIR/bin:$ROCM_INSTALL_DIR/llvm/bin:$ROCM_INSTALL_DIR/hip/bin:$PATH

export env_sh_flag=1
