FROM alpine:3.4
MAINTAINER Hubert Chathi <hubert@muchlearning.org>
RUN apk add --update tinc iptables \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /etc/tinc \
    && ln -s /etc/tinc/config/config /etc/tinc/tinc.conf \
    && ln -s script /etc/tinc/tinc-up \
    && ln -s script /etc/tinc/tinc-down \
    && ln -s script /etc/tinc/host-up \
    && ln -s script /etc/tinc/host-down \
    && ln -s script /etc/tinc/subnet-up \
    && ln -s script /etc/tinc/subnet-down
COPY script /etc/tinc/script
COPY start /usr/local/sbin/start-tinc
CMD ["/usr/local/sbin/start-tinc"]
