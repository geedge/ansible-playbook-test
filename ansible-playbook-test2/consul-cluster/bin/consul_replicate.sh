#!/bin/bash
#
killall -9 consul-replicate
cd /opt/consul-internal/bin/;./consul-replicate -prefix "device_info@consul-external_new" &>/dev/null &
cd /opt/consul-internal/bin/;./consul-replicate -prefix "device_list@consul-external_new" &>/dev/null &
cd /opt/consul-internal/bin/;./consul-replicate -prefix "tags@consul-external_new" &>/dev/null &
