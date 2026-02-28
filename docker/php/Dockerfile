FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git curl zip unzip libpng-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_HOME="/root/.composer"
ENV PATH="$PATH:/root/.composer/vendor/bin"

WORKDIR /var/www

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]