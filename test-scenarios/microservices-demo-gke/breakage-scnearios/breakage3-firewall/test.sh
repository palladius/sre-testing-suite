#!/bin/bash
echo "🔍 Continually pinging Scenario 3 status (Ctrl+C to stop)..."
RULE_NAME="frontend-ingress-v2"

while true; do
  if gcloud compute firewall-rules describe "$RULE_NAME" --quiet &>/dev/null; then
    echo "$(date '+%H:%M:%S') 🔴 [scenario3] BLOCKED: Firewall rule is blocking all cluster ingress!"
  else
    echo "$(date '+%H:%M:%S') 🟢 [scenario3] HEALTHY: Ingress firewall rule is removed."
  fi
  sleep 1.5
done
