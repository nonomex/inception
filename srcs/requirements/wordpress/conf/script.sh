#!/bin/bash

sleep 10

wget https://wordpress.org/latest.tar.gz -P /var/www/html

tar -xvf /var/www/html/latest.tar.gz -C /var/www/html

chown -R www-data:www-data /var/www/html/wordpress

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cp /usr/local/bin/wp /var/www/html/wordpress/wp-cli.phar

chown -R www-data:www-data /var/www/html

chmod -R 755 /var/www/html

mv /wp-config.php /var/www/html/wordpress/wp-config.php

echo install

[ -z "$USER_NAME" ] && echo "Error: USER_NAME is not set." && exit 1
[ -z "$USER_MAIL" ] && echo "Error: USER_MAIL is not set." && exit 1
[ -z "$SQL_USER" ] && echo "Error: SQL_USER is not set." && exit 1
[ -z "$ADMIN_PASSWORD" ] && echo "Error: ADMIN_PASSWORD is not set." && exit 1
[ -z "$USER_PASSWORD" ] && echo "Error: USER_PASSWORD is not set." && exit 1

wp core install --url="https://aammirat.42.fr" --title="inception" --admin_user=${SQL_USER} --admin_password=${ADMIN_PASSWORD} --admin_email="thecreator@donthaveemail.com" --allow-root --path=/var/www/html/wordpress

echo heyogf

until wp core is-installed --allow-root --path=/var/www/html/wordpress; do
	sleep 5
done

echo service launch 

wp user create ${USER_NAME} ${USER_MAIL} --user_pass=${USER_PASSWORD} --path=/var/www/html/wordpress --allow-root

mkdir /run/php
chmod 755 /run/php

/usr/sbin/php-fpm7.3 -F 
