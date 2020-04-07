build:
	docker build -t stream-backend .

run:
	docker run -d -p 8080:80 -p 1935:1935 -e PUSH_ENDPOINT=$(PUSH_ENDPOINT) stream-backend