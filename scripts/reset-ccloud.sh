#!/bin/bash

ACCOUNT_NAME="flux-demo-producer"
ACCOUNT_ID=$(ccloud service-account list | grep "$ACCOUNT_NAME" | grep -Eo '[0-9]{6}')

#clear api-key for ccloud operator
echo "deleting api-key for ccloud operator"
API_KEY=$(ccloud api-key list | grep "cc.api-key.cloud" | grep -Eo '[A-Z0-9]{16}')
ccloud api-key delete $API_KEY

# clear service account
echo "deleting service account $ACCOUNT_ID"
ccloud service-account delete $ACCOUNT_ID

TOPICS=("source-topic-0" "source-topic-1" "source-topic-2")
# clear acls and topics
for TOPIC in ${TOPICS[@]}; do
  echo "deleting topic $STOPIC"
  ccloud kafka acl delete --topic $TOPIC --operation WRITE --allow --service-account $ACCOUNT_ID
  ccloud kafka topic delete $TOPIC
done

echo "Finished reseting ccloud"
