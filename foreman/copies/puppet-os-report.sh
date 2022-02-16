#!/bin/bash
#
# This report pulls operating system versions out of PuppetDB

hosts=$(curl -X GET http://localhost:8080/pdb/query/v4/nodes --data-urlencode 'order_by=[{"field": "certname", "order": "asc"}]' | jq -r '.[].certname')

report="ServerName,OperatingSystem\n"

for host in $hosts; do
  os=$(curl -X GET http://localhost:8080/pdb/query/v4/facts/operatingsystem --data-urlencode "query=[\"=\", \"certname\", \"${host}\"]" | jq -r '.[].value')
  release=$(curl -X GET http://localhost:8080/pdb/query/v4/facts/operatingsystemmajrelease --data-urlencode "query=[\"=\", \"certname\", \"${host}\"]" | jq -r '.[].value')
  friendly_host=$(echo ${host} | cut -f1 -d ".")
  report+="${friendly_host},${os} ${release}\n"
done

echo -e $report > /tmp/OperatingSystem-Report_$(date +%Y-%m-%d).csv
echo "This is an automated operating system report from PuppetDB. Please see attached." | EMAIL="Puppet Do Not Reply <donotreply@westga.edu>" mutt -s "OS Version Report $(date +%Y-%m-%d)" wdundore@westga.edu -a /tmp/OperatingSystem-Report_$(date +%Y-%m-%d).csv
rm /tmp/OperatingSystem-Report_$(date +%Y-%m-%d).csv
