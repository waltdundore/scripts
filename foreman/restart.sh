#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run with elevated privileges."
  exit
fi

foreman-maintain service stop && reboot

