#!/bin/bash

. ../util.sh

repo=jpalma
image=${repo}/osslisbon

run "clear"

desc "Build a simple NodeJS Container"
run "cat index.js"

run "cat Dockerfile"

run "docker build -t ${image} ."

run "docker push ${image}"

desc "Deploy it to Azure Container Instances"

run "az group create -n jpalmaaci -l westeurope"

run "az container create --image=${image} -g jpalmaaci --ip-address=public -n osslisbon > /dev/null && az container list -o table"

ip=$(az container show -g jpalmaaci -n osslisbon | jq .ipAddress.ip)
while [[ "${ip}" == "null" ]]; do
  ip=$(az container show -g jpalmaaci -n osslisbon | jq .ipAddress.ip)
  echo "waiting for ip..."
  sleep 1
done

temp="${ip%\"}"
temp="${temp#\"}"
ip=${temp}

while ! curl -s --connect-timeout 1 ${ip} > /dev/null; do
  echo "waiting for container..."
  sleep 1
done

desc "Server is running at http://${ip}"

run "curl ${ip}"

run "az group delete -n jpalmaaci --yes --no-wait > /dev/null"

