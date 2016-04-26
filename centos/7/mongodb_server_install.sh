#!/usr/bin/env bash

base_path=`cd "$(dirname "$0")"; pwd`


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


