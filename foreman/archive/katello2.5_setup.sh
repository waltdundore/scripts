#!/bin/bash


yum -y remove epel-release
subscription-manager repos --disable "*"

subscription-manager repos --enable rhel-*-optional-rpms \
                           --enable rhel-*-extras-rpms \
                           --enable rhel-ha-for-rhel-*-server-rpms
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

subscription-manager repos --enable=rhel-7-server-rpms \
--enable rhel-7-server-optional-rpms \
--enable rhel-server-rhscl-7-rpms


yum clean all

yum localinstall https://yum.theforeman.org/releases/2.5/el7/x86_64/foreman-release.rpm
yum localinstall https://yum.theforeman.org/katello/4.1/katello/el7/x86_64/katello-repos-latest.rpm
yum localinstall https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
yum install -y centos-release-scl-rh
yum -y install epel-release
yum clean all
yum -y update

