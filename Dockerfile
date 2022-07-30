FROM alpine

RUN apk add --no-cache \
    supervisor \
    ipmitool \
    python3 \
    && addgroup -S mumble-server && adduser -S mumble-server -G mumble-server

COPY supervisord.conf /etc/supervisord.conf
COPY tempmon.sh /usr/bin/tempmon.sh
COPY simple.py /usr/bin/simple.py

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
