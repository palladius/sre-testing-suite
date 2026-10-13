#!/bin/bash
echo "🔧 Fixing scenario 2: Removing buggy canary deployment..."
kubectl delete deployment frontend-canary
