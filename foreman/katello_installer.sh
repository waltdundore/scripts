#!/bin/bash

foreman-rake katello:upgrade_check
systemctl daemon-reload
foreman-installer --scenario katello
hash -d foreman-maintain service 2> /dev/null
foreman-maintain service restart
