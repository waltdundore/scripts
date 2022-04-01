#!/bin/bash

podman play kube --down lamp.yaml
ppodman rmi $(podman images -qa) -f
rm -rf mydbstuff/*
podman rmi --all
podman system prune --all --force


