FROM alpine

RUN apk add --no-cache \
    supervisor \
    ipmitool \
    && addgroup -S mumble-server && adduser -S mumble-server -G mumble-server

COPY supervisord.conf /etc/supervisord.conf
COPY tempmon.sh /usr/bin/tempmon.sh

VOLUME ["/var/run/libvirt/", "/var/lib/libvirt"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
