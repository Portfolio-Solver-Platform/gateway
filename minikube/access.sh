#!/usr/bin/env bash

SERVICE="gateway-istio"
NAMESPACE="gateway"

# Try to get the external IP
EXTERNAL_IP=$(kubectl get -n "$NAMESPACE" svc "$SERVICE" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

if [ -z "$EXTERNAL_IP" ]; then
  echo "❌ External IP not available for gateway service ($SERVICE)"
else
  echo "External IP for gateway: $EXTERNAL_IP"
  echo
  echo "Make sure the following line is in your /etc/hosts file:"
  echo "$EXTERNAL_IP local keycloak.local grafana.local secrets.local"
  echo
  echo "✅ Access: http://local/"
fi
