#!/bin/bash

set -e
set -x

export DEBIAN_FRONTEND noninteractive

# Use the mirror hosted within SUNET in Sweden
/bin/sed -i s/deb.debian.org/ftp.se.debian.org/g /etc/apt/sources.list

# Update the image and install common tools for debugging
apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get install -y \
      iputils-ping \
      procps \
      bind9-host \
      netcat-openbsd \
    && apt-get -y autoremove \
    && apt-get autoclean

# Do some more cleanup to save space
rm -rf /var/lib/apt/lists/*

# Create non-privileged user that should run the apps.
addgroup --system eduix
adduser --system --no-create-home --ingroup eduix --shell /bin/false eduix
