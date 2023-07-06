From alpine:3.15

RUN apk update && apk upgrade && apk add --no-cache \
	php7 \
	php7-fpm \
	php7-mysqli \
	php7-json \
	php7-curl \
	php7-dom \
	php7-exif \
	php7-fileinfo \
	php7-mbstring \
	php7-openssl \
	php7-xml \
	php7-zip \
	wget \
	tar	

COPY ./conf/wpconf.sh /wpconf.sh

EXPOSE 9000

CMD ["sh", "/wpconf.sh"]  
