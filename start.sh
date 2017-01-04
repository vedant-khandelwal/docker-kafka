#!/bin/bash

cd /opt/falkonry/confluent

#starting zookeeper
./bin/zookeeper-server-start etc/kafka/zookeeper.properties &
sleep 30s

#starting kafka server
./bin/kafka-server-start etc/kafka/server.properties &
sleep 30s

#starting schema registry
./bin/schema-registry-start etc/schema-registry/schema-registry.properties &
sleep 30s

#starting kafka rest server
./bin/kafka-rest-start etc/kafka-rest/kafka-rest.properties