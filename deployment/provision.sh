#!/usr/bin/env bash

here=$(dirname ${BASH_SOURCE[0]})

kubectl apply -f ${here}/bitbites-fe.deployment.yaml
kubectl apply -f ${here}/bitbites-api.deployment.yaml
kubectl apply -f ${here}/bites-auth-api.deployment.yaml