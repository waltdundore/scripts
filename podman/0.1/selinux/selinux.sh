#!/bin/bash


if [ "$EUID" -ne 0 ]
then echo "This script modifies SELinux access controls and must be run as root (sudo.)"
  exit
fi

setsebool -P container_use_devices 1
ausearch -c "apt-get" --raw | audit2allow -M my-aptget
semodule -X 300 -i my-aptget.pp

semanage import <<EOF
boolean -D
login -D
interface -D
user -D
port -D
node -D
fcontext -D
module -D
ibendport -D
ibpkey -D
permissive -D
boolean -m -1 container_use_devices
boolean -m -1 virt_sandbox_use_all_caps
boolean -m -1 virt_use_nfs
EOF
