#!/bin/bash

rm -f /usr/lib/systemd/system/consul*service
rm -f /usr/lib/systemd/system/consul*service
cp -f /opt/consul-internal/etc/systemd/consul-client.service /usr/lib/systemd/system/consul-client-internal.service
cp -f /opt/consul-internal/bin/consul /usr/bin/
ln -sf /opt/consul-internal/script/consul_path_setup.sh /etc/profile.d/



