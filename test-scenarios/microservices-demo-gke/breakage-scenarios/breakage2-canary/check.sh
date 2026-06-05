#!/bin/bash
echo "🔍 Checking Scenario 2 once..."

CANARY_EXISTS=$(kubectl get deployment frontend-canary -n default --ignore-not-found)
if [ -n "$CANARY_EXISTS" ]; then
  echo "🔴 [scenario2] DEPLOYED: Buggy frontend canary rollout is active!"
else
  echo "🟢 [scenario2] HEALTHY: Canary removed, running on stable release."
fi
exit 0
