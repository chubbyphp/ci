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
    php7.2-apcu \
    php7.2-ast \
    php7.2-cli \
    php7.2-curl \
    php7.2-dev \
    php7.2-json \
    php7.2-mbstring \
    php7.2-mongodb \
    php7.2-opcache \
    php7.2-pgsql \
    php7.2-readline \
    php7.2-sqlite \
    php7.2-xml \
    php7.2-zip

RUN yes '' | pecl install pcov swoole

RUN echo -e "extension=pcov.so" > /etc/php/7.2/cli/conf.d/20-pcov.ini \
    && echo -e "extension=swoole.so" > /etc/php/7.2/cli/conf.d/20-swoole.ini \
    && echo -e "error_reporting = E_ALL\ndisplay_errors = On\ndisplay_startup_errors = On" > /etc/php/7.2/cli/conf.d/99-development.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
