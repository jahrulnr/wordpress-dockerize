FROM wordpress:6.7-php8.3 AS SOURCE
FROM dunglas/frankenphp:1-php8.3-bookworm AS BASE

RUN apt-get update \
		&& apt install -y --no-install-recommends \
			apt-transport-https ca-certificates curl \
			tzdata \
			supervisor \
			imagemagick \
    && install-php-extensions \
			apcu \
			gd \
			opcache \
			mysqli \
			zip \
			curl \
			xml \
			mbstring \
			redis \
			imagick \
			exif \
		# && pecl install redis -o -f redis \
		# && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
		&& groupmod www-data -g 1000 \
		&& usermod www-data -u 1000 -g 1000 \
		&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar \
		&& mv wp-cli.phar /usr/local/bin/wp \
		&& apt-get autoremove -y \
		&& apt-get clean \
		&& rm -rf /etc/nginx/conf.d /var/lib/apt/lists/* /tmp/* /var/tmp/*

# available option local, production
WORKDIR /web/www
ARG DOCKER_ENV=local
ENV TZ=Asia/Jakarta \
		WORDPRESS_DB_HOST=database \
		WORDPRESS_DB_NAME=devdata \
		WORDPRESS_DB_USER=root \
		WORDPRESS_DB_PASSWORD=root \
		WORDPRESS_TABLE_PREFIX=wp_ \
		WORDPRESS_DEBUG=0
COPY --from=SOURCE /usr/src/wordpress /usr/src/wordpress
COPY --chown=www-data:www-data ./wordpress /web/www
COPY ./franken/${DOCKER_ENV}-Caddyfile  /etc/caddy/Caddyfile
COPY ./php/${DOCKER_ENV}-php.ini /usr/local/etc/php/php.ini
COPY ./docker/supervisord.conf /etc/supervisord.conf
COPY ./docker/entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "supervisord", "-n" ]