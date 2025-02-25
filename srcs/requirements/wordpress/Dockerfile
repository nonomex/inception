FROM debian:buster

RUN apt update && apt upgrade -y  && apt install wget -y && apt-get install apache2 -y

RUN apt install php php-cli php-mbstring php-xml sendmail php-curl php-zip php-gd php7.3-fpm php-mysqli -y

COPY conf/php.ini /etc/php/7.3/fpm/php.ini

RUN mkdir /run/php

COPY conf/script.sh /script.sh

RUN chmod +x /script.sh

COPY conf/wp-config.php /wp-config.php

EXPOSE 9000

CMD ["/script.sh"]
