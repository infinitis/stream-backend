build:
	docker-compose build

run:
	cd client && $(MAKE) extract
	mkdir -p pull_relay/wwwroot/
	cp client/stream.client.js pull_relay/
	cp client/index.html pull_relay/
	docker-compose up --build endpoint pull_relay