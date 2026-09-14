#!/bin/bash
echo "🔧 Fixing scenario 3: Removing blocking firewall rule..."
PROJECT_ID="${GOOGLE_CLOUD_PROJECT:-$(gcloud config get-value project 2>/dev/null)}"
RULE_NAME="frontend-ingress-v2"
gcloud compute firewall-rules delete "$RULE_NAME" --project="$PROJECT_ID" --quiet
