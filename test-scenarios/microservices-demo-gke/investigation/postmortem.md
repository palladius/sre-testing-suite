<!-- substitute this with the real postmortem -->
# 📝 Blameless SRE Incident Postmortem (Template)

> ** Instructions for Student / AI Agent:**
> This file is a starter template inside the `investigation/` War Room.
> After you finish investigating and mitigating the GKE outage, ask your AI agent to use the **`postmortem-generator`** and **`monitoring-graphs`** skills to overwrite this file (`postmortem.md`) with the real data-driven Postmortem and remove the `<!-- substitute this with the real postmortem -->` comment at the top!

---

## 1. Executive Summary
- **Incident Title:** `[TODO: e.g., Online Boutique Checkout / Frontend Service Outage]`
- **Date:** `[TODO: YYYY-MM-DD]`
- **Authors:** `[TODO: user@ (On-Call SRE), sre-agent@ (AI Co-Pilot)]`
- **Status:** `Draft (Template — Not Started)`
- **Severity:** `[TODO: SEV-1 / SEV-2]`
- **Summary:** `[TODO: 2–3 sentences describing what broke, customer impact, root cause, and how it was mitigated.]`

---

## 2. Impact & Customer Experience
- **Affected Services:** `[TODO: e.g., frontend, checkoutservice, productcatalogservice]`
- **User-Facing Symptoms:** `[TODO: e.g., HTTP 500 Internal Server Error on POST /cart/checkout, or connection timeouts]`
- **Duration:** `[TODO: XX minutes (from HH:MM:SS UTC to HH:MM:SS UTC)]`

---

## 3. Root Cause Analysis (RCA)
- **Trigger / Proximate Cause:** `[TODO: What resource or configuration change caused the outage?]`
- **Technical Details:** `[TODO: Include exact Kubernetes resource names, namespaces, selectors, environment variables, or VPC firewall rules involved.]`

---

## 4. Timeline of Events (All Times UTC — Grounded in Logs & Metrics)
| Timestamp (UTC) | Event / Observation | Source (Log / Metric / Command) |
| :--- | :--- | :--- |
| `HH:MM:SS UTC` | `[TODO: Outage injected / first error observed]` | `[TODO: Cloud Audit Logs / K8s Event]` |
| `HH:MM:SS UTC` | `[TODO: Investigation started via SRE Extension]` | `[TODO: kubectl / Cloud Logging]` |
| `HH:MM:SS UTC` | `[TODO: Root cause identified]` | `[TODO: kubectl describe / gcloud]` |
| `HH:MM:SS UTC` | `[TODO: Remediation applied and service restored]` | `[TODO: HTTP 200 verified]` |

---

## 5. Remediation & Recovery
- **Mitigation Command(s) Executed:**
  ```bash
  # [TODO: Insert exact kubectl / gcloud remediation command]
  ```
- **Verification:** `[TODO: How was service recovery verified?]`

---

## 6. Grounded Monitoring Graphs
> `[TODO: Use the monitoring-graphs skill to query Google Cloud Monitoring, save an annotated PNG chart in this directory (e.g., incident_metrics.png), and embed it below!]`

```markdown
![Incident Metrics Graph](incident_metrics.png)
```

---

## 7. Lessons Learned & Action Items
- **What Went Well:**
  - `[TODO]`
- **What Went Wrong:**
  - `[TODO]`
- **Action Items (Preventing Recurrence):**
  - [ ] `[TODO: P1 Action Item]`
  - [ ] `[TODO: P2 Action Item]`
