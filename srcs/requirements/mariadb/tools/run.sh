mysqld --user=root&
until mysqladmin ping -hlocalhost -uroot -p${MARIADB_ROOT_PASSWORD} > /dev/null 2>&1; do
    #echo "Waiting for MariaDB to start..."
    sleep 1
done
mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "GRANT ALL ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';"
mysql -u root -p"${MARIADB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

mysqladmin -uroot -p"${MARIADB_ROOT_PASSWORD}" shutdown
exec mysqld --user=mysql