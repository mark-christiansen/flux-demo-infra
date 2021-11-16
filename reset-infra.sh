#!/bin/bash

echo "deleting source and kustomizations from flux-demo-infra"
rm clusters/my-cluster/*.yaml

echo "commiting changes to flux-demo-infra repo"
git add . && git commit -m "cleaning out infra" && git push

