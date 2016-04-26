#!/usr/bin/env bash

base_path=`cd "$(dirname "$0")"; pwd`

# nginx
echo '
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/$basearch/
gpgcheck=0
enabled=1
' > /etc/yum.repos.d/nginx.repo

yum -y install nginx

systemctl enable nginx.service
systemctl start nginx.service

# nodejs
# support
# RHEL 5 6 7
# CentOS 5 6 7
# Fedora 19 20 21
curl --silent --location https://rpm.nodesource.com/setup_5.x | bash -
yum -y install gcc-c++ make nodejs


# rvm ruby
$base_path/../../general/install_rvm.sh
