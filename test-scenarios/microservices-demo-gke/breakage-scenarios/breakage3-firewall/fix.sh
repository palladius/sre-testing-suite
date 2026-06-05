#!/bin/bash
echo "🔧 Fixing scenario 3: Removing blocking firewall rule..."
RULE_NAME="frontend-ingress-v2"
gcloud compute firewall-rules delete "$RULE_NAME" --quiet
