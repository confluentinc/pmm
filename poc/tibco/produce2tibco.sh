#!/bin/bash
set -e

DIR=`dirname $0`
source ${DIR}/utils.sh

log "Sending EMS messages in queue connector-quickstart"
docker exec tibco-ems bash -c '
cd /opt/tibco/ems/8.5/samples/java
export TIBEMS_JAVA=/opt/tibco/ems/8.5/lib
CLASSPATH=${TIBEMS_JAVA}/jms-2.0.jar:${CLASSPATH}
CLASSPATH=.:${TIBEMS_JAVA}/tibjms.jar:${TIBEMS_JAVA}/tibjmsadmin.jar:${CLASSPATH}
export CLASSPATH
javac *.java
date
java tibjmsMsgProducer -user admin -queue connector-quickstart "{\"transaction\": \"PAYMENT\", \"amount\": \"\$'$(jot -r -p 1 1 20 200)'\", \"timestamp\": \"$(date)\" }"'
