# 🧪 Lab Session: Day 52 — DevSecOps Pipeline Architecture

**Jagu:** "Beep Boop! Golu, today we will create our own DevSecOps pipeline blueprint! From SAST to DAST — each security layer has to be integrated into a master workflow!"

## 🎯 Task Objectives
- Design a master `devsecops.yml` workflow that orchestrates security checks
- Understand the dependency chain: CI (parallel) → Build → Deploy → DAST
- Simulate a Trivy security scan and interpret severity levels

## 🛠️ Hands-on Challenges

### Challenge 1: Master Pipeline Design
Create a YAML file `devsecops.yml` that orchestrates the following jobs:
- `code-quality` → calls `code-quality.yml`
- `code-tests` → calls `code-tests.yml`
- `sonar-qube` → calls `sonar-scan.yml` (with `secrets: inherit`)
- `docker-checks` → calls `docker-scans.yml` (with `secrets: inherit`)
- `dependency-checks` → calls `dependency-scan.yml`
- `secret-scanning` → calls `secret-scanning.yml`
- `docker-push` → runs after ALL CI checks pass (uses `needs:`)
- `deploy` → runs after `docker-push`
- `dast-scan` → runs after `deploy`

### Challenge 2: Trivy Severity Gate
Create a `trivy-scan.yml` workflow that:
- Scans a Docker image using `aquasecurity/trivy-action`
- Configures `severity: CRITICAL` and `exit-code: 1` to block the build
- Sets `ignore-unfixed: true` to avoid alerting on unpatched vulnerabilities
- Uses a matrix strategy for `[backend, frontend]` with `fail-fast: false`

### Challenge 3: Architecture Documentation
Create a markdown file `pipeline-architecture.md` that:
- Describes the complete DevSecOps pipeline flow
- Explains the purpose of each scanning stage (SAST, SCA, Container, Secrets, DAST)
- Documents the severity gating system (which severities block/pass)
- Includes a simple ASCII-flow diagram showing the dependency chain

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your proofs to the solution folder!"

1. Create your output proof files in the **`solution/`** folder:
   - `devsecops.yml` — master orchestrating workflow
   - `trivy-report.txt` — sample Trivy scan output (paste a mock report)
   - `pipeline-architecture.md` — architecture documentation
2. Record command outputs, script listings, or logs.
3. Commit and push!

---

*#LearnDevOpsIn90Days • Day 52 • Golu & Jagu Edition*
