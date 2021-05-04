curl -X POST -H "Content-Type: application/json" --data '
{
  "name": "datagen-trades",
  "config": {
    "connector.class": "io.confluent.kafka.connect.datagen.DatagenConnector",
    "kafka.topic": "trades-topic",
    "quickstart": "stock_trades",
    "key.converter": "org.apache.kafka.connect.storage.StringConverter",
    "value.converter": "org.apache.kafka.connect.json.JsonConverter",
    "value.converter.schemas.enable": "false",
    "max.interval": 1000,
    "iterations": 10000000,
    "tasks.max": "1"
  }
} ' http://localhost:8083/connectors -w "\n"
