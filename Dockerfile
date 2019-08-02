FROM debian:jessie
MAINTAINER dev@hectare.farm

USER root
RUN apt-get --yes --force-yes -y update \
    && apt-get install --yes --force-yes -y curl \
    && apt-get install --yes --force-yes -y bzip2 \
    && echo "deb http://packages.dotdeb.org jessie all" > /etc/apt/sources.list.d/dotdeb.list \
    && curl -sS https://www.dotdeb.org/dotdeb.gpg | apt-key add - \
    && apt-get update -qq -y \
    && apt-get --yes --force-yes -y install php7.0-cli php7.0-apcu php7.0-apcu-bc php7.0-curl php7.0-json php7.0-mcrypt php7.0-opcache php7.0-readline php7.0-mysql php7.0-xml php7.0-zip php7.0-mbstring php7.0-gd php7.0-intl \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get install --yes --force-yes -y python3 \
    && apt-get install python3-pip --yes --force-yes -y \
    && apt-get install libyaml-dev --yes --force-yes -y \
    && pip3 install awscli --upgrade

# Install Nodejs
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - &&\
    apt-get install -y nodejs git --force-yes -y &&\
    npm install -g serverless &&\
    npm install -g appcenter-cli
