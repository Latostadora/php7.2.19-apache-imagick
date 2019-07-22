FROM php:7.2.19-apache

RUN apt-get update \
	&&  apt-get install -y libmemcached-dev zlib1g-dev imagemagick libmagickwand-dev bc

RUN pecl install -o -f imagick-3.4.3 \
	&&  rm -rf /tmp/pear \
	&&  docker-php-ext-enable imagick

RUN apt-get install -y git

RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-configure zip --with-libzip \
  && docker-php-ext-install zip