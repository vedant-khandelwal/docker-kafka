
FROM ubuntu:14.04

# Disable prompts from apt.
ENV DEBIAN_FRONTEND noninteractive

# Install Java 8 JRE and curl.
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install -y -q openjdk-8-jre curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

cp start.sh /

#install kafka


ENTRYPOINT ["/start.sh"]
