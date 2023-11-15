echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install nginx git php7.3 php7.3-fpm -y
service php7.3-fpm start
service nginx start
echo '
upstream worker {
        server 192.170.3.1 weight=4;
        server 192.170.3.2 weight=2;
        server 192.170.3.3 weight=1;
}

server {
        listen 80;
        server_name granz.channel.A03.com;

        location / {
                proxy_pass http://worker;
                proxy_set_header    X-Real-IP $remote_addr;
                proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header    Host $http_host;
        }

        error_log /var/log/nginx/lb_error.log;
        access_log /var/log/nginx/lb_access.log;
}

' > /etc/nginx/sites-available/lb-php

ln -s /etc/nginx/sites-available/lb-php /etc/nginx/sites-enabled
unlink /etc/nginx/sites-enabled/default
service nginx restart
