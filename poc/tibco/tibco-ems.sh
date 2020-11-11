#!/bin/bash

source ${DIR}/utils.sh

docker-compose up -d

log "Sending EMS messages m1 m2 m3 m4 m5 in queue connector-quickstart"

docker exec tibco-ems bash -c '
cd /opt/tibco/ems/8.5/samples/java
export TIBEMS_JAVA=/opt/tibco/ems/8.5/lib
CLASSPATH=${TIBEMS_JAVA}/jms-2.0.jar:${CLASSPATH}
CLASSPATH=.:${TIBEMS_JAVA}/tibjms.jar:${TIBEMS_JAVA}/tibjmsadmin.jar:${CLASSPATH}
export CLASSPATH
javac *.java
java tibjmsMsgProducer -user admin -queue connector-quickstart m1 m2 m3 m4 m5'


log "Creating TIBCO EMS source connector"
curl -X PUT \
     -H "Content-Type: application/json" \
     --data '{
               "connector.class": "io.confluent.connect.tibco.TibcoSourceConnector",
                    "tasks.max": "1",
                    "kafka.topic": "from-tibco",
                    "tibco.url": "tcp://tibco-ems:7222",
                    "tibco.username": "admin",
                    "tibco.password": "",
                    "jms.destination.type": "queue",
                    "jms.destination.name": "connector-quickstart",
                    "key.converter": "org.apache.kafka.connect.storage.StringConverter",
                    "value.converter": "org.apache.kafka.connect.storage.StringConverter",
                    "confluent.topic.bootstrap.servers": "broker:9092",
                    "confluent.topic.replication.factor": "1"
          }' \
     http://localhost:8083/connectors/tibco-ems-source/config | jq .

sleep 5


log "Verify we have received the data in from-tibco-messages topic"
timeout 60 docker exec connect kafka-console-consumer -bootstrap-server broker:9092 --topic from-tibco --from-beginning --max-messages 2
