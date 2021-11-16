#!/bin/bash

NS="default"
kubectl config set-context --current --namespace $NS

echo ""
echo "% kubectl get secret"
echo ""
kubectl get secret
echo ""

echo "% kubectl get configmap"
echo ""
kubectl get configmap
echo ""

echo "% kubectl get deployment"
echo ""
kubectl get deployment
echo ""
