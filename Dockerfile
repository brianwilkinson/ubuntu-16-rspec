FROM 1and1internet/ubuntu-16
MAINTAINER brian.wojtczak@1and1.co.uk
ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /
RUN \
  apt-get update -q && \
  apt-get install -q -o Dpkg::Options::=--force-confdef -y ruby-rspec git && \
  gem install serverspec docker-api && \
  apt-get clean -q -y && \
  rm -rf /var/lib/apt/lists/*
CMD /bin/bash

