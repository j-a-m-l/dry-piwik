FROM php:fpm
MAINTAINER Juan A. Martín Lucas <dev@jaml.site>

RUN apt-get update && apt-get install -y \
			cron \
			libjpeg-dev \
			libfreetype6-dev \
			libgeoip-dev \
			libpng12-dev \
			ssmtp \
			zip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 0xb5dbd5925590a237

RUN docker-php-ext-configure gd --with-freetype-dir=/usr --with-png-dir=/usr --with-jpeg-dir=/usr \
 && docker-php-ext-install gd mbstring mysql pdo_mysql zip

RUN pecl install APCu-beta geoip

ENV PIWIK_VERSION 2.14.3

VOLUME /var/www/html/

RUN curl -fsSL -o piwik.tar.gz "https://builds.piwik.org/piwik-${PIWIK_VERSION}.tar.gz" \
 && curl -fsSL -o piwik.tar.gz.asc "https://builds.piwik.org/piwik-${PIWIK_VERSION}.tar.gz.asc" \
 && gpg --verify piwik.tar.gz.asc \
 && tar -xzf piwik.tar.gz -C /usr/src/ \
 && rm piwik.tar.gz piwik.tar.gz.asc

COPY config/php/base.ini /usr/local/etc/php/php.ini
COPY config/php/docker-php-ext-geoip.ini /usr/local/etc/php/conf.d/docker-php-ext-geoip.ini

RUN cd /usr/src/piwik/misc \
 && curl http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz > GeoLiteCity.dat.gz \
 && gunzip GeoLiteCity.dat.gz \
 && mv GeoLiteCity.dat GeoIPCity.dat

COPY config/piwik/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
