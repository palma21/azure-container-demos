#!/bin/bash

. ../util.sh

RESOURCE_GROUP="k8s-jpalma-demo1"
NAME="demo1"

run "clear"

run "az group create --name=${RESOURCE_GROUP} --location=westeurope"

run "az acs create --name=${NAME} --resource-group=${RESOURCE_GROUP} --orchestrator-type=kubernetes"

# run "az acs kubernetes get-credentials --name=${NAME} --resource-group=${RESOURCE_GROUP}"

# run "kubectl get nodes"

run "az group delete -n k8s-jpalma-demo1 --yes --no-wait > /dev/null"
