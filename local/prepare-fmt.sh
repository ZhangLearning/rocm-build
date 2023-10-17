#!/bin/bash

set -e

pushd .

scp work@192.168.31.185:/media/work/hgst1/backup-1000/gitrepo/fmt-7.1.3.tar.gz ${DEV_ROCM_HOME}/local

tar xf ${DEV_ROCM_HOME}/local/fmt-7.1.3.tar.gz -C ${DEV_ROCM_HOME}/local/

mkdir -p ${DEV_ROCM_HOME}/local/fmt/build
cd ${DEV_ROCM_HOME}/local/fmt/build

cmake .. -DFMT_DOC=OFF -DFMT_TEST=OFF

make -j

sudo cmake --install .

popd
