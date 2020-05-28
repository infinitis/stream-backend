#!/usr/bin/env bash

set -euo pipefail

cat > /etc/nginx/nginx.conf << EOF
include /etc/nginx/modules-enabled/*.conf;

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
		notify_method get;

		application live {
			live on;
			record off;
			on_publish http://localhost:8080/auth;
			on_play http://localhost:8080/auth;
		}
	}
}
EOF

nginx -g 'daemon off;'