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

#wp config create --dbname="mysql" --dbuser="aammirat" --dbpass="passwourd" --dbhost="mariadb:3306" --allow-root --path=/var/www/html/wordpress

#echo '<VirtualHost *:9000>
 #   ServerName aammirat.42.fr
  #  DocumentRoot /var/www/html/wordpress
   # <Directory /var/www/html/wordpress>
    #    AllowOverride All
     #   Require all granted
    #</Directory>
    #ErrorLog ${APACHE_LOG_DIR}/error.log
    #CustomLog ${APACHE_LOG_DIR}/access.log combined
#</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

#echo 'ServerName aammirat.42.fr' >> /etc/apache2/apache2.conf

echo install


#echo apache launched, nw installgin

wp core install --url="https://aammirat.42.fr" --title="inception" --admin_user="aammirat" --admin_password="passwourd" --admin_email="thecreator@donthaveemail.com" --allow-root --path=/var/www/html/wordpress

echo heyogf

until wp core is-installed --allow-root --path=/var/www/html/wordpress; do
	sleep 5
done

echo service launch 

wp user create ${USER_NAME} ${USER_MAIL} --user_pass=${USER_PASSWORD} --path=/var/www/html/wordpress --allow-root

php7.3-fpm
#service apache2 start
