. ./env.sh

confluent kafka acl create --allow --service-account $LINK_SERVICE_ACCOUNT_ID --operation READ --operation DESCRIBE_CONFIGS --topic "*" --cluster $SOURCE_ID 

confluent kafka acl create --allow --service-account $LINK_SERVICE_ACCOUNT_ID --operation READ --operation DESCRIBE_CONFIGS --topic "transactions" --prefix --cluster $SOURCE_ID

confluent kafka acl create --allow --service-account $LINK_SERVICE_ACCOUNT_ID --operation DESCRIBE --cluster-scope --cluster $SOURCE_ID

confluent kafka acl create --allow --service-account $LINK_SERVICE_ACCOUNT_ID --operation DESCRIBE --topic "*" --cluster $SOURCE_ID
 
confluent kafka acl create --allow --service-account $LINK_SERVICE_ACCOUNT_ID --operation READ --operation DESCRIBE --consumer-group "*" --cluster $SOURCE_ID

confluent kafka acl create --service-account $CLI_SERVICE_ACCOUNT_ID --allow --operation READ --operation DESCRIBE --operation WRITE --topic "*" --cluster $SOURCE_ID
 
confluent kafka acl create --service-account $CLI_SERVICE_ACCOUNT_ID --allow --operation DESCRIBE --operation READ --consumer-group "*" --cluster $SOURCE_ID 
