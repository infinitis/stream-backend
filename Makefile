build:
	docker build -t stream-backend-endpoint .

run:
	docker run -d -p 1935:1935 stream-backend-endpoint