## Pre-requisites for testing these breakage scenarios
### Deploy online-boutique application in the gcp project
**Introducing the Failure:**
To simulate the breakage scenarios, it is expected to have the online-boutique application running in a gke cluster ( autopilot or standard). Refer to the instructions https://github.com/GoogleCloudPlatform/microservices-demo repository for deploying the online-boutique application

**Set the Google Cloud project**
Ensure you have the following requirements:

    Google Cloud project.
    Shell environment with gcloud, git, and kubectl.

## Breakage Scenarios and Fixes

### Scenario 1: Buggy Frontend Canary Rollout
**Introducing the Failure:**
To simulate a failed deployment or a buggy update, execute the following script to roll out a canary version of the frontend (or use `make break2` or `just break2`):

```bash
./breakage-scenario1.sh
```

**Observation:**
The Online Boutique homepage will fail to load intermittently. This happens because traffic is being load-balanced between the stable pods and the new frontend-canary pod containing the bug.

**Fixing the Failure:**
Remove the buggy canary deployment to ensure all traffic is routed back to the stable version (or use `make fix2` or `just fix2`):

```bash
kubectl delete deployment frontend-canary
```

### Scenario 2: Blackhole traffic to cart checkout
**Introducing the Failure:**
To simulate a network communication failure between the frontend and the checkout service, run the following command (or use `make break1` or `just break1`):

```bash
./breakage-scenario2.sh
```

**Observation:**
Test the cart checkout process in the browser. You should receive a `500 Internal Server Error` during the checkout phase because traffic is being dropped by a network policy.

**Fixing the Failure:**
Execute the command below to delete the restrictive network policy and restore traffic flow (or use `make fix1` or `just fix1`):

```bash
kubectl delete networkpolicy update-checkout-from-frontend
```
This will take few mins for the change to be effective

### Scenario 3: Blackhole traffic to entire GKE cluster at network level
**Introducing the Failure:**
To simulate a failed deployment, execute the following script  (or use `make break3` or `just break3`):

```bash
./breakage-scenario3.sh
```

**Observation:**
The Online Boutique homepage will timeout loading the page, as the traffic for gke cluster is completely blocked

**Fixing the Failure:**
Remove the firewall rule applied to block traffic to GKE

```bash
gcloud compute firewall-rules delete "$RULE_NAME" --quiet
```
