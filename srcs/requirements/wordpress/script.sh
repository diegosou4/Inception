MYSQL_PASSWORD=$(cat "$MYSQL_PASSWORD_FILE")
#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

sleep 10

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$WP_DB_HOST --allow-root
./wp-cli.phar core install --url=$DOMAIN_NAME --title=Inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root

php-fpm7.4 -F