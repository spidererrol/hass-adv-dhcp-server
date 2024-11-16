#!/usr/bin/env bashio

set -x

shopt -s nullglob

ls -hal /
readlink -f /etc/dhcp/
ls -hal /etc/dhcp/
readlink -f /var/lib/dhcp/
ls -hal /var/lib/dhcp/


if ! test -L /etc/dhcp; then
    mv -n /etc/dhcp/* /config/
    rm -rf /etc/dhcp
    ln -s /config/ /etc/dhcp
fi

if ! test -L /var/lib/dhcp; then
    mv -n /var/lib/dhcp/* /data/
    rm -rf /var/lib/dhcp
    ln -s /data/ /var/lib/dhcp
fi

exec /usr/sbin/dhcpd -f -d -user dhcp -group dhcp $(bashio::condig.device)