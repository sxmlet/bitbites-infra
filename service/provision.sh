#!/usr/bin/env bash

here=$(dirname ${BASH_SOURCE[0]})

kubectl apply -f ${here}/bitbites-fe.service.yaml
kubectl apply -f ${here}/bitbites-api.service.yaml
kubectl apply -f ${here}/bites-auth-api.service.yaml

kubectl expose --type LoadBalancer deployment bitbites-fe --name bitbites-fe-public
kubectl expose --type LoadBalancer deployment bite-auth-api --name bitbites-auth-public
