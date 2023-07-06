#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
  	mkdir -p "/run/mysqld"
fi

if [ ! -d "/var/lib/mysql" ]; then
	mkdir -p "/var/lib/mysql"
fi

chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

if [ ! -d "var/lib/mysql/$DB_NAME" ]; then
    mysql_install_db --user=mysql --ldata=/var/lib/mysql --skip-test-db > /dev/null

	temp=`mktemp`
	if [ ! -f "$temp" ]; then
		return 1
	fi

	cat << EOF > $temp
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL ON $DB_NAME.* to '$DB_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT';
FLUSH PRIVILEGES;
EOF
	/usr/bin/mysqld --user=root --bootstrap < $temp

fi

cp /mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld -u root

