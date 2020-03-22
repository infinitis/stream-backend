FROM debian:latest

RUN apt-get update
RUN apt-get install -y nginx-light libnginx-mod-rtmp ffmpeg

COPY nginx.conf /etc/nginx/

RUN echo "push ${PUSH_ENDPOINT};" >> /etc/nginx/conf.d/var_template

RUN envsubst < /etc/nginx/conf.d/var_template > /etc/nginx/nginx.conf

CMD nginx -g 'daemon off;'