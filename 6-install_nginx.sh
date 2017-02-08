#!/bin/sh

apt install -y nginx

#chmod 777 /run/php/php7.0-fpm.sock

#sed -i.bak "s/user www-data;/user root;/g" /etc/nginx/nginx.conf
#sed -i.bak "s/listen.owner = www-data/listen.owner = root/g" /etc/php/7.0/fpm/pool.d/www.conf
#sed -i.bak "s/listen.group = www-data/listen.group = root/g" /etc/php/7.0/fpm/pool.d/www.conf
#sed -i.bak "s/;listen.mode = 0660/listen.mode = 0660/g" /etc/php/7.0/fpm/pool.d/www.conf

mkdir /run/php
mkdir /log

rm /etc/nginx/sites-available/default

cat > /etc/nginx/sites-available/rutorrent <<'EOS'
# Forward PHP requests to php-fpm
upstream php-handler {
  server unix:/run/php/php7.0-fpm.sock;
}

server {
  listen 80 default_server;

  root /var/www/rutorrent;
  index index.php index.html;

  server_name _;

  # Send PHP files to our PHP handler
  location ~ .php$ {
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass php-handler;
    fastcgi_index index.php;
    include fastcgi.conf;
  }
}
EOS

ln -s /etc/nginx/sites-available/rutorrent /etc/nginx/sites-enabled/rutorrent

#cat > /etc/nginx/sites-enabled/default <<'EOS'
#server {
#    listen 80;
#    root /usr/share/nginx/html/rutorrent;
#
#    error_log /var/log/nginx/rutorrent_error.log;
#    access_log /var/log/nginx/rutorrent_access.log;
#
#    location /RPC2 {
#        scgi_pass 127.0.0.1:5000;
#        include scgi_params;
#    }
#    location ~ \.php$ {
#        try_files $uri =404;
#        fastcgi_pass unix:///run/php/php7.0-fpm.sock;
#        include fastcgi_params;
#        fastcgi_param SCRIPT_FILENAME $request_filename;
#        fastcgi_read_timeout 300;
#    }
#}
#EOS

