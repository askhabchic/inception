FROM debian:buster

RUN apt-get update && \
    # apt-get install -y default-mysql-server
    apt-get -y install mariadb-client mariadb-server 

COPY ./tools/mysql.sh / 
RUN chmod +x mysql.sh

EXPOSE 3306

CMD sh mysql.sh