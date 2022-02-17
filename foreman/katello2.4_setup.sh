#!/bin/bash

subscription-manager repos --disable "*"

subscription-manager repos --enable=rhel-7-server-rpms \
--enable rhel-7-server-optional-rpms \
--enable rhel-server-rhscl-7-rpms

yum localinstall https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

yum clean all

yum localinstall https://yum.theforeman.org/releases/2.4/el7/x86_64/foreman-release.rpm
yum localinstall https://yum.theforeman.org/katello/4.0/katello/el7/x86_64/katello-repos-latest.rpm
yum localinstall https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
yum install -y centos-release-scl-rh

yum clean all
yum -y update

