FROM rockylinux/rockylinux:8.10

SHELL ["/bin/bash", "-c"]

RUN dnf upgrade -y --refresh

RUN dnf install -y dnf-plugins-core && dnf config-manager --set-enabled powertools

RUN dnf install -y epel-release https://rpms.remirepo.net/enterprise/remi-release-8.rpm

RUN dnf install -y --nobest \
    openssl \
    git \
    glibc-langpack-de \
    langpacks-de \
    nmap-ncat \
    php72-php-ast \
    php72-php-bcmath \
    php72-php-cli \
    php72-php-devel \
    php72-php-intl \
    php72-php-mbstring \
    php72-php-opcache \
    php72-php-pecl-apcu \
    php72-php-pecl-memcached \
    php72-php-pecl-mongodb \
    php72-php-pecl-swoole4 \
    php72-php-pecl-xdebug3 \
    php72-php-pecl-zip \
    php72-php-pgsql \
    php72-php-sodium \
    php72-php-xml \
    procps-ng \
    sudo \
    supervisor \
    unzip \
    vim \
    zsh

RUN ln -sf /usr/bin/php72 /usr/bin/php \
    && echo "apc.enable_cli=On" >> /etc/opt/remi/php72/php.d/40-apcu.ini \
    && echo "xdebug.mode=coverage" >> /etc/opt/remi/php72/php.d/15-xdebug.ini \
    && echo 'memory_limit=256M' >> /etc/opt/remi/php72/php.ini

ENV TZ=Europe/Zurich

RUN echo "LANG=de_CH.UTF-8" > /etc/locale.conf \
    && cp -f /usr/share/zoneinfo/${TZ} /etc/localtime

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
