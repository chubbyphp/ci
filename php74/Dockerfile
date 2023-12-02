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
    php74-php-ast \
    php74-php-bcmath \
    php74-php-cli \
    php74-php-devel \
    php74-php-intl \
    php74-php-mbstring \
    php74-php-opcache \
    php74-php-pecl-apcu \
    php74-php-pecl-memcached \
    php74-php-pecl-mongodb \
    php74-php-pecl-swoole4 \
    php74-php-pecl-xdebug3 \
    php74-php-pecl-zip \
    php74-php-pgsql \
    php74-php-sodium \
    php74-php-xml \
    procps-ng \
    sudo \
    supervisor \
    unzip \
    vim \
    zsh

RUN ln -sf /usr/bin/php74 /usr/bin/php \
    && echo "apc.enable_cli=On" >> /etc/opt/remi/php74/php.d/40-apcu.ini \
    && echo "xdebug.mode=coverage" >> /etc/opt/remi/php74/php.d/15-xdebug.ini

ENV TZ=Europe/Zurich

RUN echo "LANG=de_CH.UTF-8" > /etc/locale.conf \
    && cp -f /usr/share/zoneinfo/${TZ} /etc/localtime

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
