ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache dhcp-server

EXPOSE 67/udp
# VOLUME "/etc/dhcp"
# VOLUME "/var/lib/dhcp"

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]