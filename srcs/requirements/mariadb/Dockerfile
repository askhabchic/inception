FROM debian:buster

RUN apt-get update && \
    # apt-get install -y default-mysql-server
    apt-get -y install mariadb-client mariadb-server 

COPY ./tools/my.cnf /etc/
RUN chown mysql:mysql /etc/my.cnf && \
    chmod 600 /etc/my.cnf

COPY ./tools/mysql.sh / 
RUN chmod +x mysql.sh

EXPOSE 3306

# CMD ["/mysql.sh", "mysqld"]
CMD sh mysql.sh