build:
	docker build -t stream-backend-client .

run:
	docker run -d -p "8080:8080" --read-only -v `pwd`/src/:/home/node/app/src/ --name stream-backend-client-test stream-backend-client

start: build
	-docker run -it --rm -p "8080:8080" --read-only -v `pwd`/src/:/home/node/app/src/ --name stream-backend-client-test stream-backend-client

stop:
	docker stop stream-backend-client-test
	docker rm stream-backend-client-test

package_init:
	docker run -d --name client_package_init node:latest tail -f /dev/null
	docker cp package.json client_package_init:/home/node/
	docker cp package-lock.json client_package_init:/home/node/

package_extract:
	docker cp client_package_init:/home/node/package.json ./package.json
	docker cp client_package_init:/home/node/package-lock.json ./package-lock.json
	docker stop client_package_init
	docker rm client_package_init

inspect:
	docker exec -it $$(docker container ls -q -f name=client_package_init) /bin/bash