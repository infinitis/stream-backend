FILENAME=stream.client.min.js
DEBUG_FILENAME=stream.client.js

IMAGE_NAME=stream-backend-client-test

PACKAGE_MODIFICATION_CONTAINER_NAME=client_package_init

BUILD_ARGS=
DEBUG_BUILD_ARGS='--build-arg BUILD_COMMAND=build:dev '

build:
	docker build -t stream-backend-client $(BUILD_ARGS) .

run:
	docker run -d -p "8080:8080" --read-only -v `pwd`/src/:/home/node/app/src/ --name $(IMAGE_NAME) stream-backend-client

extract: build run
	docker cp $(IMAGE_NAME):/home/node/app/$(FILENAME) ./$(FILENAME)
	$(MAKE) stop

extract-dev:
	$(MAKE) extract FILENAME=$(DEBUG_FILENAME) BUILD_ARGS=$(DEBUG_BUILD_ARGS)

start: build
	-docker run -it --rm -p "8080:8080" --read-only -v `pwd`/src/:/home/node/app/src/ --name $(IMAGE_NAME) stream-backend-client

stop:
	docker stop $(IMAGE_NAME)
	docker rm $(IMAGE_NAME)

package_init:
	docker run -d --name $(PACKAGE_MODIFICATION_CONTAINER_NAME) node:latest tail -f /dev/null
	docker cp package.json $(PACKAGE_MODIFICATION_CONTAINER_NAME):/home/node/
	docker cp package-lock.json $(PACKAGE_MODIFICATION_CONTAINER_NAME):/home/node/

package_extract:
	docker cp $(PACKAGE_MODIFICATION_CONTAINER_NAME):/home/node/package.json ./package.json
	docker cp $(PACKAGE_MODIFICATION_CONTAINER_NAME):/home/node/package-lock.json ./package-lock.json
	docker stop $(PACKAGE_MODIFICATION_CONTAINER_NAME)
	docker rm $(PACKAGE_MODIFICATION_CONTAINER_NAME)

inspect:
	docker exec -it $$(docker container ls -q -f name=$(PACKAGE_MODIFICATION_CONTAINER_NAME)) /bin/bash