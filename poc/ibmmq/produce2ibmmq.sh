echo '{"transaction": "PAYMENT", "amount": "$'$(jot -r -p 1 1 20 200)'", "timestamp": "'$(date)'" }' | \
 docker exec -i ibmmq /opt/mqm/samp/bin/amqsput DEV.QUEUE.1 
