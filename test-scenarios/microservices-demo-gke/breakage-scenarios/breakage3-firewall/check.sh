#!/bin/bash
echo "🔍 Checking Scenario 3 once..."
PROJECT_ID="${GOOGLE_CLOUD_PROJECT:-$(gcloud config get-value project 2>/dev/null)}"
RULE_NAME="frontend-ingress-v2"

if gcloud compute firewall-rules describe "$RULE_NAME" --project="$PROJECT_ID" --quiet &>/dev/null; then
  echo "🔴 [scenario3] BLOCKED: Firewall rule is blocking all cluster ingress!"
else
  echo "🟢 [scenario3] HEALTHY: Ingress firewall rule is removed."
fi
exit 0
