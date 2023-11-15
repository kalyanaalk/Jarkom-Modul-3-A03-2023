apt-get update
apt-get install nginx git php7.3 php7.3-fpm -y
service php7.3-fpm start
service nginx start
apt-get install wget
apt-get install unzip
wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1ViSkRq7SmwZgdK64eRbr5Fm1EGCTPrU1' -O granz.channel.A03.com
unzip granz.channel.A03.com
mv modul-3 /var/www
echo 'server {
    listen 80;
    root /var/www/modul-3;
    index index.php index.html index.htm;
    server_name granz.channel.A03.com;
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }
    # pass PHP scripts to FastCGI server
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
    }
    location ~ /\.ht {
        deny all;
    }
    error_log /var/log/nginx/jarkom_error.log;
    access_log /var/log/nginx/jarkom_access.log;
}

' > /etc/nginx/sites-available/modul-3

ln -s /etc/nginx/sites-available/modul-3 /etc/nginx/sites-enabled
unlink /etc/nginx/sites-enabled/default
service php7.3-fpm restart
service nginx restart