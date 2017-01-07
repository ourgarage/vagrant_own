#!/usr/bin/env bash

NGINX_DEFAULT="server {

    root /home/html/$DEFAULT_PROJECT/public;
    index index.php index.html index.htm;

    location ~ \.php$ {
         try_files $uri /index.php =404;
         fastcgi_pass unix:/var/run/php/php7.1-fpm.sock;
         fastcgi_index index.php;
         fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
         include fastcgi_params;
    }

    location / {
        try_files $uri $uri/ /index.php$is_args$args;
    }

}
"
