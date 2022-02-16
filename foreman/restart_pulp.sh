#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run with elevated privileges."
  exit
fi

systemctl stop pulp_celerybeat.service pulp_workers.service pulp_resource_manager.service
systemctl start pulp_celerybeat.service pulp_workers.service pulp_resource_manager.service
systemctl status pulp_celerybeat.service pulp_workers.service pulp_resource_manager.service
