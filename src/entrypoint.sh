#!/bin/bash -e

RUN chmod -R bind:bind /etc/bind/

start_bind(){
  /usr/sbin/named -4 -c /etc/bind/named.conf -p 53 -u bind -f -g
}
start_nginx(){
  nginx -c /etc/nginx/nginx.conf
}

start_bind &
start_nginx