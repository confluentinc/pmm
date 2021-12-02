. ./env.sh
. ./keys.sh

confluent api-key use $SRC_CLI_API_KEY --resource $SOURCE_ID

confluent kafka topic consume dr-topic --group cli-consumer --from-beginning
