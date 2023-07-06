FROM alpine:3.15

RUN apk update && apk upgrade && apk add --no-cache nginx openssl; \
	openssl req -x509 -sha256 -nodes -days 365 \
	-subj "/C=CA/ST=QC/O=C/CN=$(DOMAIN_NAME).fr" \
	-newkey rsa:2048 \
	-keyout /etc/ssl/certs/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt;

COPY ./conf/nginx.conf /etc/nginx/http.d/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

