#!/bin/bash
echo "🔧 Fixing scenario 1: Restoring checkout traffic (deleting NetworkPolicy)..."
kubectl delete networkpolicy update-checkout-from-frontend
