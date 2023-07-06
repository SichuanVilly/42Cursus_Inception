FROM alpine:3.15

ARG DB_USER DB_NAME DB_ROOT DB_USER DB_PASS

RUN apk update && apk add --no-cache mysql mysql-client && \
	sed -i "s/bin-address = 127.0.0.1/bind-address = 0.0.0.0/g" /etc/my.cnf.d/mariadb-server.cnf

COPY ./conf/create_db.sh /create_db.sh

COPY ./conf/mariadb-server.cnf /mariadb-server.cnf

EXPOSE 3306

CMD [ "sh", "/create_db.sh"]


