# Jarkom-Modul-3-A03-2023

Kelompok: A03

Nama: Kalyana Putri Al Kanza

NRP: 5025211137

## Topologi

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175435487440293979/image.png?ex=656b389a&is=6558c39a&hm=27df255a629a9504e94524b602e4c3d27693bc5c704da016ad9ed64f4f46467b&)

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175436407662202940/image.png?ex=656b3976&is=6558c476&hm=a281fc860fadd04a6a455c5977a64a30ecf1052a3c9087a25d1a588dd8b97f5c&)

## Konfigurasi

### Aura (Router, DHCP Relay)

```
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 192.170.1.211
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 192.170.2.211
	netmask 255.255.255.0

auto eth3
iface eth3 inet static
	address 192.170.3.211
	netmask 255.255.255.0

auto eth4
iface eth4 inet static
	address 192.170.4.211
	netmask 255.255.255.0
```

### Himmel (DHCP Server)

```
auto eth0
iface eth0 inet static
	address 192.170.1.2
	netmask 255.255.255.0
	gateway 192.170.1.211
```

### Heiter

```
auto eth0
iface eth0 inet static
	address 192.170.1.1
	netmask 255.255.255.0
	gateway 192.170.1.211
```

### Denken

```
auto eth0
iface eth0 inet static
	address 192.170.2.2
	netmask 255.255.255.0
	gateway 192.170.2.211
```

### Eisen

```
auto eth0
iface eth0 inet static
	address 192.170.2.1
	netmask 255.255.255.0
	gateway 192.170.2.211
```

### Lawine

```
auto eth0
iface eth0 inet dhcp
hwaddress ether f2:d9:57:88:76:8a
```

### Linie

```
auto eth0
iface eth0 inet dhcp
hwaddress ether be:ca:cb:88:8d:89
```

### Lugner

```
auto eth0
iface eth0 inet dhcp 
hwaddress ether e2:ef:4a:fe:72:cb
```

### Fern

```
auto eth0
iface eth0 inet dhcp
hwaddress ether d6:cb:f6:76:57:7f
```

### Flamme

```
auto eth0
iface eth0 inet dhcp
hwaddress ether 2e:92:2c:b3:22:25
```

### Frieren

```
auto eth0
iface eth0 inet dhcp
hwaddress ether 12:c2:84:56:23:af
```

### Revolte

```
auto eth0
iface eth0 inet dhcp
```

### Richter

```
auto eth0
iface eth0 inet dhcp
```

### Sein 

```
auto eth0
iface eth0 inet dhcp
```

### Stark

```
auto eth0
iface eth0 inet dhcp
```

## Soal 0

#### Kali ini, kalian diminta untuk melakukan register domain berupa riegel.canyon.yyy.com untuk worker Laravel dan granz.channel.yyy.com untuk worker PHP (0) mengarah pada worker yang memiliki IP [prefix IP].x.1.

Untuk register domain, lakukan command berikut di DNS server.

```
apt-get update
apt-get install bind9 -y

echo '
zone "riegel.canyon.A03.com" {
        type master;
        file "/etc/bind/jarkom/riegel.canyon.A03.com";
};


zone "granz.channel.A03.com" {
        type master;
        file "/etc/bind/jarkom/granz.channel.A03.com";
};
' > /etc/bind/named.conf.local

mkdir /etc/bind/jarkom

cp /etc/bind/db.local /etc/bind/jarkom/riegel.canyon.A03.com
cp /etc/bind/db.local /etc/bind/jarkom/granz.channel.A03.com

echo '

;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.A03.com. root.riegel.canyon.A03.com. (
                        2022100601      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      riegel.canyon.A03.com.
@       IN      A       192.170.4.1             ; IP Fern
www     IN      CNAME   riegel.canyon.A03.com.
@       IN      AAAA    ::1

' > /etc/bind/jarkom/riegel.canyon.A03.com

echo '

;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     granz.channel.A03.com. root.granz.channel.A03.com. (
                        2022100601      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      granz.channel.A03.com.
@       IN      A       192.170.3.1             ; IP Lawine
www     IN      CNAME   granz.channel.A03.com.
@       IN      AAAA    ::1

' > /etc/bind/jarkom/granz.channel.A03.com

service bind9 restart
```

Berikut hasil ping ke kedua domain tersebut.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175767784387530752/image.png?ex=656c6e14&is=6559f914&hm=ae7b986a322b33766f8febe9e984826aa133540a63eaff8124930f3e71c2279c&)

## Soal 1

#### Lakukan konfigurasi sesuai dengan peta yang sudah diberikan.

Di file /etc/default/isc-dhcp-server yang terletak di DHCP server, atur INTERFACEv4 menjadi eth0.

```
echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server
```

Pada Aura, selaku router dan DHCP relay, diberikan konfigurasi berikut.

```
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 192.170.1.211
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 192.170.2.211
	netmask 255.255.255.0

auto eth3
iface eth3 inet static
	address 192.170.3.211
	netmask 255.255.255.0

auto eth4
iface eth4 inet static
	address 192.170.4.211
	netmask 255.255.255.0
```

Pada DHCP server, DNS server, database server, dan load balancer, ip address juga static dan di-assign secara manual.

```
auto eth0
iface eth0 inet static
	address 192.170.x.x
	netmask 255.255.255.0
	gateway 192.170.x.211
```

Pada client, ip address bersifat dynamic.

```
auto eth0
iface eth0 inet dhcp
```

Pada laravel worker dan PHP worker, digunakan fix address, dengan hwaddress diambil dari link/ether yang interface-nya berhubungan dengan DHCP relay.

```
auto eth0
iface eth0 inet dhcp
hwaddress ether xx:xx:xx:xx:xx:xx
```

Untuk fix address, dilakukan juga  konfigurasi berikut di file /etc/dhcp/dhcpd.conf di DNS server. 

```
host nama_node {
    hardware ethernet xx:xx:xx:xx:xx:xx;
    fixed-address 192.170.x.x;
}
```

Lalu lakukan restart dhcp server di DNS server.

```
service isc-dhcp-server restart
```

## Soal 2

#### Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.16 - [prefix IP].3.32 dan [prefix IP].3.64 - [prefix IP].3.80 

Lakukan konfigurasi berikut di file /etc/dhcp/dhcpd.conf di DNS server untuk client yang melalui switch 3 (memiliki ip 192.170.3.x)

```
subnet 192.170.3.0 netmask 255.255.255.0 {
    range 192.170.3.16 192.170.3.32;
    range 192.170.3.64 192.170.3.80;
    option routers 192.170.3.211;
    option broadcast-address 192.170.3.255;
    option domain-name-servers 192.170.1.1;
    default-lease-time 180;
    max-lease-time 5760;
}
```

Lalu lakukan restart dhcp server di DNS server.

```
service isc-dhcp-server restart
```

Berikut adalah salah satu client yang melewati switch 3.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175769877361991780/image.png?ex=656c7007&is=6559fb07&hm=be09ff037d55a99f9cd288a87920eb96eeff3a09baeffdcacc233f7fda1c22ff&)

## Soal 3

#### Client yang melalui Switch4 mendapatkan range IP dari [prefix IP].4.12 - [prefix IP].4.20 dan [prefix IP].4.160 - [prefix IP].4.168 

Lakukan konfigurasi berikut di file /etc/dhcp/dhcpd.conf di DNS server untuk client yang melalui switch 4 (memiliki ip 192.170.4.x)

```
subnet 192.170.4.0 netmask 255.255.255.0 {
    range 192.170.4.16 192.170.4.32;
    range 192.170.4.64 192.170.4.80;
    option routers 192.170.4.211;
    option broadcast-address 192.170.4.255;
    option domain-name-servers 192.170.1.1;
    default-lease-time 720;
    max-lease-time 5760;
}
```

Lalu lakukan restart dhcp server di DNS server.

```
service isc-dhcp-server restart
```

Berikut adalah salah satu client yang melewati switch 4.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175769896538357780/image.png?ex=656c700c&is=6559fb0c&hm=a493ed111bf8a94fa3d1dcaac6d7c7e63dd1a9174f234b4e9fa6344f5ec06a7e&)

## Soal 4

#### Client mendapatkan DNS dari Heiter dan dapat terhubung dengan internet melalui DNS tersebut

Untuk dapat mengakses jaringan keluar, masukkan command berikut di router.

```
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.170.0.0/16
```

Lalu lakukan forwarding dari DNS server.

```
echo nameserver 192.168.122.1 > /etc/resolv.conf

echo 'options {
        directory "/var/cache/bind";

        forwarders {
                192.168.122.1;
        };

        // dnssec-validation auto;
        allow-query{any;};
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
}; ' >/etc/bind/named.conf.options
```

Berikut hasil ping google dari client.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175768593703641178/image.png?ex=656c6ed5&is=6559f9d5&hm=70e5d991ed86edb91c4a85c8e26a852cc8649745da55cd75a2e49ecd8c76f8f3&)

## Soal 5

#### Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch3 selama 3 menit sedangkan pada client yang melalui Switch4 selama 12 menit. Dengan waktu maksimal dialokasikan untuk peminjaman alamat IP selama 96 menit

Pada subnet yang dilakukan di /etc/dhcp/dhcpd.conf di DNS server (nomor 2 dan 3), atur default-lease-time dan max-lease-time menggunakan satuan detik. 

Berikut untuk client yang melalui switch 3.

```
    default-lease-time 180;
    max-lease-time 5760;
```

Berikut untuk client yang melalui switch 4.

```
    default-lease-time 720;
    max-lease-time 5760;
```

Lalu lakukan restart dhcp server di DNS server.

```
service isc-dhcp-server restart
```

Berikut adalah lease time dari client yang melalui switch 3 dan 4.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175769877361991780/image.png?ex=656c7007&is=6559fb07&hm=be09ff037d55a99f9cd288a87920eb96eeff3a09baeffdcacc233f7fda1c22ff&)
![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175769896538357780/image.png?ex=656c700c&is=6559fb0c&hm=a493ed111bf8a94fa3d1dcaac6d7c7e63dd1a9174f234b4e9fa6344f5ec06a7e&)

## Soal 6

#### Pada masing-masing worker PHP, lakukan konfigurasi virtual host untuk website berikut dengan menggunakan php 7.3

Lakukan instalasi berikut di PHP worker.

```
apt-get update
apt-get install nginx git php7.3 php7.3-fpm -y

service php7.3-fpm start
service nginx start

```

Download folder website menggunakan command berikut dan masukkan ke folder /var/www.

```
apt-get install wget
apt-get install unzip

wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1ViSkRq7SmwZgdK64eRbr5Fm1EGCTPrU1' -O granz.channel.A03.com
unzip granz.channel.A03.com
mv modul-3 /var/www
```

Buat file berikut di /etc/nginx/sites-available/

```
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

```

Link file tersebut ke sites-enabled dan hapus file default di sites-enabled, lalu lakukan restart php dan nginx.

```
ln -s /etc/nginx/sites-available/modul-3 /etc/nginx/sites-enabled
unlink /etc/nginx/sites-enabled/default
service php7.3-fpm restart
service nginx restart
```

Berikut adalah hasil lynx masing-masing worker di client.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175828916666105996/image.png?ex=656ca703&is=655a3203&hm=d4ecc0fbb8346f6465ab8d36a08816eb6e44b721cb17bdec0ddcb9150a79f816&)

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175828969371734108/image.png?ex=656ca710&is=655a3210&hm=97311222cf985d16d772231abf77487109ebec60281948b673d4cdcbfb1bd6ce&)

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175829079950377020/image.png?ex=656ca72a&is=655a322a&hm=ced3d642c8a665b036934b362103cbc844c111c5b24b82ceed80191116d71ba6&)

## Soal 7

#### Kepala suku dari Bredt Region memberikan resource server sebagai berikut:

#### a. Lawine, 4GB, 2vCPU, dan 80 GB SSD.

#### b. Linie, 2GB, 2vCPU, dan 50 GB SSD.

#### c. Lugner 1GB, 1vCPU, dan 25 GB SSD.

#### aturlah agar Eisen dapat bekerja dengan maksimal, lalu lakukan testing dengan 1000 request dan 100 request/second.

Pada /etc/bind/jarkom/granz.channel.A03.com dan /etc/bind/jarkom/riegel.canyon.A03.com yang terletak di DNS server, ubah IP Fern dan IP Lawine menjadi IP load balancer (Eisen).

```
echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.A03.com. root.riegel.canyon.A03.com. (
                        2022100601      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      riegel.canyon.A03.com.
@       IN      A       192.170.2.1             ; IP Fern
www     IN      CNAME   riegel.canyon.A03.com.
@       IN      AAAA    ::1

' > /etc/bind/jarkom/riegel.canyon.A03.com

echo '

;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     granz.channel.A03.com. root.granz.channel.A03.com. (
                        2022100601      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      granz.channel.A03.com.
@       IN      A       192.170.2.1             ; IP Lawine
www     IN      CNAME   granz.channel.A03.com.
@       IN      AAAA    ::1

' > /etc/bind/jarkom/granz.channel.A03.com
```

Lakukan restart bind9 di DNS server.

```
service bind9 restart
```

Di load balancer, lakukan instalasi nginx, php, dan apache.

```
echo 'nameserver 192.168.122.1' > /etc/resolv.conf
apt-get update
apt-get install nginx git php7.3 php7.3-fpm htop -y
apt-get install apache2-utils -y

service php7.3-fpm start
service nginx start

```

Karena resource server berbeda-beda, digunakan algoritma weighted round robin untuk load balancer agar dapat bekerja dengan maksimal, yang diatur sebagai berikut.

```
echo 'upstream worker {
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
        }
        error_log /var/log/nginx/lb_error.log;
        access_log /var/log/nginx/lb_access.log;
}' > /etc/nginx/sites-available/lb-php
```

Link file lb-php ke sites-enabled dan unlink file default yang ada di sites-enabled. Lalu, lakukan restart nginx.

```
ln -s /etc/nginx/sites-available/lb-php /etc/nginx/sites-enabled
unlink /etc/nginx/sites-enabled/default

service nginx restart
```

Di client, lakukan instalasi apache dan gunakan command ab untuk memanggil 1000 request dan 100 request per sekon ke granz.channel.A03.com.

```
apt-get install apache2-utils
ab -n 1000 -c 100 -g no7.data http://granz.channel.A03.com/
```

Hasilnya adalah sebagai berikut.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175747897309011998/image.png?ex=656c5b8f&is=6559e68f&hm=479c68019743395815f88e4b64e060524d63237a7d39deb7f13d3e68465c3452&)


Untuk mengecek apakah load balancing telah bekerja sesuai weight yang dibebankan pada masing-masing worker, digunakan command berikut untuk melihat berapa request yang didapatkan tiap worker.

```
cat /var/log/nginx/jarkom_access.log | grep "GET" | wc -l
```

Hasilnya adalah sebagai berikut.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175747708854730843/WhatsApp_Image_2023-11-19_at_17.40.42_c329b64d.jpg?ex=656c5b62&is=6559e662&hm=b7f8ee94ffd64a03c70e3103c002f8a83f94ce8673c43a16c8d7017bd88e4081&)

## Soal 8

#### Karena diminta untuk menuliskan grimoire, buatlah analisis hasil testing dengan 200 request dan 10 request/second masing-masing algoritma Load Balancer

Berikut adalah setup masing-masing algoritma di /etc/nginx/sites-available/lb-php pada load balancer.

```
upstream worker {
#       rounf robin
        server 192.170.3.1;
        server 192.170.3.2;
        server 192.170.3.3;

#       weighted round robin
        server 192.170.3.1 weight=640;
        server 192.170.3.2 weight=200;
        server 192.170.3.3 weight=25;

#       least connection
        least_conn;
        server 192.170.3.1;
        server 192.170.3.2;
        server 192.170.3.3;

#       IP hash
        ip_hash;
        server 192.170.3.1;
        server 192.170.3.2;
        server 192.170.3.3;

#       Generic hash
        hash $request_uri consistent;
        server 192.170.3.1;
        server 192.170.3.2;
        server 192.170.3.3;        
}
```

Untuk pengetesan, digunakan apache bench di client.

```
ab -n 200 -c 10 -g no7.data http://granz.channel.A03.com/
```

Hasil untuk masing-masing algoritma adalah sebagai berikut.

- Round robin

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1174688047179235328/image.png?ex=6568807f&is=65560b7f&hm=535eb3f0ed5c35523edd0d8479771d750856f230d2255729fd5c80c46fe0b687&)

- Weighted round robin

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1174686668599591012/image.png?ex=65687f36&is=65560a36&hm=d31cb44210f83e36ae48e5e979f9d682f54927f2c9a1ff0341f454e578496387&)

- Least connection

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1174685339747627059/image.png?ex=65687df9&is=655608f9&hm=9af4cc29e1b352d041ec724712ef0f79d4ffa8fbb84911947260057f526ea71e&)

- IP hash

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1174685853340147792/image.png?ex=65687e74&is=65560974&hm=92d13242f404fcef8196b17e41befbe5fecb7043cd0858fb13f20bb81efa751f&)

- Generic hash

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1174686326868680726/image.png?ex=65687ee4&is=655609e4&hm=8f5012c001f8b75e20bb65d664db8e8eb411e812765c8efd7c49897d984daa6d&)

## Soal 9

#### Dengan menggunakan algoritma Round Robin, lakukan testing dengan menggunakan 3 worker, 2 worker, dan 1 worker sebanyak 100 request dengan 10 request/second, kemudian tambahkan grafiknya pada grimoire.

Untuk pengetesan, digunakan apache bench di client.

```
ab -n 100 -c 10 -g no7.data http://granz.channel.A03.com/
```

- 3 worker

![image]()

- 2 worker

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1174687439567204432/image.png?ex=65687fee&is=65560aee&hm=8b3d5c3ce4555bf26e228778b04fc844169f81629dc6453f1e714370727d7383&)

- 1 worker

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1174687228220416050/image.png?ex=65687fbb&is=65560abb&hm=874c22907e980904207b6d6169070f88a3836750b21c42898944f99938a3a5ff&)

## Soal 10

#### Selanjutnya coba tambahkan konfigurasi autentikasi di LB dengan dengan kombinasi username: “netics” dan password: “ajkyyy”, dengan yyy merupakan kode kelompok. Terakhir simpan file “htpasswd” nya di /etc/nginx/rahasisakita/

Di /etc/nginx/sites-available/lb-php pada load balancer, pada setup server granz.channel.A03.com, tambahkan konfigurasi autentikasi sebagai berikut.

```
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
        }

        error_log /var/log/nginx/lb_error.log;
        access_log /var/log/nginx/lb_access.log;
}
```

Lakukan juga command berikut di load balancer.

```
mkdir /etc/nginx/rahasiakita/
htpasswd -bc /etc/nginx/rahasiakita/.htpasswd netics ajkA03
```

Berikut adalah hasil lynx granz.channel.A03.com di client.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175787197975244901/image.png?ex=656c8029&is=655a0b29&hm=b265d22004ef61b0abc1623bd5b5a31a9ce85e084c1c324aa306a7fb51632629&)

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175787241826680842/image.png?ex=656c8033&is=655a0b33&hm=c2c74cd868fd1eadf1dc396613dfc40d3ddd6ba607a3b6a438301fb4a572622d&)

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175787343534366782/image.png?ex=656c804b&is=655a0b4b&hm=15f69451bf5ed51ff758268476dda4671cafeef8fc7b174754a07f561ebf7c38&)

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175787394419667095/image.png?ex=656c8057&is=655a0b57&hm=7170f20eb45b18343cab054e86a50bf8e14e383c6ff3de63cac4a956a7f77c58&)

## Soal 11

#### Lalu buat untuk setiap request yang mengandung /its akan di proxy passing menuju halaman https://www.its.ac.id.

Di /etc/nginx/sites-available/lb-php pada load balancer, pada setup server granz.channel.A03.com, tambahkan konfigurasi proxy passing sebagai berikut.

```
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
```

Berikut adalah hasil lynx ke granz.channel.A03.com/its

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175785873753784421/image.png?ex=656c7eed&is=655a09ed&hm=9b22b6b6afb51964c187b7bbc14849e7b57fc9f5f304b3dfbfd03babf97e74a0&)

## Soal 12

#### Selanjutnya LB ini hanya boleh diakses oleh client dengan IP [Prefix IP].3.69, [Prefix IP].3.70, [Prefix IP].4.167, dan [Prefix IP].4.168.

Di /etc/nginx/sites-available/lb-php pada load balancer, pada setup server granz.channel.A03.com, tambahkan konfigurasi sebagai berikut.

```
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
```

Berikut adalah hasil lynx granz.channel.A03.com di selain IP yang diperbolehkan.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175786553407180950/image.png?ex=656c7f8f&is=655a0a8f&hm=6c8a40d4c96d851cad957482f5f33d378d17ea87df77a2e69e54fb6678f1d38d&)

## Soal 13

#### Semua data yang diperlukan, diatur pada Denken dan harus dapat diakses oleh Frieren, Flamme, dan Fern. 

Di database server (Denken), lakukan instalasi sql server

```
apt-get update
apt-get install mariadb-server -y
service mysql start
```

Lakukan konfigurasi berikut di database server.

```
#!/bin/bash

# MySQL connection parameters
MYSQL_USER="root"
MYSQL_PASSWORD=""
# MySQL commands
mysql -u$MYSQL_USER -p$MYSQL_PASSWORD <<EOF
CREATE USER '\''kelompokA03'\''@'\''%'\'' IDENTIFIED BY '\''passwordA03'\'';
CREATE USER '\''kelompokA03'\''@'\''localhost'\'' IDENTIFIED BY '\''passwordA03'\'';
CREATE DATABASE dbkelompokA03;
GRANT ALL PRIVILEGES ON *.* TO '\''kelompokA03'\''@'\''%'\'';
GRANT ALL PRIVILEGES ON *.* TO '\''kelompokA03'\''@'\''localhost'\'';
FLUSH PRIVILEGES;
EOF
```

Atur konfigurasi di /etc/mysql/my.cnf menjadi sebagai berikut.

```
echo '[mysqld]
skip-networking=0
skip-bind-address' >> /etc/mysql/my.cnf
```

Lalu restart mysql.

```
service mysql restart
```

Di klien, lakukan instalasi sql client.

```
apt-get update
apt-get install mariadb-client -y
```

Berikut hasil pengetesan di database server.

```
mysql -u kelompokA03 -p
```

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175790501388103691/image.png?ex=656c833c&is=655a0e3c&hm=9ed141f957a58fd1ecca6b134bf5cef104ffe569c0524f2563834a205730915b&)

Berikut hasil pengetesan di client.

```
mariadb --host=192.170.2.2 --port=3306 --user=kelompokA03 --password
```

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175791280446505041/image.png?ex=656c83f6&is=655a0ef6&hm=7b9bc715425e9392f5ac97012ab9ca6e9e4373681fc4adcad936fe63a304ddc6&)

## Soal 14

#### Frieren, Flamme, dan Fern memiliki Riegel Channel sesuai dengan quest guide berikut. Jangan lupa melakukan instalasi PHP8.0 dan Composer 

Di laravel worker, lakukan konfigurasi berikut.

```
wget https://getcomposer.org/download/2.0.13/composer.phar
chmod +x composer.phar
mv composer.phar /usr/bin/composer
apt-get install git -y
git clone https://github.com/martuafernando/laravel-praktikum-jarkom.git

mv laravel-praktikum-jarkom /var/www
cd /var/www/laravel-praktikum-jarkom

composer update
composer install

echo 'APP_NAME=Laravel
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_URL=http://localhost

LOG_CHANNEL=stack
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=192.170.2.2
DB_PORT=3306
DB_DATABASE=dbkelompokA03
DB_USERNAME=kelompokA03
DB_PASSWORD=passwordA03

BROADCAST_DRIVER=log
CACHE_DRIVER=file
FILESYSTEM_DISK=local
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
SESSION_LIFETIME=120

MEMCACHED_HOST=127.0.0.1

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=smtp
MAIL_HOST=mailpit
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="hello@example.com"
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_HOST=
PUSHER_PORT=443
PUSHER_SCHEME=https
PUSHER_APP_CLUSTER=mt1

VITE_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
VITE_PUSHER_HOST="${PUSHER_HOST}"
VITE_PUSHER_PORT="${PUSHER_PORT}"
VITE_PUSHER_SCHEME="${PUSHER_SCHEME}"
VITE_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"' > /var/www/laravel-praktikum-jarkom/.env

php artisan migrate:fresh
php artisan db:seed --class=AiringsTableSeeder
php artisan key:generate
php artisan jwt:secret

echo 'server {
    listen 80;

    root /var/www/laravel-praktikum-jarkom/public;

    index index.php index.html index.htm;
    server_name riegel.canyon.A03.com;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    # pass PHP scripts to FastCGI server
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.0-fpm-eisen.sock;
    }

    location ~ /\.ht {
        deny all;
    }

    error_log /var/log/nginx/implementasi_error.log;
    access_log /var/log/nginx/implementasi_access.log;
}' > /etc/nginx/sites-available/implementasi


ln -s /etc/nginx/sites-available/implementasi /etc/nginx/sites-enabled/
unlink /etc/nginx/sites-enabled/default
chown -R www-data.www-data /var/www/laravel-praktikum-jarkom/storage
chmod -R 777 public
chmod -R 777 storage
```

Berikul adalah hasil lynx IP ketiga laravel worker di client.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175836146941571152/image.png?ex=656cadbf&is=655a38bf&hm=7a786f4ec63d63934679d0f43d631c0c4c5624c12cb837649a813fa181581ee5&)

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175837891004469388/image.png?ex=656caf5f&is=655a3a5f&hm=ae46c28947f57a3af95bdb2899a833017ffbb19a587432c01813c28f1b9927df&)

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175838128200753375/image.png?ex=656caf97&is=655a3a97&hm=627da5e56b480852282a330c0b7dfa2563f7beae35059ae5c2b3a99835c7e2af&)

## Soal 15, 16, 17

#### Riegel Channel memiliki beberapa endpoint yang harus ditesting sebanyak 100 request dengan 10 request/second. Tambahkan response dan hasil testing pada grimoire.

#### POST /auth/register (15)

Berikut command untuk mendapat response dari endpoint.

```
curl -s -X POST -H "Content-Type: application/json" -d '{"username":"kalyana", "password":"kalyana"}' http://192.170.4.1/api/auth/register
```

Berikut response yang didapat.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175795437341523988/image.png?ex=656c87d5&is=655a12d5&hm=51731ee7c47f417fed47e8d439ad23dc94c4ae9666e5992d992f412035911c65&)

Berikut command untuk melihat hasil testing.

```
echo '{"username":"kalyana", "password":"kalyana"}' > register.json
ab -n 100 -c 10 -p register.json -T "application/json" -H "Content-Type:application/json" http://192.170.4.1/api/auth/register
```

Berikut hasil testingnya.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175795524763389982/image.png?ex=656c87ea&is=655a12ea&hm=446391c7c4050c50684a6df5f79a94e7317038400e424b76baf5ded190d3a1b6&)

#### POST /auth/login (16)

Berikut command untuk mendapat response dari endpoint.

```
curl -s -X POST -H "Content-Type: application/json" -d '{"username":"kalyana", "password":"kalyana"}' http://192.170.4.1/api/auth/login
```

Berikut response yang didapat.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175795601850507264/image.png?ex=656c87fc&is=655a12fc&hm=94a896d93a22fb13dac47b1a43df18cd6fa3f13306bd8251e9984d051c04157d&)

Berikut command untuk melihat hasil testing.

```
echo '{"username":"kalyana", "password":"kalyana"}' > login.json
ab -n 100 -c 10 -p login.json -T "application/json" -H "Content-Type:application/json" http://192.170.4.1/api/auth/login
```

Berikut hasil testingnya.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175795679520641034/image.png?ex=656c880f&is=655a130f&hm=73ae425e80ff728f61bf8acf1c7346f1113c6c1b3d91e7d5653e2195c95bfb7e&)

#### GET /me (17)

Berikut command untuk mendapat response dari endpoint.

```
curl -H "Authorization: Bearer eyJpc3M0eXAiOiJKV1QiLCJhbGciOiJIUzI1.eyJpc3M0eXAiOiJKV1QiLCJhbGciOiJIUzI1YXBpL2F1dGgvcmVnaXN0ZXIiLCJpYXQiOjE3MDAxMzkwMjUsImV4cCI6MTcwMDE0MjYyNSwibmJmIjoxNzAwMTM5MDI1LCJqdGkiOiJ2cGVpN3F6NVBRZkdrcWkwIiwic3ViIjoiNSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.wGOnFRgCxbQ6xSJ25x_vO9peHMWQaiTSFdXjOykARHR" http://192.170.4.1/api/me
```

Berikut response yang didapat.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175795743592824842/image.png?ex=656c881e&is=655a131e&hm=05caf777d17d159530f3b9b67154699da42618ac517dde04234da8bde0e8e95e&)

Berikut command untuk melihat hasil testing.

```
ab -n 100 -c 10 -H "Authorization: Bearer eyJpc3M0eXAiOiJKV1QiLCJhbGciOiJIUzI1.eyJpc3M0eXAiOiJKV1QiLCJhbGciOiJIUzI1YXBpL2F1dGgvcmVnaXN0ZXIiLCJpYXQiOjE3MDAxMzkwMjUsImV4cCI6MTcwMDE0MjYyNSwibmJmIjoxNzAwMTM5MDI1LCJqdGkiOiJ2cGVpN3F6NVBRZkdrcWkwIiwic3ViIjoiNSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.wGOnFRgCxbQ6xSJ25x_vO9peHMWQaiTSFdXjOykARHR" http://192.170.4.1/api/me
```

Berikut hasil testingnya.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175795868574687322/image.png?ex=656c883c&is=655a133c&hm=7f4909539d049fece63051defb836436c5752a6b8e632a508d94b9384b654d9f&)

## Soal 18

#### Untuk memastikan ketiganya bekerja sama secara adil untuk mengatur Riegel Channel maka implementasikan Proxy Bind pada Eisen untuk mengaitkan IP dari Frieren, Flamme, dan Fern.

Tambahkan konfigurasi berikut untuk proxy bind di file /etc/nginx/sites-available/lb-php pada load balancer.

```
upstream laravel {
    server 192.170.4.1;
    server 192.170.4.2;
    server 192.170.4.3;
}

server {
    listen 81;
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
}
```

Berikut adalah hasil lynx 192.170.2.1/frieren, 192.170.2.1/flamme, dan 192.170.2.1/fern.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175838980751753276/image.png?ex=656cb063&is=655a3b63&hm=319f93af9fc2e90592fdeca4adc32ebfd8c506c80fe6f7be6b5e67b2ca30fbf8&)

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175839101996519474/image.png?ex=656cb07f&is=655a3b7f&hm=752309acc54fc5b643eed5e271d961fe8bc7041bb7ceb6878940b2490538e12e&)

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175839274667622430/image.png?ex=656cb0a9&is=655a3ba9&hm=9904020211aa1477796f771284a7c2d9ae103ef0aac3f0133db3f0759d913d6c&)

## Soal 19

#### Untuk meningkatkan performa dari Worker, coba implementasikan PHP-FPM pada Frieren, Flamme, dan Fern. Untuk testing kinerja naikkan 

#### - pm.max_children

#### - pm.start_servers

#### - pm.min_spare_servers

#### - pm.max_spare_servers

#### sebanyak tiga percobaan dan lakukan testing sebanyak 100 request dengan 10 request/second kemudian berikan hasil analisisnya pada Grimoire.

Lakukan konfigurasi-konfigurasi berikut di /etc/php/8.0/fpm/pool.d/eisen.conf.

```
echo '
[eisen_site]
user = eisen_user
group = eisen_user
listen = /var/run/php/php8.0-fpm-eisen.sock
listen.owner = www-data
listen.group = www-data
php_admin_value[disable_functions] = exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen] = off

pm = dynamic
; pm.max_children = 20
; pm.start_servers = 7
; pm.min_spare_servers = 5
; pm.max_spare_servers = 10

; pm.max_children = 30
; pm.start_servers = 12
; pm.min_spare_servers = 10
; pm.max_spare_servers = 20

pm.max_children = 40
pm.start_servers = 25
pm.min_spare_servers = 20
pm.max_spare_servers = 40

pm.process_idle_timeout = 10s
' > /etc/php/8.0/fpm/pool.d/eisen.conf

groupadd eisen_user
useradd -g eisen_user eisen_user

service nginx restart
service php8.0-fpm start
```

Ubah juga php-fpm menjadi sebagai berikut di /etc/nginx/sites-available/implementasi

```
# pass PHP scripts to FastCGI server
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.0-fpm-eisen.sock;
    }
```

- Percobaan pertama

```
; pm.max_children = 20
; pm.start_servers = 7
; pm.min_spare_servers = 5
; pm.max_spare_servers = 10
```

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175801647092469912/image.png?ex=656c8d9e&is=655a189e&hm=6ef6b290c92b1dc292c205569ee865cafbae1c38a288e8d216e7b18eefac9023&)

- Percobaan kedua

```
; pm.max_children = 30
; pm.start_servers = 12
; pm.min_spare_servers = 10
; pm.max_spare_servers = 20
```

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175801211388170271/image.png?ex=656c8d36&is=655a1836&hm=fb9c863bc57159ee2ae0cfba404cdac23ca76070a3e34375d1d4c7bdf7ab6c52&)

- Percobaan ketiga

```
pm.max_children = 40
pm.start_servers = 25
pm.min_spare_servers = 20
pm.max_spare_servers = 40
```

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175801579488690217/image.png?ex=656c8d8d&is=655a188d&hm=126c08c80b77e17a4a2dcbb4bda28db1afbebf330c959ad51a8a0250e59414b6&)

## Soal 20

#### Nampaknya hanya menggunakan PHP-FPM tidak cukup untuk meningkatkan performa dari worker maka implementasikan Least-Conn pada Eisen. Untuk testing kinerja dari worker tersebut dilakukan sebanyak 100 request dengan 10 request/second.

Atur konfigurasi berikut untuk algoritma least connection di file /etc/nginx/sites-available/lb-php pada load balancer.

```
upstream laravel {
    least_conn;
    server 192.170.4.1;
    server 192.170.4.2;
    server 192.170.4.3;
}
```

Berikut adalah hasilnya.

![image](https://cdn.discordapp.com/attachments/1174683821438939156/1175853225467973662/image.png?ex=656cbda7&is=655a48a7&hm=d5cba5f8373e21bd7cc9db5c9bf74c792b93689db64762b3ef11abd703715eb5&)