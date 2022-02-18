#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run with elevated privileges."
  exit
fi

puppet agent -tv

yum clean all
rm -rf /var/cache/yum/*
subscription-manager remove --all
subscription-manager unregister
subscription-manager clean

rpm -qa | grep katello-ca

subscription-manager config --list

subscription-manager register --org="UWG" --activationkey="Generic RHEL 7 Server"

subscription-manager list --consumed

yum -y update polkit samba*