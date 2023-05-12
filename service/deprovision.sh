#!/usr/bin/env bash

here=$(dirname ${BASH_SOURCE[0]})

kubectl delete -f ${here}/bitbites-fe.service.yaml
kubectl delete -f ${here}/bitbites-api.service.yaml
kubectl delete -f ${here}/bites-auth-api.service.yaml

kubectl delete service bitbites-fe-public
kubectl delete service bitbites-auth-public