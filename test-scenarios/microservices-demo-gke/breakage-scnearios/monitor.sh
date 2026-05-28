#!/bin/bash

# ANSI Color Codes
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
WHITE="\033[1;37m"
RESET="\033[0m"

PROJECT_ID=$(gcloud config get-value project 2>/dev/null)
CLUSTER_NAME=$(kubectl config view --minify -o jsonpath='{.contexts[0].context.cluster}' 2>/dev/null | cut -d'_' -f4)
CLUSTER_NAME=${CLUSTER_NAME:-"online-boutique-prod"}
TARGET_IP=$(kubectl get service frontend-external -o jsonpath='{.status.loadBalancer.ingress[0].ip}' 2>/dev/null)
TARGET_IP=${TARGET_IP:-"34.55.56.97"}

echo -e "${WHITE}================================================${RESET}"
echo -e "${CYAN}   🚨 GKE Brokenness Scenario Monitor 🚨${RESET}"
echo -e " ${WHITE}Project ID:${RESET}    ${YELLOW}${PROJECT_ID}${RESET}"
echo -e " ${WHITE}Cluster Name:${RESET}  ${YELLOW}${CLUSTER_NAME}${RESET}"
echo -e " ${WHITE}Target IP:${RESET}     ${YELLOW}${TARGET_IP}${RESET}"
echo -e " ${WHITE}Timestamp:${RESET}     ${CYAN}$(date '+%Y-%m-%d %H:%M:%S')${RESET}"
if [ -d "../microservices-demo" ]; then
    echo -e " ${WHITE}Code Repo:${RESET}     📁 ${YELLOW}Downloaded Online Boutique under test-scenarios/microservices-demo-gke/microservices-demo/${RESET}"
else
    echo -e " ${WHITE}Code Repo:${RESET}     ⚠️  ${YELLOW}Missing local Online Boutique checkout (Run 'just clone-repo' to download)${RESET}"
fi

echo -e "${WHITE}================================================${RESET}"

# Execute the 3 checks and filter just the colored status lines
if [ -f "breakage1-checkout/check.sh" ]; then
  bash breakage1-checkout/check.sh | grep -E "🟢|🔴"
fi

if [ -f "breakage2-canary/check.sh" ]; then
  bash breakage2-canary/check.sh | grep -E "🟢|🔴"
fi

if [ -f "breakage3-firewall/check.sh" ]; then
  bash breakage3-firewall/check.sh | grep -E "🟢|🔴"
fi


echo -e "${WHITE}================================================${RESET}"
