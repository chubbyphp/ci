FROM rockylinux:9.3

SHELL ["/bin/bash", "-c"]

RUN dnf upgrade -y --refresh

RUN dnf install -y epel-release https://rpms.remirepo.net/enterprise/remi-release-9.rpm

RUN dnf install -y --nobest \
    compat-openssl11 \
    git \
    glibc-langpack-de \
    langpacks-de \
    nmap-ncat \
    php83-php-ast \
    php83-php-bcmath \
    php83-php-cli \
    php83-php-devel \
    php83-php-intl \
    php83-php-mbstring \
    php83-php-opcache \
    php83-php-pecl-apcu \
    php83-php-pecl-memcached \
    php83-php-pecl-mongodb \
    php83-php-pecl-swoole5 \
    php83-php-pecl-xdebug3 \
    php83-php-pecl-zip \
    php83-php-pgsql \
    php83-php-sodium \
    php83-php-xml \
    procps-ng \
    sudo \
    supervisor \
    unzip \
    vim \
    zsh

RUN ln -sf /usr/bin/php83 /usr/bin/php \
    && echo "apc.enable_cli=On" >> /etc/opt/remi/php83/php.d/40-apcu.ini \
    && echo "xdebug.mode=coverage" >> /etc/opt/remi/php83/php.d/15-xdebug.ini

ENV TZ=Europe/Zurich

RUN echo "LANG=de_CH.UTF-8" > /etc/locale.conf \
    && cp -f /usr/share/zoneinfo/${TZ} /etc/localtime

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
