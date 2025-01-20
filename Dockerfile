FROM wordpress:6.7-php8.3-apache

ENV TZ=Asia/Jakarta \
		WORDPRESS_DB_HOST=database \
		WORDPRESS_DB_NAME=devdata \
		WORDPRESS_DB_USER=root \
		WORDPRESS_DB_PASSWORD=root \
		WORDPRESS_TABLE_PREFIX=wp_ \
		WORDPRESS_DEBUG=0 \
		WORDPRESS_CONFIG_EXTRA="define('WP_DEBUG', false);"
RUN apt-get update \
		&& apt install -y --no-install-recommends tzdata \
		&& pecl install redis -o -f redis \
		&& echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
		&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar \
		&& mv wp-cli.phar /usr/local/bin/wp \
		&& apt-get autoremove -y \
		&& apt-get clean \
		&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./wordpress /var/www/html
