echo nameserver 192.168.122.1 > /etc/resolv.conf

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

echo 'options {
        directory "/var/cache/bind";

        forwarders {
                192.168.122.1;
        };

        // dnssec-validation auto;
        allow-query{ any; };
        listen-on-v6 { any; };
}; ' >/etc/bind/named.conf.options

service bind9 restart