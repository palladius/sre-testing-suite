# GKE Microservices Demo - SRE Testing Scenarios

This directory contains test scenarios designed to validate the **`sre-gemini-cli-extension`** using the [Google Cloud Microservices Online Boutique](https://github.com/GoogleCloudPlatform/microservices-demo) application deployed on Google Kubernetes Engine (GKE).

---

## Pre-requisites

### 1. Deploy the Online Boutique Application
Before running any of the breakage scenarios, you must have a running instance of the Online Boutique application inside a GKE cluster (either Autopilot or Standard). 
Please follow the deployment instructions in the official [Microservices Demo Repository](https://github.com/GoogleCloudPlatform/microservices-demo).

### 2. Environment Tools
Ensure you have the following requirements met in your shell environment:
- Active **Google Cloud project**.
- Auth configured for `gcloud` and `kubectl`.
- Local installation of `git`, `kubectl`, and [just](https://github.com/casey/just) command runner (recommended).

---

## Breakage Scenarios

All breakage scenarios are organized into their own dedicated directories within [breakage-scnearios](./breakage-scnearios/) containing modular `break.sh`, `fix.sh`, `check.sh`, and `test.sh` scripts.

To run these scenarios, navigate to the `breakage-scnearios/` directory:
```bash
cd breakage-scnearios
```

### Scenario 1: Blackhole traffic to cart checkout
* Simulates a network communication failure between the `frontend` and `checkout` service using a restrictive Kubernetes Network Policy.

* **Introducing the Failure:**
  ```bash
  just break1
  # Or: cd breakage1-checkout && ./break.sh
  ```
* **Observation:** The checkout process will fail with a `500 Internal Server Error` in the browser.
* **Fixing the Failure:**
  ```bash
  just fix1
  # Or: cd breakage1-checkout && ./fix.sh
  ```

---

### Scenario 2: Buggy Frontend Canary Rollout
* Simulates a failed canary rollout or a buggy update of the `frontend` service.

* **Introducing the Failure:**
  ```bash
  just break2
  # Or: cd breakage2-canary && ./break.sh
  ```
* **Observation:** The homepage will intermittently fail to load as traffic is load-balanced between stable pods and the buggy canary pod.
* **Fixing the Failure:**
  ```bash
  just fix2
  # Or: cd breakage2-canary && ./fix.sh
  ```

---

### Scenario 3: Blackhole traffic to entire GKE cluster at network level
* Simulates an infrastructure-level network outage by blocking ingress traffic using a VPC firewall rule.

* **Introducing the Failure:**
  ```bash
  just break3
  # Or: cd breakage3-firewall && ./break.sh
  ```
* **Observation:** The Online Boutique homepage will completely timeout when attempting to load.
* **Fixing the Failure:**
  ```bash
  just fix3
  # Or: cd breakage3-firewall && ./fix.sh
  ```

---

## Real-Time Monitoring

You can run the GKE status monitor dashboard to view the live status of all scenarios:

```bash
# Run monitor once
just monitor-once

# Start live dashboard (runs under watch)
just monitor
```

---

## Next Steps: Testing the SRE Extension

Once a breakage scenario is active, you can use the investigation prompts to evaluate how the SRE Gemini extension helps detect, troubleshoot, and fix the issues.

👉 See [Investigation Prompts Guide](./investigation-prompts/README.md) for full instructions and prompt templates.

