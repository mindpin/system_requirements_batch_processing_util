#!/usr/bin/env bash

base_path=`cd "$(dirname "$0")"; pwd`

# nginx
echo "\
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/mainline/centos/7/$basearch/
gpgcheck=0
enabled=1
" > /etc/yum.repos.d/nginx.repo

yum -y install nginx

systemctl enable nginx.service
systemctl start nginx.service

# git
yum -y git

# nodejs
curl --silent --location https://rpm.nodesource.com/setup_5.x | bash -
yum -y install gcc-c++ make nodejs

# mongodb 2.6
echo "\
[mongodb-org-2.6]
name=MongoDB 2.6 Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
" > /etc/yum.repos.d/mongodb-2.6.repo

yum -y install mongodb-org
chkconfig --level 2345 mongod on
/etc/init.d/mongod start


# rvm ruby

mkdir -p $base_path/tmp
cd $base_path/tmp
wget http://7xsns9.com2.z0.glb.clouddn.com/rvm-1.26.11.tar.gz
mkdir rvm && cd rvm
tar --strip-components=1 -xzf ../rvm-1.26.11.tar.gz
./install --auto-dotfiles
source /etc/profile.d/rvm.sh
cd $rvm_path/archives/
wget https://ruby.taobao.org/mirrors/ruby/2.1/ruby-2.1.3.tar.bz2
wget http://7xsns9.com2.z0.glb.clouddn.com/rubygems-2.4.6.tgz
wget http://7xsns9.com2.z0.glb.clouddn.com/yaml-0.1.6.tar.gz
rvm requirements

echo "" > $rvm_path/gemsets/default.gems
echo "" > $rvm_path/gemsets/global.gems
rvm install 2.1.3 --rubygems 2.4.6
rvm use 2.1.3 --default
gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/
gem install bundler
