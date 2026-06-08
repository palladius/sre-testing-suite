# Changelog 🪵

All notable changes to this project will be documented in this file.

---

## [0.0.3] - 2026-06-05 (Riccardo)

### Added
- Created `breakage_log_line.sh` script to log breakage events locally to `breakage.log` and asynchronously to GCP Cloud Logging.

### Changed
- Renamed folder `breakage-scnearios` to `breakage-scenarios` to correct spelling.
- Updated all references in scripts, `README.md`, and `justfile` to use the correct `breakage-scenarios` spelling.

---


## [0.0.2] - 2026-05-28 (Ricardo)

### Added
- Created a centralized GKE monitor dashboard (`monitor.sh`) that dynamically checks and warns about missing/present repository checkouts. Relocated it under `bin/` at GKE root level.
- Centralized GKE root `justfile` allowing clean, global task executions directly from `test-scenarios/microservices-demo-gke/`.
- Dynamic path resolution using absolute script locations (`SCRIPT_DIR`) to robustly target a single, shared `microservices-demo/` directory.

### Changed
- **Renumbered Scenarios**: Corrected the scenario numbering swap to ensure consistency everywhere:
  - **Scenario 1**: `breakage1-checkout` (Restricts checkout traffic using a network policy).
  - **Scenario 2**: `breakage2-canary` (Buggy frontend canary rollout).
  - **Scenario 3**: `breakage3-firewall` (VPC firewall ingress block).
- Relocated and redesigned `justfile` to one folder above at GKE root level.
- Centralized the `microservices-demo` clone logic to use `just clone-repo` under `test-scenarios/microservices-demo-gke/microservices-demo/`.
- Updated both `README.md` files (root and GKE-level) to represent the new modular architecture, correct paths, and corresponding `just` runner targets.
- Global `.gitignore` updated to filter out `**/microservices-demo/` checkouts.

### Removed
- Removed duplicate git clones inside scenario subdirectories.
- Deleted nested/incorrect git subprojects (submodule gitlinks) under `breakage1-checkout/`.

### Contributors
- Riccardo Carlesso
- Gemini AI Partner

---

## [0.0.1] - 2026-05-11 (Madhavi)

### Added
- Initial commit for microservices-demo-gke test scenarios.
- Integrated the GKE cluster test scenarios with the Online Boutique application.
- Added three raw breakage scenario scripts (`breakage-scenario1.sh`, `breakage-scenario2.sh`, `breakage-scenario3.sh`).

### Changed
- Configured base `.gitignore` and purged `.DS_Store` files.

### Contributors
- Madhavi Karra
- Riccardo Carlesso
