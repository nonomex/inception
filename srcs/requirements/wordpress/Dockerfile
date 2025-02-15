FROM debian:buster

RUN apt update

RUN apt upgrade -y

RUN apt install php php-curl php-fpm php-bcmath php-gd php-soap php-zip php-curl php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip -y

RUN apt install wget -y

RUN wget https://wordpress.org/latest.tar.gz -P /var/www/html

RUN tar -xvf /var/www/html/latest.tar.gz -C /var/www/html

RUN chown -R www-data:www-data /var/www/html/wordpress

COPY conf/wp-config-sample.php /var/www/html/wordpress/wp-config-sample.php

COPY conf/php.ini /etc/php/7.3/fpm/php.ini

RUN mkdir /run/php


