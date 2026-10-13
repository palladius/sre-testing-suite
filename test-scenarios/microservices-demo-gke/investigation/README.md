# 🕵️‍♂️ Online Boutique SRE Investigation War Room (`investigation/`)

Welcome to the **`investigation/`** workspace — the designated starting directory ("Root Cage") for running your AI SRE agent (`agy`, `gemini`, or `claude`) when troubleshooting **Online Boutique (`microservices-demo`)** on GKE!

---

## 🎯 Why Start Inside `investigation/` Instead of the Parent Folder?

When you launch an agentic CLI or IDE (`agy` / `gemini`), it automatically indexes the current working directory subtree (`.`):

1. **If you start in the parent folder (`test-scenarios/microservices-demo-gke/` or `breakage-scenarios/`)**:
   - The agent will see `breakage-scenarios/breakage1-checkout/break.sh`, `justfile`, and `bin/monitor.sh` on disk and "cheat" in 10 seconds by reading the chaos scripts instead of diagnosing the live GKE cluster!
2. **When you start inside this `investigation/` folder**:
   - ✅ **Full Visibility into `./microservices-demo/`**: Via the `./microservices-demo` symlink, both you and the AI agent can inspect the canonical Kubernetes manifests (`./microservices-demo/kubernetes-manifests/`), microservice source code (`./microservices-demo/src/`), and architecture diagram (`./microservices-demo/docs/img/architecture-diagram.png`) — just like a real on-call SRE!
   - 🔒 **Zero Visibility into `../breakage-scenarios/`**: None of the chaos-injection scripts exist inside this directory subtree, and [`GEMINI.md`](./GEMINI.md) / [`AGENTS.md`](./AGENTS.md) explicitly forbid the agent from traversing into `../` without your permission.

---

## 📂 What Is Inside This Folder?

```text
investigation/
├── GEMINI.md                  # 🔒 Anti-Cheating Didactic Guardrail & SRE instructions (loaded by Gemini CLI / Antigravity)
├── AGENTS.md -> GEMINI.md     # 🔗 Symlink so all agentic harnesses load the same guardrail
├── README.md                  # 📖 This guide
├── postmortem.md              # 📝 Starter Postmortem template (overwrite during Step 4!)
└── microservices-demo -> ../microservices-demo   # 🔗 Full access to Online Boutique code, manifests & diagrams
```

---

## 🚀 Quick Start

1. Make sure the upstream `microservices-demo` repository has been cloned in the parent folder:
   ```bash
   just -f ../justfile clone-repo
   ```
2. Launch your agent from **inside this `investigation/` directory**:
   ```bash
   cd ~/sre-testing-suite/test-scenarios/microservices-demo-gke/investigation
   agy
   # or: gemini
   ```
3. Follow the prompts in your lab guide (or see `../investigation-prompts/` from a separate terminal) to:
   - **Investigate** the active GKE outage using live telemetry (`kubectl`, `gcloud`, Cloud Logging, Cloud Monitoring).
   - **Mitigate** the outage safely using the Safe Executor pattern.
   - **Generate the Postmortem** by overwriting [`./postmortem.md`](./postmortem.md) and embedding a grounded Cloud Monitoring PNG chart!

---

## 🔗 Dependencies & Qwiklabs Contract (`postmortem.md`)

> **⚠️ Maintainer Note (Used by Qwiklabs Lab `CE529`):**
> - The file [`./postmortem.md`](./postmortem.md) starts with the HTML comment marker:
>   `<!-- substitute this with the real postmortem -->`
> - External lab readiness / assessment scripts (`check_lab_ready.rb` in Qwiklabs **CE529**) check for this exact marker string in `investigation/postmortem.md` to determine whether the student's Postmortem is still an untouched template (`TEMPLATE`) or has been filled out by the agent (`COMPLETED`).
> - **Do not remove or rename `<!-- substitute this with the real postmortem -->` in [`./postmortem.md`](./postmortem.md) when committing template changes to this repository!**
