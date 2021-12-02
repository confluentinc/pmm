echo SERVICE ACCOUNT CREATION
echo this service account is going to manage the cluster link

confluent iam service-account create cluster-link --description "Linked cluster service account"
confluent iam service-account create cli --description "cli service account"

confluent iam service-account list
