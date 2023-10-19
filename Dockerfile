FROM debian:bullseye
MAINTAINER Jarkko Leponiemi "jarkko.leponiemi@eduix.fi"
ENV ATLASSIAN_USER_ID 434
ENV ATLASSIAN_GROUP_ID 434
ENV JAVA_HOME /usr

# Copying the Dockerfile to the image as documentation
COPY Dockerfile /
COPY setup.sh /opt/sunet/setup.sh
RUN /opt/sunet/setup.sh
WORKDIR /opt/atlassian
