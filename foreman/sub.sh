#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run with elevated privileges."
  exit
fi

subscription-manager remove --all
subscription-manager unregister
subscription-manager clean


puppet agent -t
