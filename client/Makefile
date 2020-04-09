build:
	docker build -t stream-backend-client .

run:
	docker run -d -p "8080:80" stream-backend-client

package_init:
	docker run -d --name client_package_init node:latest tail -f /dev/null
	docker cp package.json client_package_init:/home/node/
	docker cp package-lock.json client_package_init:/home/node/

package_extract:
	docker cp client_package_init:/home/node/package.json ./package.json
	docker cp client_package_init:/home/node/package-lock.json ./package-lock.json
	docker stop client_package_init

inspect:
	docker exec -it $(docker container ls -q -f name=client_package_init) /bin/bash