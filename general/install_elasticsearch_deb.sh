#!/usr/bin/env bash

base_path=`cd "$(dirname "$0")"; pwd`

mkdir -p $base_path/tmp
cd $base_path/tmp
wget http://7xsns9.com2.z0.glb.clouddn.com/elasticsearch-2.3.1.deb
dpkg -i elasticsearch-2.3.1.deb

cd $base_path
rm -rf $base_path/tmp

mkdir -p /usr/share/elasticsearch/plugins/ik
cd /usr/share/elasticsearch/plugins/ik
wget http://7xsns9.com2.z0.glb.clouddn.com/elasticsearch-analysis-ik-1.9.1.zip
unzip elasticsearch-analysis-ik-1.9.1.zip
rm -rf elasticsearch-analysis-ik-1.9.1.zip

chkconfig --add elasticsearch
/etc/init.d/elasticsearch start
