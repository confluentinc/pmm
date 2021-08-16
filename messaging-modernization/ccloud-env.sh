. ./ccloud-env

DOCKER_TEMPLATE=docker-compose-ccloud-connect.yml.template

ACTIVEMQ_TEMPLATE=scripts/activemq/create-active-cc-connector.sh.template
ACTIVEMQ_OUT=scripts/activemq/create-active-cc-connector.sh

IBMMQ_TEMPLATE=scripts/ibmmq/create-ibmmq-cc-connector.sh.template
IBMMQ_OUT=scripts/ibmmq/create-ibmmq-cc-connector.sh

RABBIT_TEMPLATE=scripts/rabbit/create-rabbit-cc-connector.sh.template
RABBIT_OUT=scripts/rabbit/create-rabbit-cc-connector.sh

TIBCO_TEMPLATE=scripts/tibco/create-tibco-cc-connector.sh.template
TIBCO_OUT=scripts/tibco/create-tibco-cc-connector.sh

#
# Generate docker-compose file which specificies your confluent cloud cluster
#

cat $DOCKER_TEMPLATE | \
 sed -e "s^%CCLOUD_BROKER_HOST%^$CCLOUD_BROKER_HOST^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_API_KEY%^$CCLOUD_SCHEMA_REGISTRY_API_KEY^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_API_SECRET%^$CCLOUD_SCHEMA_REGISTRY_API_SECRET^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_URL%^$CCLOUD_SCHEMA_REGISTRY_URL^g" \
     -e "s^%CCLOUD_API_KEY%^$CCLOUD_API_KEY^g" \
     -e "s^%CCLOUD_API_SECRET%^$CCLOUD_API_SECRET^g" > docker-compose-ccloud-connect.yml

#
# Generate activemq connect configuration that specifies this confluent cloud cluster
#

cat $ACTIVEMQ_TEMPLATE | 
 sed -e "s^%CCLOUD_BROKER_HOST%^$CCLOUD_BROKER_HOST^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_API_KEY%^$CCLOUD_SCHEMA_REGISTRY_API_KEY^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_API_SECRET%^$CCLOUD_SCHEMA_REGISTRY_API_SECRET^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_URL%^$CCLOUD_SCHEMA_REGISTRY_URL^g" \
     -e "s^%CCLOUD_API_KEY%^$CCLOUD_API_KEY^g" \
     -e "s^%CCLOUD_API_SECRET%^$CCLOUD_API_SECRET^g" > $ACTIVEMQ_OUT 

cat $IBMMQ_TEMPLATE | 
 sed -e "s^%CCLOUD_BROKER_HOST%^$CCLOUD_BROKER_HOST^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_API_KEY%^$CCLOUD_SCHEMA_REGISTRY_API_KEY^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_API_SECRET%^$CCLOUD_SCHEMA_REGISTRY_API_SECRET^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_URL%^$CCLOUD_SCHEMA_REGISTRY_URL^g" \
     -e "s^%CCLOUD_API_KEY%^$CCLOUD_API_KEY^g" \
     -e "s^%CCLOUD_API_SECRET%^$CCLOUD_API_SECRET^g" > $IBMMQ_OUT 

cat $RABBIT_TEMPLATE | 
 sed -e "s^%CCLOUD_BROKER_HOST%^$CCLOUD_BROKER_HOST^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_API_KEY%^$CCLOUD_SCHEMA_REGISTRY_API_KEY^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_API_SECRET%^$CCLOUD_SCHEMA_REGISTRY_API_SECRET^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_URL%^$CCLOUD_SCHEMA_REGISTRY_URL^g" \
     -e "s^%CCLOUD_API_KEY%^$CCLOUD_API_KEY^g" \
     -e "s^%CCLOUD_API_SECRET%^$CCLOUD_API_SECRET^g" > $RABBIT_OUT 
 
cat $TIBCO_TEMPLATE | 
 sed -e "s^%CCLOUD_BROKER_HOST%^$CCLOUD_BROKER_HOST^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_API_KEY%^$CCLOUD_SCHEMA_REGISTRY_API_KEY^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_API_SECRET%^$CCLOUD_SCHEMA_REGISTRY_API_SECRET^g" \
     -e "s^%CCLOUD_SCHEMA_REGISTRY_URL%^$CCLOUD_SCHEMA_REGISTRY_URL^g" \
     -e "s^%CCLOUD_API_KEY%^$CCLOUD_API_KEY^g" \
     -e "s^%CCLOUD_API_SECRET%^$CCLOUD_API_SECRET^g" > $TIBCO_OUT 
 
