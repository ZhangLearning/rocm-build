#!/bin/bash

set -e

pushd .

mkdir -p ${DEV_ROCM_HOME}/local

scp meicai@192.168.31.185:/media/meicai/hgst1/backup-1000/ai/cmake-3.16.8-Linux-x86_64.tar.gz ${DEV_ROCM_HOME}/local

tar xzf ${DEV_ROCM_HOME}/local/cmake-3.16.8-Linux-x86_64.tar.gz -C ${DEV_ROCM_HOME}/local/

popd
