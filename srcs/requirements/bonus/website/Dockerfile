FROM debian:buster

# WORKDIR /usr/src/app
RUN apt-get update && apt-get -y install nginx

COPY ./web/ /var/www/wordpress/web/

EXPOSE 8080
CMD nginx -g 'daemon off;'