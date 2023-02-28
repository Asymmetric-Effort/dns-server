DOCKER_HUB:=docker.internal.asymmetric-effort.com
DNS_SERVER_DOCKER_IMAGE_NAME:=asymmetric-effort/dns-server:local
DNS_SERVER_DOCKER_CONTAINER_NAME:=dns-server
DNS_SERVER_IP_ADDRESS:=10.37.129.2
DNS_SERVER_HTTP_PORT:=8053
DNS_SERVER_PORT:=53

dns_server/help:
	@echo '$@'
	@echo 'make dns_server/build     -> build the container locally'
	@echo 'make dns_server/upload    -> upload the container to the docker hub (internal only)'
	@echo '                             (this will re-tag the container appropriately)'
	@echo 'make dns_server/run       -> run the container from the docker hub'
	@echo 'make dns_server/run-local -> run the container locally (for bootstrapping)'
	@echo 'make dns_server/logs      -> tail the logs of a running DNS server'
	@echo 'make dns_server/stop      -> stop the DNS server'
	@exit 0

include Makefile.d/*.mk
