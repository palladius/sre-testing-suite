#!/bin/bash
echo "🔍 Checking Scenario 1 once (via simulated checkout request)..."

# Resolve target endpoint
TARGET_IP=$(kubectl get service frontend-external -o jsonpath='{.status.loadBalancer.ingress[0].ip}' 2>/dev/null)
TARGET_IP=${TARGET_IP:-"127.0.0.1:8080"}

COOKIE_FILE=$(mktemp)
# 1. Initialize session
curl -c "$COOKIE_FILE" -s "http://${TARGET_IP}/" > /dev/null
# 2. Add product to cart (following redirects)
curl -b "$COOKIE_FILE" -c "$COOKIE_FILE" -L -d "product_id=OLJCESPC7Z&quantity=1" -s "http://${TARGET_IP}/cart" > /dev/null
# 3. Attempt Checkout
HTTP_CODE=$(curl -b "$COOKIE_FILE" -c "$COOKIE_FILE" \
  -d "email=test@example.com&street_address=123+Main+St&zip_code=12345&city=Berlin&state=Germany&country=Germany&credit_card_number=4111948167629615&credit_card_expiration_month=12&credit_card_expiration_year=2030&credit_card_cvv=123" \
  -s -o /dev/null -w "%{http_code}" "http://${TARGET_IP}/cart/checkout")
rm -f "$COOKIE_FILE"

if [ "$HTTP_CODE" = "200" ]; then
  echo "🟢 [scenario1] HEALTHY: Checkout traffic is flowing normally."
  exit 0
else
  echo "🔴 [scenario1] BLOCKED: NetworkPolicy is blocking checkout traffic! (HTTP $HTTP_CODE)"
  exit 1
fi
