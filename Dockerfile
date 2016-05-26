FROM ubuntu:xenial
MAINTAINER james.wilkins@fasthosts.co.uk
ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /
RUN \
  apt-get -y update && \
  apt-get -y install ruby-rspec ruby-serverspec ruby-docker-api git && \
  gem install specinfra-backend-docker_compose && \
  locale-gen en_GB.utf8 && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/* && \
  git clone https://github.com/jameseck/specinfra.git /tmp/specinfra.git && \
  cd /tmp/specinfra.git && \
  gem build specinfra.gemspec && \
  gem install ./specinfra*.gem && \
  rm -rf /tmp/specinfra.git
ENV \
  LC_ALL=en_GB.UTF-8 \
  LANG=en_GB.UTF-8 \
  LANGUAGE=en_GB.UTF-8
CMD /bin/bash
