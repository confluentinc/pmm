curl -X POST -H "Content-Type: application/json" --data '
{
  "name": "datagen-users",
  "config": {
    "connector.class": "io.confluent.kafka.connect.datagen.DatagenConnector",
    "kafka.topic": "newtopic",
    "quickstart": "users",
    "key.converter": "org.apache.kafka.connect.storage.StringConverter",
    "value.converter": "org.apache.kafka.connect.json.JsonConverter",
    "value.converter.schemas.enable": "false",
    "max.interval": 5000,
    "iterations": 10000000,
    "tasks.max": "1"
  }
}' http://localhost:8083/connectors -w "\n"
