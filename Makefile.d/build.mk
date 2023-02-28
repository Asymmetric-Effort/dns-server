dns_server/build:
	@echo "$@ starting."
	docker build --compress --tag $(DNS_SERVER_DOCKER_IMAGE_NAME) .
	@echo "$@ completed."
