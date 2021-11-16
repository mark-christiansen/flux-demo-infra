#!/bin/bash

NS="confluent"
kubectl config set-context --current --namespace $NS

echo ""
echo "% kubectl api-resources | grep platform.confluent.io"
echo ""
kubectl api-resources | grep platform.confluent.io
echo ""

echo ""
echo "% kubectl get confluentrolebindings"
echo ""
kubectl get confluentrolebindings
echo ""

echo ""
echo "% kubectl get confluentrolebindings internal-schemaregistry-1 -o yaml"
echo ""
kubectl get confluentrolebindings internal-schemaregistry-1 -o yaml
echo ""

echo ""
echo "% kubectl get kafkatopics"
echo ""
kubectl get kafkatopics
echo ""

echo ""
echo "% kubectl get kafkatopics my-topic -o yaml"
echo ""
kubectl get kafkatopics my-topic -o yaml
echo ""

echo ""
echo "% kubectl get secret"
echo ""
kubectl get secret
echo ""

echo "% kubectl get configmap"
echo ""
kubectl get configmap
echo ""

echo "% kubectl get statefulset"
echo ""
kubectl get statefulset
echo ""
