FROM debian:latest

RUN apt-get update
RUN apt-get install -y nginx-light libnginx-mod-rtmp

# COPY nginx.conf /etc/nginx/

CMD nginx