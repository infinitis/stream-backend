#!/usr/bin/env bash

set -euo pipefail

cat > /etc/nginx/nginx.conf << EOF
include /etc/nginx/modules-enabled/*.conf;

events {
	worker_connections 768;
	# multi_accept on;
}

rtmp {
	server {
		listen 1935;

		application live {
			live on;
			record off;
			push $PUSH_ENDPOINT;
		}
	}
}
EOF

nginx -g 'daemon off;'