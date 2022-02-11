FROM debian:buster

RUN apt-get update -y && \
	apt-get install -y php7.3 php-mysql php-fpm mariadb-client

RUN apt-get update -y && apt-get install -y wget && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	apt remove -y wget
RUN wp core download --path=/usr/src/wordpress --allow-root

COPY www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN	chmod 777 /etc/php/7.3/fpm/pool.d/www.conf


COPY wp_setup.sh /

VOLUME [ "/var/www/" ]

EXPOSE 9000

ENTRYPOINT	bash wp_setup.sh