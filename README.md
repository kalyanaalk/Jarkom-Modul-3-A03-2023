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

## Setup awal

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

Pada 