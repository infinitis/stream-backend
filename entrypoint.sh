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
		listen 80;
		
		location /dash {
			types {
				application/vnd.apple.mpegurl m3u8;
			}
			root /tmp;
			add_header Cache-Control no-cache;

			# To avoid issues with cross-domain HTTP requests (e.g. during development)
            add_header Access-Control-Allow-Origin *;
        }

    	root /var/www/;
        
        location / {
    		index	index.html;
        }

        location ~ \.js {
		    add_header  Content-Type    application/x-javascript;
		}
    }
}

rtmp {
	server {
		listen 1935;
		
		application src {
			live on;
			pull $PULL_ENDPOINT?key=$ENDPOINT_KEY name=source static live=1;

			dash on;
			dash_path /tmp/dash;
			dash_nested on;
		}
	}
}
EOF

nginx -g 'daemon off;'