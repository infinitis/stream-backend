FROM debian:latest

RUN apt-get update
RUN apt-get install -y nginx-light libnginx-mod-rtmp ffmpeg

COPY nginx.conf /etc/nginx/
COPY var_template /etc/nginx/conf.d/

envsubst < /etc/nginx/conf.d/var_template > /etc/nginx/nginx.conf

CMD /bin/bash -c "envsubst < /etc/nginx/conf.d/var_template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"