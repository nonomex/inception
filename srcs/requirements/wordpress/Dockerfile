FROM debian:buster

RUN apt update && apt upgrade -y  && apt install wget -y && apt-get install apache2 -y

RUN apt install php php-curl php-fpm php-bcmath php-gd php-soap php-zip php-curl php-mbstring php-mysqlnd php-gd php-xml php-intl php-zip mariadb-client php7.3-phar -y

COPY conf/php.ini /etc/php/7.3/fpm/php.ini

RUN mkdir /run/php

COPY conf/script.sh /script.sh

RUN chmod +x /script.sh

#COPY conf/wp-config.php /wp-config.php

EXPOSE 9000

CMD ["/script.sh"]
