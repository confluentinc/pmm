. ./env.sh

confluent kafka link create confluent-link \
  --cluster $TARGET_ID \
  --source-cluster-id $SOURCE_ID \
  --source-bootstrap-server $SOURCE_BOOTSTRAP  \
  --config-file dr-link.config
