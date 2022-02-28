#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run with elevated privileges."
  exit
fi

dnf clean all
rm -rf /var/cache/dnf/*
subscription-manager remove --all
subscription-manager unregister
subscription-manager clean

rpm -qa | grep katello-ca

puppet agent -tv

dnf -y update polkit samba*
