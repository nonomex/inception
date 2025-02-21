#!/bin/bash

sleep 10

wget https://wordpress.org/latest.tar.gz -P /var/www/html

tar -xvf /var/www/html/latest.tar.gz -C /var/www/html

chown -R www-data:www-data /var/www/html/wordpress

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cp /wp-config.php /var/www/html/wordpress/wp-config.php

echo heyo

until wp core is-installed --allow-root --path=/var/www/html/wordpress; do
	sleep 5
done

echo service launch 

service apache2 start

wp user create thecreator thecreator@donthaveemailadress.com --role=administrator --user_pass=${ADMIN_PASSWORD} --path=/var/www/html/wordpress --allow-root 

wp user create ${USER_NAME} ${USER_MAIL} --user_pass=${USER_PASSWORD} --path=/var/www/html/wordpress -allow-root

exec "$@"
