#!/bin/bash

NAME=flux-demo-producer
REPO=https://github.com/mark-christiansen/$NAME
POD=flux-demo-producer
NS=default

flux create source git $POD --url=$REPO --branch=main --interval=30s \
  --export > ./clusters/my-cluster/$NAME-source.yaml

flux create kustomization $POD --target-namespace=$NS --source=$POD \
  --path="./kustomize" --prune=true --interval=5m \
  --export > ./clusters/my-cluster/$NAME-kustomization.yaml

git add . && git commit -m "bootstrap $NAME" && git push
