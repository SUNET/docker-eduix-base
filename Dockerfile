FROM debian:stable
MAINTAINER Juha Leppälä "juha@eduix.fi"
ARG JAVA_VERSION=8u161
ARG BUILD_VERSION=b12
ARG ORACLE_HASH=2f38c3b165be4555a1fa6e98c45e0808
ARG JDK_SHA256_CHECKSUM=6dbc56a0e3310b69e91bb64db63a485bd7b6a8083f08e48047276380a0e2021e
ENV ATLASSIAN_USER_ID 434
ENV ATLASSIAN_GROUP_ID 434
ENV JAVA_HOME /usr/java/latest
ENV PATH $PATH:/usr/java/latest/bin

# Copying the Dockerfile to the image as documentation
COPY Dockerfile /
COPY setup.sh /opt/sunet/setup.sh
RUN /opt/sunet/setup.sh
WORKDIR /opt/atlassian

USER atlassian
