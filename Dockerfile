FROM 1and1internet/ubuntu-16
MAINTAINER brian.wojtczak@1and1.co.uk
ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /
RUN \
  apt-get -y update && \
  apt-get -y install ruby-rspec git && \
  gem install serverspec docker-api && \
  locale-gen en_GB.utf8 && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/*
ENV \
  LC_ALL=en_GB.UTF-8 \
  LANG=en_GB.UTF-8 \
  LANGUAGE=en_GB.UTF-8
CMD /bin/bash
