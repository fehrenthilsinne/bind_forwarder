FROM arm32v7/alpine

LABEL maintainer="fehren"

RUN apk add --no-cache bind;\
	rm -rf /etc/bind/named.conf.*

COPY named.conf /etc/bind/named.conf
COPY named.conf.default-zones /etc/bind/named.conf.default-zones
COPY entrypoint.sh /sbin/entrypoint.sh

RUN chmod o+x /sbin/entrypoint.sh

EXPOSE 53/udp 53/tcp

ENTRYPOINT ["/sbin/entrypoint.sh"]

#CMD ["/usr/sbin/named", "-f"]
