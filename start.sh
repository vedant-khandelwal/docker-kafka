#!/bin/bash

cd /opt/falkonry/confluent
mkdir -p /tmp/kafka-logs

#starting zookeeper
./bin/zookeeper-server-start etc/kafka/zookeeper.properties &> /tmp/kafka-logs/zookeeper.log &
sleep 20s

#starting kafka server
./bin/kafka-server-start etc/kafka/server.properties &> /tmp/kafka-logs/kafka.log &
sleep 10s

#starting schema registry
./bin/schema-registry-start etc/schema-registry/schema-registry.properties &> /tmp/kafka-logs/schema-registry.log &
sleep 10s

#starting kafka rest server
./bin/kafka-rest-start etc/kafka-rest/kafka-rest.properties