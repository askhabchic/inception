FROM debian:buster

RUN apt-get update && \
    apt-get install -y default-mysql-server

COPY ./tools/my.cnf /etc/
RUN chown mysql:mysql /etc/my.cnf && \
    chmod 600 /etc/my.cnf

COPY ./tools/mysql.sh / 
RUN chmod +x mysql.sh

EXPOSE 3306

CMD sh mysql.sh