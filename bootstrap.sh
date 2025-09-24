#!/usr/bin/env bash
kubectl kustomize "https://github.com/nginx/nginx-gateway-fabric/config/crd/gateway-api/standard?ref=v2.1.1" | kubectl apply -f -
