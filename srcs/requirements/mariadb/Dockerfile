FROM debian:bullseye

RUN apt-get update && apt-get install -y sudo
RUN apt-get install -y mariadb-server

RUN mkdir -m 700 /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld /var/lib/mysql && \
	chmod 777 /var/lib/mysql /var/run/mysqld

COPY ./tools/run.sh /tools/run.sh
COPY ./conf/my.cnf /etc/mysql/my.cnf

RUN chmod +x /tools/run.sh
EXPOSE 3306
ENTRYPOINT sh /tools/run.sh