curl -X POST -H "Content-Type: application/json" --data '
{
 "name": "mongodb-sink",
 "config": {
     "connector.class":"com.mongodb.kafka.connect.MongoSinkConnector",
     "tasks.max":"1",
     "topics": "JND",
     "connection.uri":"mongodb://mongo1:27017,mongo2:27018,mongo3:27019",
     "database":"trades",
     "collection":"trade-data",
     "key.converter":"org.apache.kafka.connect.storage.StringConverter",
     "key.converter.schemas.enable":false,
     "value.converter":"org.apache.kafka.connect.storage.StringConverter",
     "value.converter.schemas.enable":false
 }
}' http://localhost:8083/connectors -w "\n"
