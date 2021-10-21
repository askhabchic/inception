# mysqladmin -u root password 'rootpass'
# change the line with bind-address && 
# if [!/var/lib/mysql/wordpress ] ; then
if ["`mysql -u'$DB_USER' -p'$DB_PASSWORD' -e'USE $DB_NAME;' 2>&1`" == ""] ; then
service mysql start
sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i -e 's/#port/port /g' /etc/mysql/mariadb.conf.d/50-server.cnf

echo "show databases like '$DB_NAME';" | mysql
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;"| mysql
echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;" | mysql
echo "FLUSH PRIVILEGES;"| mysql

# echo "DELETE FROM mysql.user WHERE Password='';"| mysql -u root --skip-password
# echo "SET PASSWORD FOR root@'%'=PASSWORD('${MYSQL_ROOT_PASSWORD}');"| mysql -u root --skip-password
# mysql -e "alter user 'root'@'localhost' identified by '${MYSQL_ROOT_PASSWORD}'";

service mysql stop
fi
mysqld
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

