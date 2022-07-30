FROM alpine

RUN apk add --no-cache \
    supervisor \
    ipmitool \
    python3 \
    && addgroup -S mumble-server && adduser -S mumble-server -G mumble-server

COPY supervisord.conf /etc/supervisord.conf
COPY tempmon.sh /usr/bin/tempmon.sh

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
