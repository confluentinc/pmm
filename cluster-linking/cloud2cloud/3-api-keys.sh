. ./env.sh

# API key and secret for the cluster link

echo CREATING API KEY AND SECRET FOR THE CLUSTER LINK

confluent api-key create --resource $SOURCE_ID --service-account $LINK_SERVICE_ACCOUNT_ID


# API key and secret for the CLI on the source cluster

echo CREATING API KEY AND SECRET FOR THE SOURCE CLUSTER CLI

confluent api-key create --resource $SOURCE_ID --service-account $CLI_SERVICE_ACCOUNT_ID

# API key and secret for the CLI on the destination cluster

echo CREATING API KEY AND SECRET FOR THE DR CLUSTER CLI

confluent api-key create --resource $TARGET_ID --service-account $CLI_SERVICE_ACCOUNT_ID
