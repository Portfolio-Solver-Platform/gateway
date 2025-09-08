#!/bin/sh

SERVICE="gateway-nginx"

# Try to get the external IP
EXTERNAL_IP=$(kubectl get svc "$SERVICE" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

if [ -z "$EXTERNAL_IP" ]; then
  echo "❌ No external IP found for $SERVICE."
  echo "👉 Starting minikube tunnel (requires sudo)..."

  # Start minikube tunnel in the background
  minikube tunnel >/dev/null 2>&1 &
  sleep 1s

  echo "⏳ Waiting for external IP..."
  while true; do
    EXTERNAL_IP=$(kubectl get svc "$SERVICE" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
    if [ -n "$EXTERNAL_IP" ]; then
      echo "✅ External IP for $SERVICE: $EXTERNAL_IP"
      break
    fi
    sleep 2
  done
else
  echo "✅ External IP for $SERVICE: $EXTERNAL_IP"
fi
