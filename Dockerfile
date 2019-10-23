FROM composer

# Add common extensions
RUN apk add --update --no-cache nss libpng libzip icu bzip2
RUN apk add --update --no-cache --virtual .deps \
	libpng-dev libzip-dev icu-dev bzip2-dev; \
	\
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-install gd zip bz2 intl pdo_mysql; \
	\
	apk del .deps

