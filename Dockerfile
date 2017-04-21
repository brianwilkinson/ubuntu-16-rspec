FROM 1and1internet/ubuntu-16
MAINTAINER brian.wojtczak@1and1.co.uk
ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /
RUN \
  apt-get update -q && \
  apt-get install -q -o Dpkg::Options::=--force-confdef -y git make ruby ruby-rspec xvfb ruby-ffi firefox=45.0.2+build1-0ubuntu1 && \
  gem install serverspec docker-api watir watir-ng headless && \
  apt-get clean -q -y && \
  rm -rf /var/lib/apt/lists/*
WORKDIR /mnt
CMD /bin/bash

