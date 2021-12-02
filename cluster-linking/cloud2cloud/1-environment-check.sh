echo ENVIRONMENT CHECK:
echo
echo your current Confluent Cloud clusters are:
echo
confluent kafka cluster list 
echo
for server in `confluent kafka cluster list -o "json" | jq '.[].id' | sed -e 's/"//g'`; do
echo id
confluent kafka cluster describe $server -o "json" | jq '.id'
echo name
confluent kafka cluster describe $server -o "json" | jq '.name'
echo bootstrap server
confluent kafka cluster describe $server -o "json" | jq '.endpoint'
echo
done

echo COPY templates/env.sh and open it for editing. Add this information but
echo leave the file open. We're adding more later.
