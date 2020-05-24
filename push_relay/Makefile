IMAGE_NAME=stream-backend-push

build:
	docker build -t $(IMAGE_NAME) .

run:
ifndef PUSH_ENDPOINT
	$(error PUSH_ENDPOINT must be defined)
endif
	docker run -d -p 1936:1935 -e PUSH_ENDPOINT=$(PUSH_ENDPOINT) $(IMAGE_NAME)

push: build
ifndef VERSION
	$(error VERSION must be defined)
endif
ifndef REGISTRY
	$(error REGISTRY must be defined)
endif
	docker tag $(IMAGE_NAME) $(REGISTRY)/$(IMAGE_NAME):$(VERSION)
	docker push $(REGISTRY)/$(IMAGE_NAME):$(VERSION)