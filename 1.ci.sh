#!/usr/bin/env bash
set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
echo $PROJECT_NAME
cd $CMD_PATH

echo "hello world"
cd ~
git clone -b dev_240511_03 --depth 1 https://github.com/es366/10004-kibana.git kibana
cd kibana
yarn kbn bootstrap
yarn build --skip-os-packages

ls -al
cd build
ls -al
tar cf kibana.tar kibana
file kibana.tar
cp kibana.tar ~/
file ~/kibana.tar