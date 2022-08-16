#!/usr/bin/env sh

netstat -ntp | grep tcp \
 | awk '$4~/:'${SERVER_PORT:-80}'$/ {a[$6]++}; END { for(b in a) printf "container_tcp_state_count{direction=\"inbound\", state=\"%s\"} %s\n", b, a[b]}'

netstat -ntp | grep tcp \
 | awk '$4!~/:'${SERVER_PORT:-80}'$/ {a[$6]++}; END { for(b in a) printf "container_tcp_state_count{direction=\"outbound\", state=\"%s\"} %s\n", b, a[b]}'
