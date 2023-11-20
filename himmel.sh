echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install isc-dhcp-server

 echo 'INTERFACESv4="eth0"' > /etc/default/isc-dhcp-server

echo '
 echo 'subnet 192.170.1.0 netmask 255.255.255.0 {
}

subnet 192.170.2.0 netmask 255.255.255.0 {
}

subnet 192.170.3.0 netmask 255.255.255.0 {
    range 192.170.3.16 192.170.3.32;
    range 192.170.3.64 192.170.3.80;
    option routers 192.170.3.211;
    option broadcast-address 192.170.3.255;
    option domain-name-servers 192.170.1.1;
    default-lease-time 180;
    max-lease-time 5760;
}

subnet 192.170.4.0 netmask 255.255.255.0 {
    range 192.170.4.16 192.170.4.32;  # Corrected range
    range 192.170.4.64 192.170.4.80;  # Corrected range
    option routers 192.170.4.211;
    option broadcast-address 192.170.4.255;
    option domain-name-servers 192.170.1.1;
    default-lease-time 720;
    max-lease-time 5760;
}

host Lawine {
    hardware ethernet f2:d9:57:88:76:8a;
    fixed-address 192.170.3.1;
}

host Linie {
    hardware ethernet be:ca:cb:88:8d:89;
    fixed-address 192.170.3.2;
}

host Lugner {
    hardware ethernet e2:ef:4a:fe:72:cb;
    fixed-address 192.170.3.3;
}

host Fern {
    hardware ethernet d6:cb:f6:76:57:7f;
    fixed-address 192.170.4.1;
}

host Flamme {
    hardware ethernet 2e:92:2c:b3:22:25;
    fixed-address 192.170.4.2;
}

host Frieren {
    hardware ethernet 12:c2:84:56:23:af;
    fixed-address 192.170.4.3;
}
' > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart
' > /root/subnet.sh

bash /root/subnet.sh