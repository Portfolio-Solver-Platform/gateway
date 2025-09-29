#!/usr/bin/env bash

SERVICE="gateway-nginx"

# Try to get the external IP
EXTERNAL_IP=$(kubectl get svc "$SERVICE" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

if [ -z "$EXTERNAL_IP" ]; then
  echo "❌ External IP not available for gateway service ($SERVICE)"
else
  echo "External IP for gateway: $EXTERNAL_IP"
  echo
  echo "Make sure the following line is in your /etc/hosts file:"
  echo "$EXTERNAL_IP local harbor.local keycloak.local grafana.local prometheus.local"
  echo
  echo "✅ Access: http://local/"
fi
