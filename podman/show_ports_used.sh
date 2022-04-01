#!/bin/bash

podman container ls --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" -a

