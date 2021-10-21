FROM debian:buster

LABEL maintainer="fhyman"

RUN apt-get update && \
    apt-get -y install wget vim nginx openssl mariadb-client

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=ru/ST=Kazan/L=Kazan/O=no/OU=no/CN=fhyman/" \
    -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;
RUN rm /etc/nginx/sites-enabled/default
RUN rm /etc/nginx/sites-available/default
COPY ./tools/default /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

EXPOSE 443
CMD nginx -g 'daemon off;'