
.$PHONY: dns_server/run
REMOTE_IMAGE:=$(DOCKER_HUB)/$(DNS_SERVER_DOCKER_IMAGE_NAME)
dns_server/run: dns_server/stop
	@echo "$@ starting."
	@echo "...launching container"
	@docker run -d \
			   --rm \
			   --name $(DNS_SERVER_DOCKER_CONTAINER_NAME) \
			   -e DOCKER_GATEWAY_IP_ADDRESS=$(DNS_SERVER_IP_ADDRESS) \
			   --publish $(DNS_SERVER_IP_ADDRESS):$(DNS_SERVER_HTTP_PORT):80 \
			   --publish $(DNS_SERVER_IP_ADDRESS):$(DNS_SERVER_PORT):53/udp $(LOCAL_IMAGE)
	@docker ps
	@echo "$@ completed."

.$PHONY: dns_server/run/local
LOCAL_IMAGE:=$(DNS_SERVER_DOCKER_IMAGE_NAME)
dns_server/run/local: dns_server/stop
	@echo "$@ starting."
	@echo "...launching container"
	@docker run -d \
			   --rm \
			   --name $(DNS_SERVER_DOCKER_CONTAINER_NAME) \
			   -e DOCKER_GATEWAY_IP_ADDRESS=$(DNS_SERVER_IP_ADDRESS) \
			   --publish $(DNS_SERVER_IP_ADDRESS):$(DNS_SERVER_HTTP_PORT):80 \
			   --publish $(DNS_SERVER_IP_ADDRESS):$(DNS_SERVER_PORT):53/udp $(LOCAL_IMAGE)
	@docker ps
	@echo "$@ completed."
