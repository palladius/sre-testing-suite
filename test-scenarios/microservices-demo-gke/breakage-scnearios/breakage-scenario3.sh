#!/bin/bash
./breakage_log_line.sh "Firewall update to block the traffic to gke cluster"

# 1. Configuration
PROJECT_ID=$(gcloud config get-value project)
RULE_NAME="frontend-ingress-v2"
PORT_LIST="tcp:80,tcp:443,tcp:8080"

echo "🔍 Detecting active VPC networks in project: $PROJECT_ID..."

# 2. Automatically find the first available network to avoid 'default' error
NETWORK_NAME=$(gcloud compute networks list --format="value(name)" | head -n 1)

if [ -z "$NETWORK_NAME" ]; then
    echo "Error: No VPC networks found in this project."
    exit 1
fi

./breakage_log_line.sh "scenario3" "Deny all frontend ingress via VPC firewall" "VPC: $NETWORK_NAME"

echo "Applying updated firewall rules to network: $NETWORK_NAME"

# 3. Create the DENY rule
# Priority 1 ensures it overrides all other 'Allow' rules
gcloud compute firewall-rules create "$RULE_NAME" \
    --project="$PROJECT_ID" \
    --network="$NETWORK_NAME" \
    --action=DENY \
    --rules="$PORT_LIST" \
    --direction=INGRESS \
    --priority=1 \
    --source-ranges=0.0.0.0/0 \
    --description="Infrastructure-level updates for frontend ingress"

echo "--------------------------------------------------------"
echo "Firewall Rule Created: $RULE_NAME"
echo "--------------------------------------------------------"
