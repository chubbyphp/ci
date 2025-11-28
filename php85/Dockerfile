FROM rockylinux/rockylinux:10.0

SHELL ["/bin/bash", "-c"]

RUN dnf upgrade -y --refresh

RUN dnf install -y epel-release https://rpms.remirepo.net/enterprise/remi-release-10.rpm

RUN dnf install -y --nobest \
    git \
    glibc-langpack-de \
    langpacks-de \
    nmap-ncat \
    php85-php-ast \
    php85-php-bcmath \
    php85-php-cli \
    php85-php-devel \
    php85-php-intl \
    php85-php-mbstring \
    php85-php-opcache \
    php85-php-pecl-apcu \
    php85-php-pecl-memcached \
    php85-php-pecl-mongodb \
    php85-php-pecl-redis \
    php85-php-pecl-swoole6 \
    php85-php-pecl-xdebug3 \
    php85-php-pecl-zip \
    php85-php-pgsql \
    php85-php-sodium \
    php85-php-xml \
    procps-ng \
    sudo \
    supervisor \
    unzip \
    vim \
    zsh

RUN ln -sf /usr/bin/php85 /usr/bin/php \
    && echo "apc.enable_cli=On" >> /etc/opt/remi/php85/php.d/40-apcu.ini \
    && echo "xdebug.mode=coverage" >> /etc/opt/remi/php85/php.d/15-xdebug.ini \
    && echo 'memory_limit=256M' >> /etc/opt/remi/php85/php.ini

ENV TZ=Europe/Zurich

RUN echo "LANG=de_CH.UTF-8" > /etc/locale.conf \
    && cp -f /usr/share/zoneinfo/${TZ} /etc/localtime

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
