
if ! mysqladmin ping -h "localhost" --silent; then
  # Comandos de configuração
  if [ -f "/var/lib/mysql/my.cnf" ]; then
    echo "Configurando MariaDB.."
    mv /var/lib/mysql/my.cnf /usr/my.cnf
  fi
  echo "Iniciando MariaDB.."
  service mariadb start
  sleep 1
  MYSQL_PASSWORD=$(cat "$MYSQL_PASSWORD_FILE")
  MYSQL_ROOT_PASSWORD=$(cat "$MYSQL_ROOT_PASSWORD_FILE")
  ADMINER_PASSWORD=$(cat "$ADMINER_PASSWORD_FILE")
  mysql -u root <<EOF
    CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
    FLUSH PRIVILEGES;
    CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
    CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
    CREATE USER IF NOT EXISTS '$ADMINER'@'%' IDENTIFIED BY '$ADMINER_PASSWORD';
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$ADMINER'@'%';
    FLUSH PRIVILEGES;
    SHUTDOWN;
EOF
  service mariadb stop
  sleep 1
  ADMINER_PASSWORD=''
  MYSQL_PASSWORD=''
  MYSQL_ROOT_PASSWORD=''
else
  echo "MariaDB já foi inicializado."
fi

mysqld_safe --bind-address=0.0.0.0 --port=3306
