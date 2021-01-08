Messaging modernization demonstration with Confluent. Uses kafka connectors
for IBM MQ, ActiveMQ, Tibco and RabbitMQ to stream data into Kafka, then 
ksqlDB to merge or join the data. See reference arhcitecture whitepaper for 
more information. 

Included:
- `docker-compose.yml` Based on `cp-all-in-one`. Spins up Kafka, Kafka Connect, Elastic, IBM MQ, ActiveMQ, RabbitMQ and Tibco. Place dependent jars in jars directory before running.
- `scripts` includes scripts for writing data to queues, launching connectors, checking connector status, and so on.
- `ksqldb` includes reference files for parsing, processing, merging, and joining streams from these sources.
- `jars` for placing dependent jars before running `docker-compose up`  
