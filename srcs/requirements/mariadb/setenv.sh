
MYSQL_PASSWORD=$(cat "$MYSQL_PASSWORD_FILE")
MYSQL_ROOT_PASSWORD=$(cat "$MYSQL_ROOT_PASSWORD_FILE")

if [ ! -f /var/lib/mysql/.initialized ]; then
  # Comandos de configuração
  echo "Configurando MariaDB..."
  service mariadb start
  sleep 1

  mysql -u root <<EOF
    CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
    FLUSH PRIVILEGES;
    CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
    CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
    FLUSH PRIVILEGES;
    SHUTDOWN;
EOF
  touch /var/lib/mysql/.initialized
  service mariadb stop
  sleep 1
else
  echo "MariaDB já foi inicializado."
fi

echo "Iniciando MariaDB..."

mysqld_safe --bind-address=0.0.0.0 --port=3306
