#!/usr/bin/env bash

base_path=`cd "$(dirname "$0")"; pwd`

# nginx
echo ' 
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/mainline/centos/6/$basearch/
gpgcheck=0
enabled=1
' > /etc/yum.repos.d/nginx.repo

yum -y install nginx

chkconfig --level 2345 nginx on
/etc/init.d/nginx start

# git
yum -y git

# nodejs
# support
# RHEL 5 6 7
# CentOS 5 6 7
# Fedora 19 20 21
curl --silent --location https://rpm.nodesource.com/setup_5.x | bash -
yum -y install gcc-c++ make nodejs

# mongodb 2.6
# supoort Red Hat Enterprise Linux or CentOS Linux versions 6 and 7
echo '
[mongodb-org-2.6]
name=MongoDB 2.6 Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
gpgcheck=0
enabled=1
' > /etc/yum.repos.d/mongodb-2.6.repo

yum -y install mongodb-org
chkconfig --level 2345 mongod on
/etc/init.d/mongod start


# rvm ruby
$base_path/../../general/install_rvm.sh
