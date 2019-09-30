FROM composer

ENV PATH="/app/vendor/bin:${PATH}"

# Add common extensions
RUN apk add --update --no-cache nss libpng libzip icu mysql-client
RUN apk add --update --no-cache --virtual .deps \
	libpng-dev libzip-dev icu-dev; \
	\
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-install gd zip intl pdo_mysql; \
	\
	apk del .deps

COPY run_as_user /usr/local/bin/
COPY ssh /usr/local/sbin/

RUN chmod a+x /usr/local/bin/run_as_user; \
	chmod a+x /usr/local/sbin/ssh

