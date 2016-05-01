#!/bin/bash

# Remove config lock if exists otherwise will not start
rm -rf /root/.flexget/.config-lock

exec $@
