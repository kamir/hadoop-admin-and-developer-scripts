#!/bin/bash
echo ">> Download the bootstrap script ..."
wget https://github.com/kamir/hadoop-admin-and-developer-scripts/raw/master/prepare_OS/CentOS6.4/init_tutorial_space.sh
chmod 777 init_tutorial_space.sh

echo ">> will call the bootstrap script now ..."
echo "0 = stop now"
echo "1 = go on"
read goOn

if [ $goOn -eq 1 ]
then
    ./init_tutorial_space.sh
    echo 'Done.'
else
    echo 'Exit.'
fi