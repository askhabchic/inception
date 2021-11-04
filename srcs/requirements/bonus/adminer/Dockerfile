FROM debian:buster

WORKDIR /usr/lib/my_dir

RUN apt-get update && \
    apt-get -y install curl php7.3 php-fpm adminer nano

RUN mkdir -p /var/www/wordpress

RUN mkdir -p /run/php && chmod 660 /run/ 

RUN sed -i 's!listen = \/run\/php\/php7.3-fpm.sock!listen = 0.0.0.0:9000!' \
    /etc/php/7.3/fpm/pool.d/www.conf && chown -R www-data:www-data /usr/lib/my_dir \
    && mkdir /var/www/wordpress/adminer

COPY ./tools/adminer.php /var/www/wordpress/adminer

COPY ./tools ./
EXPOSE 9000
WORKDIR /var/www/wordpress/adminer

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]