#!/bin/bash
./../breakage_log_line.sh "scenario1-PROD standard" "Blackhole traffic to cart checkout. This is for standard gke cluster."

# 1. Clone or Update the Repository
REPO_DIR="microservices-demo"

if [ -d "$REPO_DIR" ]; then
    echo "Directory $REPO_DIR exists. Pulling latest changes..."
    cd "$REPO_DIR"
    git pull origin main
    cd ..
else
    echo "Cloning the Online Boutique repository..."
    git clone https://github.com/GoogleCloudPlatform/microservices-demo.git
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
