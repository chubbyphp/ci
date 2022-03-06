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
    php7.3-apcu \
    php7.3-ast \
    php7.3-bcmath \
    php7.3-cli \
    php7.3-curl \
    php7.3-dev \
    php7.3-intl \
    php7.3-json \
    php7.3-mbstring \
    php7.3-mongodb \
    php7.3-opcache \
    php7.3-pcov \
    php7.3-pgsql \
    php7.3-readline \
    php7.3-sqlite \
    php7.3-swoole \
    php7.3-xml \
    php7.3-zip

RUN ln -sf /usr/bin/php7.3 /etc/alternatives/php

RUN echo -e "apc.enable_cli=On" >> /etc/php/7.3/cli/conf.d/20-apcu.ini \
    && echo -e "error_reporting = E_ALL\ndisplay_errors = On\ndisplay_startup_errors = On" > /etc/php/7.3/cli/conf.d/99-development.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
