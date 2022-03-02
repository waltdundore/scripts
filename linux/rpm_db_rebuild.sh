#!/bin/bash

#run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run with elevated privileges."
  exit
fi


mkdir /root/backups/
mkdir /root/backups/$(date +%Y.%m.%d)
cp -avr /var/lib/rpm/ /root/backups/$(date +%Y.%m.%d)
rm -f /var/lib/rpm/__db*
db_verify /var/lib/rpm/Packages
rpm --rebuilddb
yum clean all
