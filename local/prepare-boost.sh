#!/bin/bash

set -e

pushd .

scp work@192.168.31.185:/media/work/hgst1/backup-1000/ai/boost_1_72_0.tar.bz2 ${DEV_ROCM_HOME}/local
scp work@192.168.31.185:/media/work/hgst1/backup-1000/ai/boost.cmake ${DEV_ROCM_HOME}/local

tar xf ${DEV_ROCM_HOME}/local/boost_1_72_0.tar.bz2 -C ${DEV_ROCM_HOME}/local/

cp ${DEV_ROCM_HOME}/local/boost.cmake ${DEV_ROCM_HOME}/local/boost_1_72_0/CMakeLists.txt

mkdir -p ${DEV_ROCM_HOME}/local/boost_1_72_0/build
cd ${DEV_ROCM_HOME}/local/boost_1_72_0/build

cmake .. -DBOOST_WITHOUT_CONTEXT=1 -DBOOST_WITHOUT_COROUTINE=1 -DBOOST_WITHOUT_PYTHON=1 -DCMAKE_POSITION_INDEPENDENT_CODE=ON

make -j

sudo cmake --install .

popd
