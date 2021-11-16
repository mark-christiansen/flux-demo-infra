#!/bin/bash

ACCOUNT_NAME="flux-demo-producer"
ACCOUNT_ID=$(ccloud service-account list | grep "$ACCOUNT_NAME" | grep -Eo '[0-9]{6}')

# clear service account
echo "deleting service account $ACCOUNT_ID"
ccloud service-account delete $ACCOUNT_ID

# clear api-keys for service account
#API_KEY=$(ccloud api-key list | grep "$ACCOUNT_ID" | grep -Eo '[A-Z0-9]{16}')
#echo "deleting api-key $API_KEY"
#ccloud api-key delete $API_KEY

TOPICS=("source-topic-0" "source-topic-1" "source-topic-2")
# clear acls and topics
for TOPIC in ${TOPICS[@]}; do
  echo "deleting topic $STOPIC"
  #ccloud kafka acl delete --topic $TOPIC --operation CREATE --allow --service-account $ACCOUNT_ID
  #ccloud kafka acl delete --topic $TOPIC --operation READ --allow --service-account $ACCOUNT_ID
  #ccloud kafka acl delete --topic $TOPIC --operation WRITE --allow --service-account $ACCOUNT_ID
  ccloud kafka topic delete $TOPIC
done

echo "Finished reseting ccloud"
