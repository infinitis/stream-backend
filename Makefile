CLIENT_JS_FILENAME=stream.client.min.js

build:
	docker-compose build

run-dev:
	cd client && $(MAKE) extract-dev
	$(MAKE) start

run:
	cd client && $(MAKE) extract
	$(MAKE) start
	
copy_client:
	cp client/$(CLIENT_JS_FILENAME) pull_relay/
	cp client/index.html pull_relay/

start: copy_client
	docker-compose up --build endpoint pull_relay