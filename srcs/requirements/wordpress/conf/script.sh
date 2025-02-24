#!/bin/bash

sleep 10

wget https://wordpress.org/latest.tar.gz -P /var/www/html

tar -xvf /var/www/html/latest.tar.gz -C /var/www/html

chown -R www-data:www-data /var/www/html/wordpress

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

chown -R www-data:www-data /var/www/html

chmod -R 755 /var/www/html

rm /var/www/html/wordpress/wp-config.php

wp config create --dbname="mysql" --dbuser="aammirat" --dbpass="passwourd" --dbhost="mariadb:3306" --allow-root --path=/var/www/html/wordpress

echo install

wp core install --url="aammirat.42.fr" --title="inception" --admin_user="aammirat" --admin_password="passwourd" --admin_email="thecreator@donthaveemail.com" --allow-root --path=/var/www/html/wordpress

echo heyogf

until wp core is-installed --allow-root --path=/var/www/html/wordpress; do
	sleep 5
done

echo service launch 

service apache2 start

wp user create ${USER_NAME} ${USER_MAIL} --user_pass=${USER_PASSWORD} --path=/var/www/html/wordpress -allow-root

exec "$@"
