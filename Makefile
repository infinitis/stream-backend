CLIENT_JS_FILENAME=stream.client.min.js
export VERSION:=`git describe 2>/dev/null || cat tag`

build:
	docker-compose build

start:
	cd client && $(MAKE) extract-dev
	$(MAKE) run

copy_client:
	cp client/$(CLIENT_JS_FILENAME) pull_relay/
	cp client/index.html pull_relay/

run: copy_client
	docker-compose up --build

push:
	echo "Pushing tag $(VERSION)"
	cd endpoint && $(MAKE) push
	cd pull_relay && $(MAKE) push