dns_server/stop:
	@echo "$@ running"
	docker kill $(DNS_SERVER_DOCKER_CONTAINER_NAME) || true
	@echo "$@ done"