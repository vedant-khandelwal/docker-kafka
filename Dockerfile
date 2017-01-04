
FROM ubuntu:14.04

# Disable prompts from apt.
ENV DEBIAN_FRONTEND noninteractive

# Install Java 8 JRE and curl.
RUN apt-get update && \
	apt-get install -y unzip && \
	apt-get install -y wget && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install -y -q openjdk-8-jre curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY start.sh /

#install kafka
RUN wget -O confluent.zip http://packages.confluent.io/archive/3.1/confluent-oss-3.1.1-2.11.zip && \
	unzip confluent.zip && \
	mkdir /opt/falkonry && \
	mkdir /opt/falkonry/confluent && \
	rm -rf confluent.zip && \
	cp -rf confluent-3.1.1/* /opt/falkonry/confluent/


ENTRYPOINT ["/start.sh"]
