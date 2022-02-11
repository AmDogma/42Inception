mkdir -p /run/php

while ! mysql -h mariadb -u $DB_USER -p$DB_PW $DB_NAME -e "SELECT 'OK' AS status;"; do
    sleep 5
done

if [ ! -f /var/www/wordpress/wp-config.php ]; then
cp -R /usr/src/wordpress /var/www
wp core config --path=/var/www/wordpress --dbhost=${DB_HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PW} --allow-root
wp core install --path=/var/www/wordpress --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_N} --admin_password=${WP_ADMIN_PW} --admin_email=${WP_ADMIN_MAIL} --skip-email --allow-root
wp user create --path=/var/www/wordpress --allow-root ${WP_USER} ${WP_USER_EMAIL} --role=author --user_pass=${WP_USER_PW}
fi
/usr/sbin/php-fpm7.3 --nodaemonize


