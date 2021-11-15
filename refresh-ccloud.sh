#!/bin/bash
ACCOUNT=$1

# clear service account
ccloud service-account delete $ACCOUNT

# clear topics
ccloud kafka topic delete source-topic-0
ccloud kafka topic delete source-topic-1
ccloud kafka topic delete source-topic-2

# clear ACLs
ccloud kafka acl delete --topic source-topic-0 --operation CREATE --allow --service-account $ACCOUNT
ccloud kafka acl delete --topic source-topic-0 --operation READ --allow --service-account $ACCOUNT
ccloud kafka acl delete --topic source-topic-0 --operation WRITE --allow --service-account $ACCOUNT
ccloud kafka acl delete --topic source-topic-1 --operation CREATE --allow --service-account $ACCOUNT
ccloud kafka acl delete --topic source-topic-1 --operation READ --allow --service-account $ACCOUNT
ccloud kafka acl delete --topic source-topic-1 --operation WRITE --allow --service-account $ACCOUNT
ccloud kafka acl delete --topic source-topic-2 --operation CREATE --allow --service-account $ACCOUNT
ccloud kafka acl delete --topic source-topic-2 --operation READ --allow --service-account $ACCOUNT
ccloud kafka acl delete --topic source-topic-2 --operation WRITE --allow --service-account $ACCOUNT
