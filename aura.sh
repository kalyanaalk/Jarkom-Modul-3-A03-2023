iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.170.0.0/16
apt-get update
apt-get install isc-dhcp-relay -y
service isc-dhcp-relay
oke