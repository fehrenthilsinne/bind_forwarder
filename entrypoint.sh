#!/bin/sh

set -e

echo -e "options {\n\tdirectory \"/var/bind\";\n\tdnssec-validation no;\
	\n\tauth-nxdomain no;\n\tlisten-on-v6 { any; };\
	\n\tpid-file \"/var/run/named/named.pid\";\
	\n\n\tforwarders{\n\t\t$( printenv DNS_FORWARDER );\
	\n\t};\n\n\tallow-query {\n\t\t$( printenv ALLOW_QUERY );\n\t};\n};"\
	 > /etc/bind/named.conf.options

exec /usr/sbin/named -f
