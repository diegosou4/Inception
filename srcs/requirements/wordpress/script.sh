#!/bin/bash
MYSQL_PASSWORD=$(cat "$MYSQL_PASSWORD_FILE")
cd /var/www/html

    if [ ! -f "/var/www/html/wp-config.php" ]; then
        echo "Setting up wordpress"
        curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
        chmod +x wp-cli.phar
        mv wp-cli.phar /usr/local/bin/wp
        
        wp core download --allow-root
        wp config create --dbname=$MYSQL_DATABASE \
                         --dbuser=$MYSQL_USER \
                         --dbpass=$MYSQL_PASSWORD \
                         --dbhost=$WP_DB_HOST \
                         --allow-root

        # wp core install --url=$DOMAIN_NAME \
        #                 --title=$WP_TITLE \
        #                 --admin_user=$WP_ADMIN \
        #                 --admin_password=$WP_PASSWORD \
        #                 --admin_email=$WP_EMAILADMIN \
        #                 --allow-root
        # wp user create $WP_WP_USER $WP_EMAIL \
        #                 --role=editor --user_pass=$WP_PASSWORD \
        #                 --allow-root
    fi



php-fpm7.4 -F