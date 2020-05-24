#!/usr/bin/env bash

set -euo pipefail

cat > /etc/nginx/nginx.conf << EOF
include /etc/nginx/modules-enabled/*.conf;

events {
	worker_connections 768;
	# multi_accept on;
}

http {
	server {
		listen 8080;
		
		location /auth {
			if (\$arg_key = '$ENDPOINT_KEY') {
				return 201;
			}
			return 401;
		}
	}
}

rtmp {
	server {
		listen 1935;

		application live {
			live on;
			record off;
			on_publish http://localhost:8080/auth;
			on_play http://localhost:8080/auth;
		}
	}
}
EOF

cat /etc/nginx/nginx.conf

nginx -g 'daemon off;'