#!/bin/sh

service mysql start

sleep 5

echo "Execution du script MySQL"

[ -z "$SQL_USER" ] && echo "Error: SQL_USER is not set." && exit 1
[ -z "$SQL_PASSWORD" ] && echo "Error: SQL_PASSWORD is not set." && exit 1
[ -z "$MYSQL_ROOT_PASSWORD" ] && echo "Error: SQL_ROOT_PASSWORD is not set." && exit 1

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" <<EOF
CREATE DATABASE IF NOT EXISTS mysql;
CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON mysql.* TO '${SQL_USER}'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

echo "Arrêt du serveur MySQL..."
mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" shutdown

exec mysqld
