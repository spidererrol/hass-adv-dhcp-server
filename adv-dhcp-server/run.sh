#!/usr/bin/env bashio

bashio::config.config > /etc/dhcp/dhcpd.conf

exec /usr/sbin/dhcpd -f -d -user dhcp -group dhcp $(bashio::condig.device)