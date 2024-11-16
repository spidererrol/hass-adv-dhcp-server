#!/usr/bin/env bashio

shopt -s nullglob

if ! test -L /etc/dhcp; then
    mv -n /etc/dhcp/* /config/ || :
    rm -rf /etc/dhcp
    ln -s /config/ /etc/dhcp
fi

if ! test -L /var/lib/dhcp; then
    mv -n /var/lib/dhcp/* /data/ || :
    rm -rf /var/lib/dhcp
    ln -s /data/ /var/lib/dhcp
fi

exec /usr/sbin/dhcpd -f -d -user dhcp -group dhcp $(bashio::config.device)