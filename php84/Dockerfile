FROM rockylinux/rockylinux:10.0

SHELL ["/bin/bash", "-c"]

RUN dnf upgrade -y --refresh

RUN dnf install -y epel-release https://rpms.remirepo.net/enterprise/remi-release-10.rpm

RUN dnf install -y --nobest \
    git \
    glibc-langpack-de \
    langpacks-de \
    nmap-ncat \
    php84-php-ast \
    php84-php-bcmath \
    php84-php-cli \
    php84-php-devel \
    php84-php-intl \
    php84-php-mbstring \
    php84-php-opcache \
    php84-php-pecl-apcu \
    php84-php-pecl-memcached \
    php84-php-pecl-mongodb \
    php84-php-pecl-redis \
    php84-php-pecl-swoole6 \
    php84-php-pecl-xdebug3 \
    php84-php-pecl-zip \
    php84-php-pgsql \
    php84-php-sodium \
    php84-php-xml \
    procps-ng \
    sudo \
    supervisor \
    unzip \
    vim \
    zsh

RUN ln -sf /usr/bin/php84 /usr/bin/php \
    && echo "apc.enable_cli=On" >> /etc/opt/remi/php84/php.d/40-apcu.ini \
    && echo "xdebug.mode=coverage" >> /etc/opt/remi/php84/php.d/15-xdebug.ini \
    && echo 'memory_limit=256M' >> /etc/opt/remi/php84/php.ini

ENV TZ=Europe/Zurich

RUN echo "LANG=de_CH.UTF-8" > /etc/locale.conf \
    && cp -f /usr/share/zoneinfo/${TZ} /etc/localtime

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
