#!/bin/bash

qpid-stat -q --ssl-certificate=/etc/pki/pulp/qpid/client.crt -b amqps://localhost:5671 resource_manager

echo "if acquires is smaller than total-enqueues and acquires is not increasing over the time (while total-enqueues is), you most probably hit the deadlock /pulp tasks stuck."
