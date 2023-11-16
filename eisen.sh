echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install nginx git php7.3 php7.3-fpm htop -y
apt-get install apache2-utils -y

service php7.3-fpm start
service nginx start
echo 'upstream worker {
        # least_conn;
        # ip_hash;
        # hash $request_uri consistent;
#        server 192.170.3.1;
 #        server 192.170.3.2;
#         server 192.170.3.3;

        server 192.170.3.1 weight=640;
        server 192.170.3.2 weight=200;
        server 192.170.3.3 weight=25;
}

server {
        listen 80;
        server_name granz.channel.A03.com;

        location / {
                proxy_pass http://worker;
                proxy_set_header    X-Real-IP $remote_addr;
                proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header    Host $http_host;

                auth_basic "Restricted";
                auth_basic_user_file /etc/nginx/rahasiakita/.htpasswd;

                allow 192.170.3.69;
                allow 192.170.3.70;
                allow 192.170.4.167;
                allow 192.170.4.168;
                deny all;
        }

        location /its {
                proxy_pass https://www.its.ac.id;
        }

        location ~ /\.ht {
                deny all;
        }

        error_log /var/log/nginx/lb_error.log;
        access_log /var/log/nginx/lb_access.log;
}

upstream laravel {
    server 192.170.4.1;
    server 192.170.4.2;
    server 192.170.4.3;
}

server {
    listen 8000;
    server_name riegel.canyon.A03.com;

    location / {
        proxy_pass http://laravel;
        proxy_set_header    X-Real-IP $remote_addr;
        proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header    Host $http_host;
    }

    location /frieren/ {
        proxy_bind 192.170.2.1;
        proxy_pass http://192.170.4.1/index.php;
    }

    location /flamme/ {
        proxy_bind 192.170.2.1;
        proxy_pass http://192.170.4.2/index.php;
    }

    location /fern/ {
        proxy_bind 192.170.2.1;
        proxy_pass http://192.170.4.3/index.php;
    }

    error_log /var/log/nginx/lb_error.log;
    access_log /var/log/nginx/lb_access.log;
}' > /etc/nginx/sites-available/lb-php

ln -s /etc/nginx/sites-available/lb-php /etc/nginx/sites-enabled
unlink /etc/nginx/sites-enabled/default

mkdir /etc/nginx/rahasiakita/
htpasswd -bc /etc/nginx/rahasiakita/.htpasswd netics ajkA03

service nginx restart
