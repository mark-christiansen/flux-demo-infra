#!/bin/bash

echo "deleting source and kustomizations from flux-demo-infra"
rm clusters/my-cluster/*.yaml

echo "commiting changes to flux-demo-infra repo"
git add . && git commit -m "cleaning out infra" && git push

NS="default"
DEPLOYD=("ccloud-operator" "flux-demo-producer")

echo "removing pods and deployments"
for DEPLOY in ${DEPLOYS[@]}; do
  kubectl -n $NS delete deployment $DEPLOY
done
