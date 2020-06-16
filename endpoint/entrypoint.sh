#!/usr/bin/env bash

set -euo pipefail

if [[ -z "$PUSH_ENDPOINT" ]]; then
	PUSH_ENDPOINT=""
else
	PUSH_ENDPOINT="push $PUSH_ENDPOINT;"
fi

cat > /etc/nginx/nginx.conf << EOF
include /etc/nginx/modules-enabled/*.conf;

events {}
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

			$PUSH_ENDPOINT
		}
	}
}
EOF

nginx -g 'daemon off;'