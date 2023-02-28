#!/bin/bash -e

start_bind(){
  for i in $(find /etc/bind/ -type f -name "db.*"); do
    sed -i -e "s/{{SERIAL}}/$(date +%s)/g" ${i}
    sed -i -e "s/{{DOCKER_GATEWAY_IP_ADDRESS}}/${DOCKER_GATEWAY_IP_ADDRESS}/g" ${i}
  done


  /usr/sbin/named -4 -c /etc/bind/named.conf -p 53 -u bind -f -g
}
start_nginx(){
  nginx -c /etc/nginx/nginx.conf
}

start_nginx &
start_bind
