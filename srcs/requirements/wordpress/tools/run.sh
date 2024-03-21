# WordPress 다운로드 및 설정
mkdir -p /var/www && cd /var/www
wp core download --allow-root

# wp-config.php 생성
wp config create --dbname="${MARIADB_DATABASE}" --dbuser="${MARIADB_USER}" --dbpass="${MARIADB_PASSWORD}" --dbhost="${WP_HOST}" --locale=ko_KR --allow-root

# WordPress 설치
if ! wp core is-installed --allow-root; then
    wp core install --url="${WP_URL}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_ADMIN_PASSWORD}" --admin_email="${WP_ADMIN_EMAIL}" --skip-email --allow-root
	wp user create "${WP_USER}" "${WP_USER_EMAIL}" --user_pass="${WP_USER_PASSWORD}" --allow-root
fi

mkdir -p /run/php
chown www-data:www-data /run/php

# PHP-FPM 실행
php-fpm7.4 -F