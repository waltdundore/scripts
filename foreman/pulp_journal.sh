#!/bin/bash

sudo journalctl SYSLOG_IDENTIFIER=pulp |tail -n 250
