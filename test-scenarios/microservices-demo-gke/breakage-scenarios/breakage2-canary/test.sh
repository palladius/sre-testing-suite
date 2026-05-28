#!/bin/bash
echo "🔍 Continually pinging Scenario 2 status (Ctrl+C to stop)..."

while true; do
  CANARY_EXISTS=$(kubectl get deployment frontend-canary -n default --ignore-not-found)
  if [ -n "$CANARY_EXISTS" ]; then
    BUGGY_VAL=$(kubectl get deployment frontend-canary -n default -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="PRODUCT_CATALOG_SERVICE_ADDR")].value}' 2>/dev/null)
    if [ "$BUGGY_VAL" = "productcatalogservices:3550" ]; then
      echo "$(date '+%H:%M:%S') 🔴 [scenario2] DEPLOYED: Buggy frontend canary rollout is active!"
    else
      echo "$(date '+%H:%M:%S') 🟢 [scenario2] HEALTHY: Canary is active and running on a corrected release."
    fi
  else
    echo "$(date '+%H:%M:%S') 🟢 [scenario2] HEALTHY: Canary removed, running on stable release."
  fi
  sleep 1.5
done
