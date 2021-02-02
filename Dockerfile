FROM composer:2.0.8

RUN apk update && \
    apk add --no-cache \
    libzip-dev \
    libjpeg-turbo-dev \
    zlib-dev \
    libpng-dev \
    freetype-dev

RUN docker-php-ext-install gd

RUN docker-php-ext-configure gd \
  --enable-gd \
  --with-jpeg \
  --with-freetype \
  --enable-shared 

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
