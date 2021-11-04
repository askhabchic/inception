FROM debian:buster

WORKDIR /usr/lib/my_dir

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y redis-server vim 

# RUN mkdir -p /run/php && chmod 660 /run/ 
COPY ./tools ./

EXPOSE 6379

# CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
CMD /bin/bash start.sh