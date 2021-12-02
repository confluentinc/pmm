. ./env.sh


# 
# Delete mirrored topics
#

confluent api-key use $SRC_CLI_API_KEY --resource $SOURCE_ID
confluent kafka topic delete dr-topic



#
# Terminate cluster link
# 

confluent kakfa link delete confluent-link

#
# Delete API-keys, service accounts, generated config files
# (left as exercise for reader in case you want to keep for reference)
#
