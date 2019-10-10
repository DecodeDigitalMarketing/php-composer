FROM composer

# Add common extensions
RUN apk add --update --no-cache nss libpng libzip icu
RUN apk add --update --no-cache --virtual .deps \
	libpng-dev libzip-dev icu-dev; \
	\
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-install gd zip intl pdo_mysql; \
	\
	apk del .deps

