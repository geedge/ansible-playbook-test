#!/bin/bash

#BIND_ADDRESS=$(/usr/sbin/ip route | /usr/bin/grep default | head -n 1 | /usr/bin/awk '{print $5}' | /usr/bin/xargs ifconfig | /usr/bin/grep "inet" | /usr/bin/grep -v "inet6" | /usr/bin/awk '{print $2}')
BIND_ADDRESS=$(ifconfig ens1.200 | grep inet | head -1 |awk '{print $2}')
#BIND_ADDRESS=192.168.200.5
systemctl set-environment CONSUL_BIND_ADDRESS=${BIND_ADDRESS}
