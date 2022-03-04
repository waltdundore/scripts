#!/bin/bash

echo "*********************"
echo "* Active Containers *"
echo "*********************"

podman container ls

echo "************************"
echo "* Available Containers *"
echo "************************"
	
podman ps -a

echo "********"
echo "* Pods *"
echo "********"

podman pod ps


echo "**********"
echo "* Images *"
echo "**********"
podman images

echo "************"
echo "* Networks *"
echo "************"

podman network ls

echo "****************"
echo "* Connectivity *"
echo "****************"
EXPOSEDIP="192.168.50.151"
EXPOSEDPORT="8080"
podman run -it --rm fedora curl $EXPOSEDIP:$EXPOSEDPORT

