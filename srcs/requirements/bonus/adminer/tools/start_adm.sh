#!/bin/bash
sed -i -e 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf 
mv adminer.php /var/www/adminer/adminer.php
/usr/sbin/php-fpm7.3 -F --nodaemonize