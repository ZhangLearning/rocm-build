#!/bin/bash

# 可选 mesa rusticl iris 的版本
# lib-ocl-mesa-23.1.2
# lib-ocl-mesa-23.1.6
# lib-ocl-mesa-23.2.0-devel
# lib-ocl-mesa-23.2.0-rc2
# lib-ocl-mesa-23.3.0-devel

export LANG=en_GB.UTF-8

export ROCM_INSTALL_PATH="${HOME}/dev_workspace/opt/rocm"


unset LD_LIBRARY_PATH

# opencl
# export OCL_ICD_VENDORS="${ROCM_INSTALL_PATH}/etc/OpenCL/vendors"
export LD_LIBRARY_PATH="${ROCM_INSTALL_PATH}/opencl/lib/:${LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH="${ROCM_INSTALL_PATH}/lib/:${LD_LIBRARY_PATH}"

# unset RUSTICL_ENABLE
# export RUSTICL_ENABLE=iris

# 加载自行编译的 OpenCL-ICD-Loader 的 opencl.so
# export LD_LIBRARY_PATH="${HOME}/dev_workspace/OpenCL-ICD-Loader/build:${LD_LIBRARY_PATH}"

# 加载自行编译的 ocl-icd 的 opencl.so
# export LD_LIBRARY_PATH="/usr/local/lib/:${LD_LIBRARY_PATH}"
# export LD_LIBRARY_PATH="${HOME}/dev_workspace/ocl-icd/.libs:${LD_LIBRARY_PATH}"

# 加载自行编译的 clinfo
# export PATH="${HOME}/dev_workspace/clinfo:${PATH}"

clinfo --version
clinfo
