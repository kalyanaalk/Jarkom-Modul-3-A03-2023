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

