#!/bin/bash

echo "deleting source and kustomizations from flux-demo-infra"
rm clusters/my-cluster/*.yaml

echo "commiting changes to flux-demo-infra repo"
git add . && git commit -m "cleaning out infra" && git push

NS="default"

DEPLOYS=("ccloud-operator" "flux-demo-producer")
echo "removing pods and deployments"
for DEPLOY in ${DEPLOYS[@]}; do
  kubectl -n $NS delete deployment $DEPLOY
done

CONFIGS=("cc.env.default" "cc.env.default.kafka.devops-demo")
echo "removing configmaps"
for CONFIG in ${CONFIGS[@]}; do
  kubectl -n $NS delete configmap $CONFIG
done

SECRETS=("cc.api-key.cloud" "cc.api-key.flux-demo-producer.lkc-1pgrz" "cc.bootstrap-servers.default.devops-demo" "cc.sasl-jaas-config.flux-demo-producer.default.devops-demo " "cc.schema-registry-url.default")
echo "removing secrets"
for SECRET in ${SECRETS[@]}; do
  kubectl -n $NS delete secret $SECRET
done

echo "finished reseting infra"
