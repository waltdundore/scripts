#!/bin/bash
subscription-manager remove --all
subscription-manager unregister
subscription-manager clean
rpm -Uvh http://your_new_satellite_server/pub/katello-ca-consumer-latest.noarch.rpm
subscription-manager register --org="Organization" --activationkey="your-activation-key"
