#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
"$SCRIPT_DIR/../breakage_log_line.sh" "scenario1-PROD standard" "Blackhole traffic to cart checkout. This is for standard gke cluster."

 
# 2. Create the "Black Hole" NetworkPolicy
echo "📝 Creating the NetworkPolicy manifest..."
cat <<EOF > networkpolicy.yaml
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: update-checkout-from-frontend
  namespace: default
spec:
  podSelector:
    matchLabels:
      app: checkoutservice
  policyTypes:
  - Ingress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          # This label does not exist on the frontend, causing a "Default Deny"
          app: frontend-checkout-test 
EOF

# 3. Apply the breakage
echo " Applying the breakage: Isolating checkoutservice..."
kubectl apply -f networkpolicy.yaml
kubectl delete pod -l app=frontend --wait=false
