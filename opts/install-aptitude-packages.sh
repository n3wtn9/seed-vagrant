#! /bin/bash

apt-get update

apt-get install -y --force-yes \
  build-essential \
  lbzip2 \
  unzip \
  apt-utils \
  python-pip \
  python-dev
