#!/bin/bash

yum update -y https://yum.theforeman.org/releases/2.4/el7/x86_64/foreman-release.rpm
yum update -y https://yum.theforeman.org/katello/4.0/katello/el7/x86_64/katello-repos-latest.rpm
yum install -y centos-release-scl-rh

yum clean all
yum -y update


foreman-rake katello:upgrade_check
systemctl daemon-reload
foreman-installer --scenario katello
hash -d foreman-maintain service 2> /dev/null
foreman-maintain service restart
