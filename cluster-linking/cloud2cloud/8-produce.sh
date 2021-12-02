. ./env.sh
. ./keys.sh

confluent api-key use $SRC_CLI_API_KEY --resource $SOURCE_ID

seq 1 5 | confluent kafka topic produce dr-topic --cluster $SOURCE_ID
