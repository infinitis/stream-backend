STREAM_CLIENT_JS_FILENAME=stream.client.min.js
CLIENT_JS_BUILD_COMMAND=

build:
	docker-compose build

run-dev:
	$(MAKE) run STREAM_CLIENT_JS_FILENAME=stream.client.js CLIENT_JS_BUILD_COMMAND=build:dev

run: build
	cd client && $(MAKE) extract BUILD_COMMAND=$(CLIENT_JS_BUILD_COMMAND)
	mkdir -p pull_relay/wwwroot/
	cp client/$(STREAM_CLIENT_JS_FILENAME) pull_relay/
	cp client/index.html pull_relay/
	docker-compose up endpoint pull_relay