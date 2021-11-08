sed -i -e 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf 
wp core download --allow-root --path=/var/www/wordpress/
wp config create --allow-root \
				--dbname=${DB_NAME} \
				--dbuser=${DB_USER} \
				--dbhost=${DB_HOST} \
				--dbpass=${DB_PASSWORD} \
				--path=/var/www/wordpress/
sleep 3
wp core install --allow-root \
				--url=fhyman.42.fr \
				--title=inception \
				--admin_user=supervisor \
				--admin_password=superpassword \
				--admin_email=supervisor@esuper.com \
				--path=/var/www/wordpress/
#redis
if [ ! -d /var/www/wordpress/wp-content/plugins/redis_cache/ ]; then
	cd /var/www/wordpress/
	wp plugin install redis-cache --allow-root 
	wp plugin activate redis-cache --allow-root
fi

wp user create ${WP_NAME} askhab@mail.com --role=author --user_pass="${WP_PASSWORD}" --allow-root --path=/var/www/wordpress/
/usr/sbin/php-fpm7.3 -F --nodaemonize