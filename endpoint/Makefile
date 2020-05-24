IMAGE_NAME=stream-backend-endpoint

build:
	docker build -t $(IMAGE_NAME) .

push: build
ifndef VERSION
	$(error VERSION must be defined)
endif
ifndef REGISTRY
	$(error REGISTRY must be defined)
endif
	docker tag $(IMAGE_NAME) $(REGISTRY)/$(IMAGE_NAME):$(VERSION)
	docker push $(REGISTRY)/$(IMAGE_NAME):$(VERSION)