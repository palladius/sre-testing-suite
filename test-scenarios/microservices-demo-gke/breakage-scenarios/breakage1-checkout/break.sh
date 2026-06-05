#!/bin/bash
./../breakage_log_line.sh "scenario1-PROD standard" "Blackhole traffic to cart checkout. This is for standard gke cluster."

# 1. Ensure the Online Boutique Repository is Cloned in the consistent parent directory
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
PARENT_REPO_DIR="$SCRIPT_DIR/../../microservices-demo"
if [ ! -d "$PARENT_REPO_DIR" ]; then
    echo "Cloning the Online Boutique repository via root justfile..."
    (cd "$SCRIPT_DIR/../.." && just clone-repo)
fi

 
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
