FROM debian:latest

RUN apt-get update
RUN apt-get install -y nginx-light libnginx-mod-rtmp ffmpeg gettext-base

COPY nginx.conf.template /etc/nginx/conf.d
COPY index.html /var/www/
COPY stream.client.min.js /var/www/stream.client.js

CMD /bin/bash -c "envsubst < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"