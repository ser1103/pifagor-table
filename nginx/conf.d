server {
    listen 80;
	server_name angela-numerolog.ru;

    location ~ /.well-known/acme-challenge{
        allow all;
        root /usr/share/nginx/html/letsencrypt;
    }

        location / {
        return 301 https://angela-numerolog.ru$request_uri;
    }
}

server {
     listen 443 ssl http2;
     server_name angela-numerolog.ru;

     ssl on;
     server_tokens off;
     ssl_certificate /etc/nginx/ssl/live/angela-numerolog.ru/fullchain.pem;
     ssl_certificate_key /etc/nginx/ssl/live/angela-numerolog.ru/privkey.pem;
     ssl_dhparam /etc/nginx/dhparam/dhparam-2048.pem;

     ssl_buffer_size 8k;
     ssl_protocols TLSv1.2 TLSv1.1 TLSv1;
     ssl_prefer_server_ciphers on;
     ssl_ciphers ECDH+AESGCM:ECDH+AES256:ECDH+AES128:DH+3DES:!ADH:!AECDH:!MD5;

    location / {
        index index.html;
    }

}