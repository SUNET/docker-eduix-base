FROM debian:stable
MAINTAINER Jarkko Leponiemi "jarkko.leponiemi@eduix.fi"
# ARG JAVA_VERSION=8u181
# ARG BUILD_VERSION=b13
# ARG ORACLE_HASH=96a7b8442fe848ef90c96a2fad6ed6d1
# ARG JDK_SHA256_CHECKSUM=1845567095bfbfebd42ed0d09397939796d05456290fb20a83c476ba09f991d3
ENV ATLASSIAN_USER_ID 434
ENV ATLASSIAN_GROUP_ID 434
# ENV JAVA_HOME /usr/java/latest
ENV JAVA_HOME /usr
# ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
# ENV PATH $PATH:/usr/java/latest/bin

# Copying the Dockerfile to the image as documentation
COPY Dockerfile /
COPY setup.sh /opt/sunet/setup.sh
RUN /opt/sunet/setup.sh
WORKDIR /opt/atlassian
