FROM debian:latest

RUN apt-get update
RUN apt-get install -y nginx-light libnginx-mod-rtmp gettext-base

COPY nginx.conf.template /etc/nginx/conf.d

CMD /bin/bash -c "envsubst < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"