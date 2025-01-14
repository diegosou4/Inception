#!/bin/bash

cd /var/www/html

    if [ ! -f "/var/www/html/wp-config.php" ]; then
        MYSQL_PASSWORD=$(cat "$MYSQL_PASSWORD_FILE")
        WP_EDITOR_PASS=$(cat "$MYSQL_EDITOR_PASSWORD_FILE")
        WP_ADMIN_PASS=$(cat "$MYSQL_ADMIN_PASSWORD_FILE")
        echo "Setting up wordpress"
        curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
        chmod +x wp-cli.phar
    
        while ! mysqladmin ping -h $HOST_DB -P $PORT_DB --silent; do
            echo "Waiting for MariaDB to be ready..."
            sleep 2
        done
        sleep 3
        mv wp-cli.phar /usr/local/bin/wp
        sleep 3

        wp core download --allow-root
        wp config create --dbname=$MYSQL_DATABASE \
                         --dbuser=$MYSQL_USER \
                         --dbpass=$MYSQL_PASSWORD \
                         --dbhost=$WP_DB_HOST \
                         --allow-root

        wp core install --url=$DOMAIN_NAME \
                        --title=$WP_TITLE \
                        --admin_user=$WP_ADMIN \
                        --admin_password=$WP_ADMIN_PASS \
                        --admin_email=$WP_ADMIN_EMAIL \
                        --skip-email \
                        --allow-root
        wp user create $WP_EDITOR $WP_EDITOR_EMAIL \
                        --role=editor --user_pass=$WP_EDITOR_PASS \
                        --allow-root

        wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php -O /var/www/html/adminer.php
        while [ ! -f "/var/www/html/adminer.php" ]; do
            echo "Waiting for adminer.php to be downloaded..."
            sleep 4
        done
        chmod 755 -R /var/www/html/adminer.php
        # Configuracao do Redis
        wp config set 'WP_REDIS_HOST' $REDIS_HOST --add --type=constant --allow-root
        wp config set 'WP_REDIS_PORT' $REDIS_PORT --add --type=constant --allow-root
        wp config set 'FS_METHOD' 'direct' --add --type=constant --allow-root
        wp config set 'WP_CACHE' true --add --type=constant --allow-root
        wp plugin install redis-cache --activate --allow-root
        wp redis enable --allow-root
        wp plugin update --all --allow-root
        chmod 777 -R /var/www/html/wp-content
        chown -R www-data:www-data /var/www/html
        echo "Wordpress setup complete"
        MYSQL_PASSWORD_FILE=""
        MYSQL_EDITOR_PASSWORD_FILE=""
        MYSQL_ADMIN_PASSWORD_FILE=""
        MYSQL_PASSWORD=""
        WP_EDITOR_PASS=""
        WP_ADMIN_PASS=""
    fi



php-fpm7.4 -F