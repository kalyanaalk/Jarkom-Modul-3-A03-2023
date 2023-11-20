echo 'nameserver 192.168.122.1' >> /etc/resolv.conf
apt-get update
apt-get install mariadb-server -y
service mysql start

echo '#!/bin/bash

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
EOF' > ~/sqlsetup.sh

bash ~/sqlsetup.sh

echo '[mysqld]
skip-networking=0
skip-bind-address' >> /etc/mysql/my.cnf

service mysql restart