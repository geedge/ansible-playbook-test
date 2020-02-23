#!/bin/bash

rm -rf /usr/lib/systemd/system/consul*service
rm -rf /usr/lib/systemd/system/consul*service
rm -rf /var/consul*
cp -f /opt/consul-cluster/etc/systemd/consul-server.service /usr/lib/systemd/system/consul-server-cluster.service
cp -f /opt/consul-cluster/bin/consul /usr/bin/
ln -sf /opt/consul-cluster/script/consul_path_setup.sh /etc/profile.d/
