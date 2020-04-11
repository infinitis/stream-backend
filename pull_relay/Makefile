IMAGE_NAME=stream-backend-pull

build:
	docker build -t $(IMAGE_NAME) .

run:
ifndef PULL_ENDPOINT
	$(error PULL_ENDPOINT must be defined)
endif
	docker run -d -p 8080:80 -p 1937:1935 -e PULL_ENDPOINT=$(PULL_ENDPOINT) $(IMAGE_NAME)