#!/bin/bash
sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i -e 's/#port/port /g' /etc/mysql/mariadb.conf.d/50-server.cnf
chown -R mysql:mysql /var/lib/mysql
if [ ! -d /var/lib/mysql/wordpress/ ]; then
	mysql_install_db --user=mysql --ldata=/var/lib/mysql
	service mysql start
	echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -u root
	echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql
	echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;" | mysql
	echo "FLUSH PRIVILEGES;"| mysql 
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql
	service mysql stop
else
	if [ ! -d /var/run/mysqld/ ]; then
		mkdir /var/run/mysqld
		if [ ! -f /var/run/mysqld/mysqld.sock ]; then
			mkfifo /var/run/mysqld/mysqld.sock
		fi
		touch /var/run/mysqld/mysqld.pid
		fi
		chmod 755 -R /var/run/mysqld/mysqld.sock
	fi
		chown -R mysql /var/run/mysqld

mysqld_safe









# if [ ! -d /var/lib/mysql/wordpress/ ]; then
# service mysql start
# echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;"| mysql
# echo "CREATE USER IF NOT EXISTS $DB_USER@'%' IDENTIFIED BY '$DB_PASSWORD';"| mysql
# echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;"| mysql
# echo "FLUSH PRIVILEGES;"| mysql 
# mysqladmin -u root password $MYSQL_ROOT_PASSWORD
# service mysql stop

# echo "SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}');"| mysql 
# mysql -e "${MYSQL_ROOT_PASSWORD}";
# echo "SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}');"
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql
# mysql -e "${MYSQL_ROOT_PASSWORD}";
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
# mysql -e "${MYSQL_ROOT_PASSWORD}";
# echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password

# else
# mkdir -p /var/run/mysqld
# mkfifo /var/run/mysqld/mysqld.sock
# touch /var/run/mysqld/mysqld.pid
# chown -R mysql /var/run/mysqld
# fi
# chown -R mysql:mysql /var/lib/mysql

# mysqld

# # mysqladmin -u root password 'rootpass'
# if [ ! -d /var/lib/mysql/wordpress ]; then
# # if ["`mysql -u'$DB_USER' -p'$DB_PASSWORD' -e'USE $DB_NAME;' 2>&1`" == ""] ; then
# service mysql start
# sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
# sed -i -e 's/#port/port /g' /etc/mysql/mariadb.conf.d/50-server.cnf

# echo "show databases like '$DB_NAME';" | mysql
# echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;"| mysql
# echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;" | mysql
# echo "UPDATE user set Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE user='root';" | mysql
# echo "FLUSH PRIVILEGES;"| mysql

# # echo "DELETE FROM mysql.user WHERE Password='';"| mysql -u root --skip-password
# # echo "SET PASSWORD FOR root@'%'=PASSWORD('${MYSQL_ROOT_PASSWORD}');"| mysql -u root --skip-password
# # mysql -e "alter user 'root'@'localhost' identified by '${MYSQL_ROOT_PASSWORD}'";

# service mysql stop
# # else
# # mkdir /var/run/mysqld
# # mkfifo var/run/mysqld/mysqld.sock
# # touch /var/run/mysqld/mysqld.pid
# # chown -R mysql /var/run/mysqld
# fi
# mysqld
# mysqladmin -u root password '${MYSQL_ROOT_PASSWORD}';

# echo "ALTER USER 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" | mysql
# echo "mysqladmin -u root password 'rootpass';" | mysql
# echo "FLUSH PRIVILEGES;"| mysql

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Если вы изменяете таблицы грантов напрямую, используя такие выражения, как INSERT,      #
# UPDATE или DELETE, ваши изменения не влияют на привилегии проверяя, чтобы вы либо       #
# перезапустили сервер, либо попросите его перезагрузить столы. Если вы напрямую          #
# измените таблицы грантов, но забудьте перезагрузить их изменения не влияют,             #
# пока вы не перезапустите сервер. Эта может оставить вас задуматься, почему ваши         #
# изменения, похоже, не имеют значения! Чтобы сообщить серверу о перезагрузке таблиц      #
# предоставления, выполните flush-privileges. Это можно сделать, выпустив FLUSH           #
# PRIVILEGES или выполнением флеш-привилегий mysqladmin или mysqladmin reload.            #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

