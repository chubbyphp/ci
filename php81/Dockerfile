FROM rockylinux:9.1

SHELL ["/bin/bash", "-c"]

RUN dnf upgrade -y --refresh

RUN dnf install -y epel-release https://rpms.remirepo.net/enterprise/remi-release-9.1.rpm

RUN dnf install -y --nobest \
    compat-openssl11 \
    git \
    glibc-langpack-de \
    langpacks-de \
    nmap-ncat \
    php81-php-ast \
    php81-php-bcmath \
    php81-php-cli \
    php81-php-devel \
    php81-php-intl \
    php81-php-mbstring \
    php81-php-opcache \
    php81-php-pecl-apcu \
    php81-php-pecl-memcached \
    php81-php-pecl-mongodb \
    php81-php-pecl-swoole5 \
    php81-php-pecl-xdebug3 \
    php81-php-pecl-zip \
    php81-php-pgsql \
    php81-php-sodium \
    php81-php-xml \
    procps-ng \
    sudo \
    supervisor \
    unzip \
    vim \
    zsh

RUN ln -sf /usr/bin/php81 /usr/bin/php \
    && echo "apc.enable_cli=On" >> /etc/opt/remi/php81/php.d/40-apcu.ini \
    && echo "xdebug.mode=coverage" >> /etc/opt/remi/php81/php.d/15-xdebug.ini

RUN echo "LANG=de_CH.UTF-8" > /etc/locale.conf \
    && cp -f /usr/share/zoneinfo/Europe/Zurich /etc/localtime

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
