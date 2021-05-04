curl -X POST -H "Content-Type: application/json" --data "`cat ./config.json`" http://localhost:8083/connectors -w "\n"
