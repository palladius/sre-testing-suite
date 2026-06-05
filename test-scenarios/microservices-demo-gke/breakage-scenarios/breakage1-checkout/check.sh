#!/bin/bash
echo "🔍 Checking Scenario 1 once..."

if kubectl get networkpolicy update-checkout-from-frontend &>/dev/null; then
  echo "🔴 [scenario1] BLOCKED: NetworkPolicy is blocking checkout traffic!"
else
  echo "🟢 [scenario1] HEALTHY: Checkout traffic is flowing normally."
fi
exit 0
