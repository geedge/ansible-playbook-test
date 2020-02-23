#!/bin/bash

BIND_ADDRESS=$(ifconfig ens1.200 | grep inet | head -1 |awk '{print $2}')
systemctl set-environment CONSUL_BIND_ADDRESS=${BIND_ADDRESS}
