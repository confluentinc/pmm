curl -XPOST -u admin:admin -d "body={\"transaction\": \"PAYMENT\", \"amount\": \"$'$(jot -r -p 1 1 20 200)'\", \"timestamp\": \"$(date)\" }" http://localhost:8161/api/message/DEV.QUEUE.1?type=queue
