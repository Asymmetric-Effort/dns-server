dns_server/initialize:
	@echo "$@ starting"
	mkdir -p $(DNS_SERVER_VOLUME) || true
	@echo "$@ completed"

.$PHONY: dns_server/run
REMOTE_IMAGE:=$(DOCKER_HUB)/$(DNS_SERVER_DOCKER_IMAGE_NAME)
dns_server/run: dns_server/stop dns_server/initialize
	@echo "$@ starting."
	@echo "...launching container"
	@docker run -d \
			   --rm \
			   --name $(DNS_SERVER_DOCKER_CONTAINER_NAME) \
			   --publish $(DNS_SERVER_IP_ADDRESS):$(DNS_SERVER_PORT):53 $(LOCAL_IMAGE)
	@docker ps
	@echo "$@ completed."

.$PHONY: dns_server/run/local
LOCAL_IMAGE:=$(DNS_SERVER_DOCKER_IMAGE_NAME)
dns_server/run/local: dns_server/stop dns_server/initialize
	@echo "$@ starting."
	@echo "...launching container"
	@docker run -d \
			   --rm \
			   --name $(DNS_SERVER_DOCKER_CONTAINER_NAME) \
			   --publish $(DNS_SERVER_IP_ADDRESS):$(DNS_SERVER_PORT):53 $(LOCAL_IMAGE) .
	@docker ps
	@echo "$@ completed."
