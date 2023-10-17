#!/bin/bash

set -e

pushd .

scp work@192.168.31.185:/media/work/hgst1/backup-1000/gitrepo/json-3.9.1.tar.gz ${DEV_ROCM_HOME}/local

tar xf ${DEV_ROCM_HOME}/local/json-3.9.1.tar.gz -C ${DEV_ROCM_HOME}/local/

mkdir -p ${DEV_ROCM_HOME}/local/json/build
cd ${DEV_ROCM_HOME}/local/json/build

cmake .. -DJSON_MultipleHeaders=ON -DJSON_BuildTests=Off

make -j

sudo cmake --install .

popd
