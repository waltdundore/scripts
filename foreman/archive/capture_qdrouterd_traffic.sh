#!/bin/bash

systemctl status qdrouterd
echo ________________________________________
echo
echo Initiating capture to /tmp/qdrouterd.cap
echo ________________________________________

echo
echo
echo Use ctrl + z to cancel packet capture:

tcpdump -i any -s 0 port 5647 -w /tmp/qdrouterd.cap
