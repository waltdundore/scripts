#!/bin/bash
DIRECTORY="mydbstuff"

if [ ! "$EUID" -ne 0 ]
  then echo "Please DO NOT run with elevated privileges."
  exit
fi


#permission errors can be mitigated by running:
#touch ~/.config/containers/mounts.conf
   
if [ ! -d $DIRECTORY ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  mkdir $DIRECTORY  
fi 

if [ ! -d "mywebstuff" ]; then
  mkdir mywebstuff
fi

if [ -d $DIRECTORY ]; then
   podman play kube lamp.yaml
fi
