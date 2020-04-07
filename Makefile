build:
	docker build -t stream-backend-pull .

run:
	ifndef $(PULL_ENDPOINT)
		$(error PULL_ENDPOINT must be defined)
	endif
	docker run -d -p 8080:80 -p 1935:1935 -e PULL_ENDPOINT=$(PULL_ENDPOINT) stream-backend-pull