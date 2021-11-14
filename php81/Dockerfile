FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

RUN apt-get update -y && apt-get install -y \
    curl \
    git \
    gnupg2 \
    locales \
    netcat \
    openssh-client \
    tzdata \
    unzip

RUN locale-gen de_CH.UTF-8 && update-locale LANG=de_CH.UTF-8 LC_ALL=de_CH.UTF-8 \
    && cp -f /usr/share/zoneinfo/Europe/Zurich /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata

RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu focal main" > /etc/apt/sources.list.d/ondrej-ubuntu-php.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C
    # keys.andreas-puls.de

RUN apt-get update -y && apt-get install -y \
    php8.1-apcu \
    php8.1-ast \
    php8.1-bcmath \
    php8.1-cli \
    php8.1-curl \
    php8.1-dev \
    php8.1-intl \
    php8.1-mbstring \
    php8.1-mongodb \
    php8.1-opcache \
    php8.1-pcov \
    php8.1-pgsql \
    php8.1-readline \
    php8.1-sqlite \
    php8.1-swoole \
    php8.1-xml \
    php8.1-zip

RUN echo -e "apc.enable_cli=On" >> /etc/php/8.1/cli/conf.d/20-apcu.ini \
    && echo -e "error_reporting = E_ALL\ndisplay_errors = On\ndisplay_startup_errors = On" > /etc/php/8.1/cli/conf.d/99-development.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
