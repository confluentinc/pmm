Fantastic tutorial on cluster linking for Confluent Platform to Confluent
Cloud at: 

https://docs.confluent.io/platform/current/multi-dc-deployments/cluster-linking/hybrid-cp.html

Steps as follows:
1. Download CP 7.0 and set $CONFLUENT_HOME and $CONFLUENT_CONFIG
2. Obtain cluster id
3. Create a service account:

ccloud service-account create CP-and-CC-Linking --description "Created for the Cluster Linking Hybrid Cloud tutorial"

4. Create confluent cloud acls:
ccloud kafka acl create --allow --service-account <svc account id> --operation read --operation write --topic '*' --cluster <confluent cloud cluster id> 

5. Create an API key for the link:
ccloud api-key create --resource <confluent cloud cluster id> --service-account <service account> 

6. edit 

$CONFLUENT_CONFIG/clusterlink-hybrid-dst.config with the following entries:

link.mode=DESTINATION
connection.mode=INBOUND

7. Create the cluster link as a source initiated link:
ccloud kafka link create from-on-prem-link --cluster <CC-cluster-id> \
  --source-cluster-id <CP-cluster-id> \
  --config-file $CONFLUENT_CONFIG/clusterlink-hybrid-dst.config \
  --source-bootstrap-server 0.0.0.0

8. Specify the link with Confluent Platform:
kafka-cluster-links --bootstrap-server <CP-Bootstrap-Server> \
      --create --link from-on-prem-link \
      --config-file $CONFLUENT_CONFIG/clusterlink-CP-src.config \
      --cluster-id <CC-cluster-id>

9. Create a kafka topic
10. Mirror the topic:
ccloud kafka mirror create <TOPIC-NAME> --link from-on-prem-link
11. Produce using kafka perf tool and payload file, observe replication
   on local cluster and confluent cloud cluster
