#!/bin/bash

foreman-rake foreman_tasks:cleanup TASK_SEARCH='label ~ *' AFTER='2d' VERBOSE=true

foreman-rake katello:upgrade_check
foreman-rake foreman_tasks:cleanup
systemctl daemon-reload
foreman-rake katello:delete_orphaned_content --trace
foreman-rake katello:reimport --trace

#Deprecated
#for i in pulp_resource_manager pulp_workers pulp_celerybeat; do service $i restart; done

for taskid in $(su - postgres -c "psql pulpcore -c \"COPY (SELECT pulp_id FROM core_task WHERE state = 'waiting' OR state = 'running') TO STDOUT;\""); do
       curl -H "content-type: application/json" --cacert /etc/pki/katello/certs/katello-server-ca.crt --cert /etc/pki/katello/certs/pulp-client.crt --key /etc/pki/katello/private/pulp-client.key -X PATCH -d "{\"state\": \"canceled\"}" https://$(hostname -f)/pulp/api/v3/tasks/${taskid}/
     echo
  done


echo "*******************************"
echo "* Generating incomplete tasks *"
echo "*******************************"
sudo su - postgres -c "psql -d foreman -c 'select label,count(label),state,result from foreman_tasks_tasks where result <> '\''success'\'' group by label,state,result ORDER BY label;'"

echo ------------------------------------
echo     How to Clean These Up
echo ------------------------------------

echo Example:"foreman-rake foreman_tasks:cleanup TASK_SEARCH='label = Actions::Katello::Organization::ManifestRefresh' STATES='running' VERBOSE=true"
