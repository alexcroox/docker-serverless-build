FROM debian:jessie
MAINTAINER dev@hectare.farm

USER root
RUN apt-get --yes --force-yes update \
    && apt-get install --yes --force-yes curl \
    && apt-get install bzip2 \
    && echo "deb http://packages.dotdeb.org jessie all" > /etc/apt/sources.list.d/dotdeb.list \
    && curl -sS https://www.dotdeb.org/dotdeb.gpg | apt-key add - \
    && apt-get update -qq -y \
    && apt-get install --yes --force-yes python3 \
    && apt-get install python3-pip --yes --force-yes \
    && apt-get install libyaml-dev --yes --force-yes \
    && pip3 install awscli --upgrade

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - &&\
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash &&\
    apt-get install -y nodejs git &&\
    npm install -g serverless &&
