FROM alpine:latest

MAINTAINER niuyuxian <ncc0706@gmail.com>

RUN apk --update add py-pip && \
	pip install shadowsocks && \
	rm -rf /tmp/* && \
	rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/ssserver"]