#!/bin/bash
echo "🔍 Continually pinging Scenario 2 status (Ctrl+C to stop)..."

while true; do
  CANARY_EXISTS=$(kubectl get deployment frontend-canary -n default --ignore-not-found)
  if [ -n "$CANARY_EXISTS" ]; then
    echo "$(date '+%H:%M:%S') 🔴 [scenario2] DEPLOYED: Buggy frontend canary rollout is active!"
  else
    echo "$(date '+%H:%M:%S') 🟢 [scenario2] HEALTHY: Canary removed, running on stable release."
  fi
  sleep 1.5
done
