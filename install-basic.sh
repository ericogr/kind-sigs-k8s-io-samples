#!/bin/bash
CLUSTER_NAME=basic
CONFIG_FILE=basic/cluster-config.yaml

echo create cluster $CLUSTER_NAME
kind create cluster --name $CLUSTER_NAME --config $CONFIG_FILE
