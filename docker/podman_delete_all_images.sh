#!/bin/bash
podman system prune --all --force && podman rmi --all
