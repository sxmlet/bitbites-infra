#!/usr/bin/env bash

here=$(dirname ${BASH_SOURCE[0]})

kubectl delete -f ${here}/bitbites-fe.deployment.yaml
kubectl delete -f ${here}/bitbites-api.deployment.yaml
kubectl delete -f ${here}/bites-auth-api.deployment.yaml
