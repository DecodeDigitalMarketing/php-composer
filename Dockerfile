FROM composer

ENV PATH="/app/vendor/bin:${PATH}"

# Add common extensions
RUN apk add --update --no-cache libpng libzip icu mysql-client
RUN apk add --update --no-cache --virtual .deps \
	libpng-dev libzip-dev icu-dev; \
	\
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-install gd zip intl pdo_mysql; \
	\
	apk del .deps

