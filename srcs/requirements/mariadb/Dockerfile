FROM debian:buster

RUN apt-get update && \
    apt-get install -y default-mysql-server

COPY ./tools/my.cnf /etc/mysql/
RUN chown mysql:mysql /etc/mysql/my.cnf && \
    chmod 600 /etc/mysql/my.cnf

COPY ./tools/mysql.sh / 
RUN chmod +x mysql.sh

EXPOSE 3306

CMD sh mysql.sh