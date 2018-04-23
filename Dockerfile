FROM debian:stable
MAINTAINER Juha Leppälä "juha@eduix.fi"
ARG JAVA_VERSION=8u171
ARG BUILD_VERSION=b11
ARG ORACLE_HASH=512cd62ec5174c3487ac17c61aaa89e8
ARG JDK_SHA256_CHECKSUM=b6dd2837efaaec4109b36cfbb94a774db100029f98b0d78be68c27bec0275982
ENV ATLASSIAN_USER_ID 434
ENV ATLASSIAN_GROUP_ID 434
ENV JAVA_HOME /usr/java/latest
ENV PATH $PATH:/usr/java/latest/bin

# Copying the Dockerfile to the image as documentation
COPY Dockerfile /
COPY setup.sh /opt/sunet/setup.sh
RUN /opt/sunet/setup.sh
WORKDIR /opt/atlassian
