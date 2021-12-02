. ./env.sh

confluent kafka topic create transactions --partitions 1 --cluster $SOURCE_ID

confluent kafka mirror create transactions --link confluent-link --cluster $TARGET_ID 
