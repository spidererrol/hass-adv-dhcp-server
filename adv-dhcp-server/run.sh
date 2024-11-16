#!/usr/bin/with-contenv bashio

echo "Starting at $(date)"

shopt -s nullglob

if ! test -L /etc/dhcp; then
    mv -n /etc/dhcp/* /config/ || :
    rm -rf /etc/dhcp
    ln -s /config/ /etc/dhcp
fi

if [ ! -e /var/lib/dhcp/dhcpd.leases ]; then
    touch /var/lib/dhcp/dhcpd.leases
fi

if ! test -L /var/lib/dhcp; then
    mv -n /var/lib/dhcp/* /data/ || :
    rm -rf /var/lib/dhcp
    ln -s /data/ /var/lib/dhcp
fi

exec /usr/sbin/dhcpd -f -d -user dhcp -group dhcp $(bashio::config device)