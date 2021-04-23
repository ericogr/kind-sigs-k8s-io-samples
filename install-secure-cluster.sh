#!/bin/bash
CLUSTER_NAME=secure-cluster
CONFIG_FILE=security/cluster-config.yaml

echo create cluster $CLUSTER_NAME
kind create cluster --name $CLUSTER_NAME --config $CONFIG_FILE

kubectl apply -f security/namespace-origin.yaml
kubectl apply -f security/namespace-destiny.yaml

kubectl apply -f security/pod-security-policy.yaml
kubectl apply -f security/cluster-role-privileged-psp.yaml
kubectl apply -f security/role-binding-psp.yaml

kubectl apply -f https://docs.projectcalico.org/manifests/tigera-operator.yaml
kubectl apply -f https://docs.projectcalico.org/manifests/custom-resources.yaml

kubectl apply -f security/network-policy-destiny.yaml
