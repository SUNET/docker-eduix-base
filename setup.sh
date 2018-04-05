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
      curl \
      tar \
      xmlstarlet \
      less \
      unzip \
    && apt-get -y autoremove \
    && apt-get autoclean

# Do some more cleanup to save space
rm -rf /var/lib/apt/lists/*

# Downloading and install Java
mkdir /usr/java   
curl -Ls -H "Cookie: oraclelicense=accept-securebackup-cookie" \
    "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/$ORACLE_HASH/jdk-$JAVA_VERSION-linux-x64.tar.gz" \
    | tar -xz --directory /usr/java --no-same-owner
cd /usr/java
ln -s $(ls) /usr/java/latest

# Create non-privileged user that should run the apps.
groupadd -g $ATLASSIAN_GROUP_ID atlassian
useradd -u $ATLASSIAN_USER_ID -g $ATLASSIAN_GROUP_ID -N --no-create-home -s /sbin/nologin -c "Atlassian user" atlassian
mkdir -p /opt/atlassian && chown atlassian:atlassian /opt/atlassian && chmod 755 /opt/atlassian
mkdir /var/atlassian && chown atlassian:atlassian /var/atlassian && chmod 755 /var/atlassian

cat>/opt/atlassian/atlassian_app.sh<<EOF
#!/bin/bash
echo "Replace me"
EOF
chown atlassian:atlassian /opt/atlassian/atlassian_app.sh \
    && chmod u+wx /opt/atlassian/atlassian_app.sh
