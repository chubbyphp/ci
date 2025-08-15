FROM rockylinux/rockylinux:10.0

SHELL ["/bin/bash", "-c"]

RUN dnf upgrade -y --refresh

RUN dnf install -y epel-release https://rpms.remirepo.net/enterprise/remi-release-10.rpm

RUN dnf install -y --nobest \
    git \
    glibc-langpack-de \
    langpacks-de \
    nmap-ncat \
    php82-php-ast \
    php82-php-bcmath \
    php82-php-cli \
    php82-php-devel \
    php82-php-intl \
    php82-php-mbstring \
    php82-php-opcache \
    php82-php-pecl-apcu \
    php82-php-pecl-memcached \
    php82-php-pecl-mongodb \
    php82-php-pecl-redis \
    php82-php-pecl-swoole5 \
    php82-php-pecl-xdebug3 \
    php82-php-pecl-zip \
    php82-php-pgsql \
    php82-php-sodium \
    php82-php-xml \
    procps-ng \
    sudo \
    supervisor \
    unzip \
    vim \
    zsh

RUN ln -sf /usr/bin/php82 /usr/bin/php \
    && echo "apc.enable_cli=On" >> /etc/opt/remi/php82/php.d/40-apcu.ini \
    && echo "xdebug.mode=coverage" >> /etc/opt/remi/php82/php.d/15-xdebug.ini \
    && echo 'memory_limit=256M' >> /etc/opt/remi/php82/php.ini

ENV TZ=Europe/Zurich

RUN echo "LANG=de_CH.UTF-8" > /etc/locale.conf \
    && cp -f /usr/share/zoneinfo/${TZ} /etc/localtime

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
