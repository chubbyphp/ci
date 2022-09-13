FROM rockylinux:9.0

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
    php80-php-pecl-pcov \
    php80-php-pecl-swoole5 \
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
    && echo "extension=pcov.so" > /etc/opt/remi/php80/php.d/40-pcov.ini

RUN echo "LANG=de_CH.UTF-8" > /etc/locale.conf \
    && cp -f /usr/share/zoneinfo/Europe/Zurich /etc/localtime

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
