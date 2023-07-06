if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then

	mkdir -p /var/www/html/wordpress/
	cd /var/www/html/wordpress/

	wget http://wordpress.org/latest.tar.gz
	tar vxfz latest.tar.gz

	rm -rf latest.tar.gz

	sed -i "s/database_name_here/$DB_NAME/g" wordpress/wp-config-sample.php
	sed -i "s/username_here/$DB_USER/g" wordpress/wp-config-sample.php
	sed -i "s/password_here/$DB_PASS/g" wordpress/wp-config-sample.php
	sed -i "s/localhost/mariadb/g" wordpress/wp-config-sample.php
	dos2unix wordpress/wp-config-sample.php

	mv wordpress/wp-config-sample.php wordpress/wp-config.php

fi

sed -i "s/127.0.0.1:9000/0.0.0.0:9000/g" /etc/php7/php-fpm.d/www.conf

exec /usr/sbin/php-fpm7 -F
