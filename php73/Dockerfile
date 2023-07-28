FROM rockylinux:8.8

SHELL ["/bin/bash", "-c"]

RUN dnf upgrade -y --refresh

RUN dnf install -y dnf-plugins-core && dnf config-manager --set-enabled powertools

RUN dnf install -y epel-release https://rpms.remirepo.net/enterprise/remi-release-8.8.rpm

RUN dnf install -y --nobest \
    openssl \
    git \
    glibc-langpack-de \
    langpacks-de \
    nmap-ncat \
    php73-php-ast \
    php73-php-bcmath \
    php73-php-cli \
    php73-php-devel \
    php73-php-intl \
    php73-php-mbstring \
    php73-php-opcache \
    php73-php-pecl-apcu \
    php73-php-pecl-memcached \
    php73-php-pecl-mongodb \
    php73-php-pecl-swoole4 \
    php73-php-pecl-xdebug3 \
    php73-php-pecl-zip \
    php73-php-pgsql \
    php73-php-sodium \
    php73-php-xml \
    procps-ng \
    sudo \
    supervisor \
    unzip \
    vim \
    zsh

RUN ln -sf /usr/bin/php73 /usr/bin/php \
    && echo "apc.enable_cli=On" >> /etc/opt/remi/php73/php.d/40-apcu.ini \
    && echo "xdebug.mode=coverage" >> /etc/opt/remi/php73/php.d/15-xdebug.ini

ENV TZ=Europe/Zurich

RUN echo "LANG=de_CH.UTF-8" > /etc/locale.conf \
    && cp -f /usr/share/zoneinfo/${TZ} /etc/localtime

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
