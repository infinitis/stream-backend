build:
	docker build -t stream-backend-client .

run:
	docker run -d -p "8080:80" stream-backend-client