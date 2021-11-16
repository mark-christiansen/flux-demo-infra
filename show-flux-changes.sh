#!/bin/bash

NS="flux-system"
kubectl config set-context --current --namespace $NS

echo ""
echo "% kubectl api-resources | grep toolkit.fluxcd.io/v1beta1"
echo ""
kubectl api-resources | grep toolkit.fluxcd.io
echo ""

echo "% kubectl get gitrepo"
echo ""
kubectl get gitrepo
echo ""

echo "% kubectl get kustomizations"
echo ""
kubectl get kustomizations
echo ""
