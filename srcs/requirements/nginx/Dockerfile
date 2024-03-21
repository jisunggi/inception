FROM debian:bullseye

RUN apt-get update && apt-get install -y sudo
RUN apt-get -y install nginx && apt-get -y install openssl

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./tools/entrypoint.sh .

RUN chmod +x entrypoint.sh 
EXPOSE 443
ENTRYPOINT ["./entrypoint.sh"]