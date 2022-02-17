#!/bin/bash

# Katello-repos will upgrade the Pulp repo
yum update foreman-release katello-repos
# Ensure you have correct metadata
yum clean expire-cache
# Update all packages
yum update -y
# Run the installer to make all service changes
foreman-installer

systemctl daemon-reload
hash -d foreman-maintain service 2> /dev/null
foreman-maintain service restart
