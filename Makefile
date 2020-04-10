build:
	docker-compose build

run:
	cd client && $(MAKE) extract
	mkdir -p pull_relay/wwwroot/
	cp client/stream.client.min.js pull_relay/wwwroot/
	cp client/index.html pull_relay/wwwroot
	docker-compose up --build endpoint pull_relay