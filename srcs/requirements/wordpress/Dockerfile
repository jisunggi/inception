FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y vim sudo mariadb-client wget curl tar php7.4-fpm php-cli php-mysql

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/entrypoint.sh .

RUN chmod +x entrypoint.sh
EXPOSE 9000
ENTRYPOINT ["./entrypoint.sh"]