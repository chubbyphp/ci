FROM rockylinux/rockylinux:9.5

SHELL ["/bin/bash", "-c"]

RUN dnf upgrade -y --refresh

RUN dnf install -y epel-release https://rpms.remirepo.net/enterprise/remi-release-9.rpm

RUN dnf install -y --nobest \
    compat-openssl11 \
    git \
    glibc-langpack-de \
    langpacks-de \
    nmap-ncat \
    php80-php-ast \
    php80-php-bcmath \
    php80-php-cli \
    php80-php-devel \
    php80-php-intl \
    php80-php-mbstring \
    php80-php-opcache \
    php80-php-pecl-apcu \
    php80-php-pecl-memcached \
    php80-php-pecl-mongodb \
    php80-php-pecl-redis \
    php80-php-pecl-swoole5 \
    php80-php-pecl-xdebug3 \
    php80-php-pecl-zip \
    php80-php-pgsql \
    php80-php-sodium \
    php80-php-xml \
    procps-ng \
    sudo \
    supervisor \
    unzip \
    vim \
    zsh

RUN ln -sf /usr/bin/php80 /usr/bin/php \
    && echo "apc.enable_cli=On" >> /etc/opt/remi/php80/php.d/40-apcu.ini \
    && echo "xdebug.mode=coverage" >> /etc/opt/remi/php80/php.d/15-xdebug.ini \
    && echo 'memory_limit=256M' >> /etc/opt/remi/php80/php.ini

ENV TZ=Europe/Zurich

RUN echo "LANG=de_CH.UTF-8" > /etc/locale.conf \
    && cp -f /usr/share/zoneinfo/${TZ} /etc/localtime

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
