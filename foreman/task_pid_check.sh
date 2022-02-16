#!/bin/bash

for worker in $(sudo curl -ks 'https://localhost/pulp/api/v3/status/' --cert /etc/pki/katello/certs/pulp-client.crt  --key /etc/pki/katello/private/pulp-client.key | jq -r '.online_workers [].name'); do PID=$(echo $worker | awk '{sub(/@.*/,"")} NR==1'); if [[ $PID != "resource-manager" ]]; then ps $PID; fi done
