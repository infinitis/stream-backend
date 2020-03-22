FROM debian:latest

RUN apt-get update
RUN apt-get install -y nginx-light libnginx-mod-rtmp ffmpeg

COPY nginx.conf /etc/nginx/

CMD nginx -g 'daemon off;'