FROM debian:bullseye

RUN apt-get update && apt-get install -y sudo
RUN apt-get -y install nginx && apt-get -y install openssl

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./tools/run.sh /tools/run.sh

RUN chmod +x /tools/run.sh
EXPOSE 443
ENTRYPOINT sh /tools/run.sh