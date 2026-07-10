#!/bin/bash
echo "🔍 Checking Scenario 2 once..."

CANARY_EXISTS=$(kubectl get deployment frontend-canary -n default --ignore-not-found)
if [ -n "$CANARY_EXISTS" ]; then
  # Check if the deployment is buggy
  BUGGY_VAL=$(kubectl get deployment frontend-canary -n default -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="PRODUCT_CATALOG_SERVICE_ADDR")].value}' 2>/dev/null)
  if [ "$BUGGY_VAL" != "productcatalogservice:3550" ]; then
    echo "🔴 [scenario2] DEPLOYED: Buggy frontend canary rollout is active!"
  else
    echo "🟢 [scenario2] HEALTHY: Canary is active and running on a corrected release."
  fi
else
  echo "🟢 [scenario2] HEALTHY: Canary removed, running on stable release."
fi
exit 0
