# Currently this repo is PRIVATE. Will be OSS'ed soon.

## Breakage Scenarios and Fixes

All scenarios are organized into their own dedicated directories containing `break.sh`, `fix.sh`, and `test.sh` scripts for modularity and isolation of manifests.

---

### Scenario 1: Blackhole traffic to cart checkout

**Introducing the Failure:**
To simulate a network communication failure between the frontend and the checkout service, run the command (or use `just break1`):

```bash
cd breakage1-checkout && ./break.sh
```

**Observation:**
Test the cart checkout process in the browser. You should receive a `500 Internal Server Error` during the checkout phase because traffic is being dropped by a network policy.

**Fixing the Failure:**
Execute the command below to delete the restrictive network policy and restore traffic flow (or use `just fix1`):

```bash
cd breakage1-checkout && ./fix.sh
```

**Testing the Status:**
Verify if the scenario is running or cleared (or use `just test1`):

```bash
cd breakage1-checkout && ./test.sh
```

---

### Scenario 2: Buggy Frontend Canary Rollout

**Introducing the Failure:**
To simulate a failed deployment or a buggy update, execute the following script to roll out a canary version of the frontend (or use `just break2`):

```bash
cd breakage2-canary && ./break.sh
```

**Observation:**
The Online Boutique homepage will fail to load intermittently. This happens because traffic is being load-balanced between the stable pods and the new frontend-canary pod containing the bug.

**Fixing the Failure:**
Remove the buggy canary deployment to ensure all traffic is routed back to the stable version (or use `just fix2`):

```bash
cd breakage2-canary && ./fix.sh
```

**Testing the Status:**
Verify if the canary is running or cleared (or use `just test2`):

```bash
cd breakage2-canary && ./test.sh
```

---

### Scenario 3: Blackhole traffic to entire GKE cluster at network level

**Introducing the Failure:**
To simulate an infrastructure-level block, execute the following script (or use `just break3`):

```bash
cd breakage3-firewall && ./break.sh
```

**Observation:**
The Online Boutique homepage will timeout loading, as all ingress traffic to the GKE cluster is completely blocked by a VPC firewall rule.

**Fixing the Failure:**
Remove the blocking VPC firewall rule (or use `just fix3`):

```bash
cd breakage3-firewall && ./fix.sh
```

**Testing the Status:**
Verify if the firewall rule is applied or deleted (or use `just test3`):

```bash
cd breakage3-firewall && ./test.sh
```
