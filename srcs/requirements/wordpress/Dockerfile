FROM debian:buster

RUN apt update && apt upgrade -y  && apt install wget -y

RUN apt-get install mariadb-client -y

RUN apt install php7.3 php-cli php-xml php-curl php-zip php-gd php7.3-fpm php-mysql -y

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chmod +x /etc/php/7.3/fpm/pool.d/www.conf

RUN mkdir /run/php

COPY conf/script.sh /script.sh

RUN chmod +x /script.sh

COPY conf/wp-config.php /wp-config.php

EXPOSE 9000

CMD ["/script.sh"]
