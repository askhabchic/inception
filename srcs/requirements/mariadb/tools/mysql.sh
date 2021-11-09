#!/bin/bash
sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i -e 's/#port/port /g' /etc/mysql/mariadb.conf.d/50-server.cnf

chown -R mysql:mysql /var/lib/mysql
if [ ! -d /var/lib/mysql/wordpress/ ]; then
	# echo "s/password=MYSQL_ROOT_PASSWORD/password="$MYSQL_ROOT_PASSWORD"/g" >> file
	# sed -f file /etc/mysql/my.cnf
	mysql_install_db --user=mysql --ldata=/var/lib/mysql
	service mysql start
	echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -u root --skip-password
	echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql -u root --skip-password
	echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
	echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root --skip-password
	echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
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

