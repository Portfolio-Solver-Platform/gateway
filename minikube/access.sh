#!/bin/sh

SERVICE="gateway-nginx"

# Try to get the external IP
EXTERNAL_IP=$(kubectl get svc "$SERVICE" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

if [ -z "$EXTERNAL_IP" ]; then
  echo "⏳ Waiting for external IP..."
  while true; do
    EXTERNAL_IP=$(kubectl get svc "$SERVICE" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
    if [ -n "$EXTERNAL_IP" ]; then
      echo "✅ External IP for gateway: $EXTERNAL_IP"
      break
    fi
    sleep 2
  done
else
  echo "✅ External IP for gateway: $EXTERNAL_IP"
fi
