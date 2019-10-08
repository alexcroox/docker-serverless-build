FROM debian:jessie
MAINTAINER dev@hectare.farm

USER root
RUN apt-get --yes --force-yes -y update \
    && apt-get install --yes --force-yes -y curl gnupg bzip2 apt-transport-https \
    && echo "deb http://packages.dotdeb.org jessie all" > /etc/apt/sources.list.d/dotdeb.list \
    && curl -sS https://www.dotdeb.org/dotdeb.gpg | apt-key add - \
    && apt-get update -qq -y --force-yes \
    #&& apt-get --yes --force-yes -y install php7.0-cli php7.0-apcu php7.0-apcu-bc php7.0-curl php7.0-json php7.0-mcrypt php7.0-opcache php7.0-readline php7.0-mysql php7.0-xml php7.0-zip php7.0-mbstring php7.0-gd php7.0-intl \
    #&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get install --yes --force-yes -y python3 xvfb libgtk-3-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 python3-pip libyaml-dev \
    && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update && apt-get install -y --force-yes google-chrome-stable \
    && pip3 install awscli --upgrade

# Install Nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - &&\
    apt-get install -y nodejs git --force-yes -y &&\
    npm i -g lighthouse &&\
    npm install -g serverless &&\
    npm install -g appcenter-cli
