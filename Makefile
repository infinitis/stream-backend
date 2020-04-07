build:
	docker build -t stream-backend-push .

run:
	ifndef PUSH_ENDPOINT
		$(error PUSH_ENDPOINT must be defined)
	endif
	docker run -d -p 8080:80 -p 1935:1935 -e PUSH_ENDPOINT=$(PUSH_ENDPOINT) stream-backend-push