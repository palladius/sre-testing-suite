#!/bin/bash
echo "🔍 Checking Scenario 3 once..."
RULE_NAME="frontend-ingress-v2"

if gcloud compute firewall-rules describe "$RULE_NAME" --quiet &>/dev/null; then
  echo "🔴 [scenario3] BLOCKED: Firewall rule is blocking all cluster ingress!"
else
  echo "🟢 [scenario3] HEALTHY: Ingress firewall rule is removed."
fi
exit 0
