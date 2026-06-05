#!/bin/bash
echo "🔍 Continually pinging Scenario 1 status (Ctrl+C to stop)..."

while true; do
  if kubectl get networkpolicy update-checkout-from-frontend &>/dev/null; then
    echo "$(date '+%H:%M:%S') 🔴 [scenario1] BLOCKED: NetworkPolicy is blocking checkout traffic!"
  else
    echo "$(date '+%H:%M:%S') 🟢 [scenario1] HEALTHY: Checkout traffic is flowing normally."
  fi
  sleep 1.5
done
