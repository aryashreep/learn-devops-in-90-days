# 🛡️ DevSecOps Command & Tool Cheatsheet

> **Quick reference for the essential DevSecOps tools: SAST, SCA, Container Security, Secret Scanning, and DAST.**
>
> *Print-friendly — designed for Cmd+P / PDF export in dark or light mode.*

---

## 📋 Severity Reference

| Level | Color | Pipeline Action | Description |
|-------|-------|----------------|-------------|
| **CRITICAL** | 🔴 Red | **BLOCK BUILD** | Must be fixed immediately. `exit-code: 1` |
| **HIGH** | 🟠 Orange | **BLOCK BUILD** (configurable) | Patch usually available; fix promptly |
| **MEDIUM** | 🟡 Yellow | **REPORT ONLY** | Acceptable for now; track but don't block |
| **LOW** | 🔵 Blue | **REPORT ONLY** | Can generally be ignored |

---

## 1. SAST — Static Application Security Testing

**Purpose:** Analyze source code *without executing it* — catch bugs and vulnerabilities early.

### Bandit (Python)

```bash
# Install
pip install bandit

# Scan a single file
bandit my_file.py

# Scan an entire directory (recursive)
bandit -r my_project/

# Output as JSON for CI consumption
bandit -r my_project/ -f json -o bandit-report.json

# Set severity threshold (only show HIGH and above)
bandit -r my_project/ -ll

# Ignore certain test IDs (e.g. skip B101 for assert statements)
bandit -r my_project/ --skip B101
```

### flake8 (Python Linter)

```bash
# Install
pip install flake8

# Lint a file or directory
flake8 my_file.py
flake8 my_project/

# Config file (.flake8)
echo -e "[flake8]\nmax-line-length = 120\nextend-ignore = E203,W503" > .flake8

# Output in CI-friendly format
flake8 my_project/ --format=%(path)s:%(row)s:%(col)s:%(code)s:%(text)s
```

### ESLint (JavaScript / TypeScript)

```bash
# Install
npm install --save-dev eslint

# Initialize config
npx eslint --init

# Lint files
npx eslint src/

# Fix auto-fixable issues
npx eslint src/ --fix

# Output JSON report
npx eslint src/ -f json -o eslint-report.json
```

### go vet + go fmt (Go Static Analysis & Formatting)

```bash
# Format Go source code to standard style
go fmt ./...

# Run static analysis on all packages
go vet ./...

# Check specific package
go vet mypackage/

# Combined format + vet (common CI pair)
go fmt ./... && go vet ./...
```

### SonarQube (Advanced SAST Platform)

```bash
# Run scanner with docker (standalone)
docker run --rm -e SONAR_HOST_URL="http://sonar-host:9000" \
  -e SONAR_TOKEN="your-token" \
  -v "$(pwd):/usr/src" \
  sonarsource/sonar-scanner-cli

# GitHub Actions snippet
# - uses: SonarSource/sonarqube-scan-action@v5
#   with:
#     args: >
#       -Dsonar.projectKey=my-project
#       -Dsonar.sources=.
```

---

## 2. SCA — Software Composition Analysis (Dependency Scan)

**Purpose:** Scan third-party libraries and packages for known CVEs.

### govulncheck (Go)

```bash
# Install
go install golang.org/x/vuln/cmd/govulncheck@latest

# Scan current module
govulncheck ./...

# Scan and output to file
govulncheck ./... > govulncheck-report.txt

# JSON output
govulncheck -json ./... > govulncheck-report.json

# Continue on error (CI pattern)
govulncheck ./... > govulncheck-report.txt; echo "Exit code: $?"
```

### npm audit (Node.js)

```bash
# Audit current project's dependencies
npm audit

# Audit and output JSON
npm audit --json > npm-audit-report.json

# Fix vulnerabilities automatically (may change package-lock)
npm audit fix

# Only fix non-breaking changes
npm audit fix --only=dev

# Audit with production-only scope
npm audit --production

# Skip audit (for speed in CI when not needed)
npm install --no-audit
```

### pip audit (Python)

```bash
# Install
pip install pip-audit

# Audit current environment
pip-audit

# Audit requirements file
pip-audit -r requirements.txt

# Output JSON
pip-audit --format json > pip-audit-report.json

# Fix vulnerabilities (when possible — experimental)
pip-audit --fix
```

---

## 3. Container Security — hadolint + Trivy

**Purpose:** Two-stage Docker security: lint the Dockerfile, then scan the built image.

### hadolint (Dockerfile Linter)

```bash
# Run with Docker
docker run --rm -i hadolint/hadolint < Dockerfile

# Lint a specific Dockerfile
docker run --rm -v "$(pwd):/workspace" hadolint/hadolint hadolint /workspace/Dockerfile

# Install locally (macOS via brew)
brew install hadolint

# Lint directly
hadolint Dockerfile
hadolint backend/Dockerfile

# Ignore specific rules
hadolint --ignore DL3003 --ignore DL3007 Dockerfile

# Output format
hadolint -f json Dockerfile

# Common rules triggered:
#   DL3007: Using latest tag is dangerous
#   DL3008: Pin versions in apt get install
#   DL3009: Delete apt-get lists after install
#   DL3042: Avoid RUN apt-get upgrade (use specific package updates)
#   DL4006: Set SHELL option pipefail
```

### Trivy (Container Image Vulnerability Scanner)

```bash
# Install (macOS via brew)
brew install trivy

# Scan a Docker image
trivy image alpine:latest

# Scan with severity filter (only CRITICAL)
trivy image --severity CRITICAL alpine:latest

# Scan and ignore unpatched vulnerabilities
trivy image --severity CRITICAL --ignore-unfixed alpine:latest

# Output table format
trivy image --format table alpine:latest

# Output JSON for CI
trivy image --format json --output trivy-report.json alpine:latest

# Output SARIF (for GitHub Security tab)
trivy image --format sarif --output trivy-report.sarif alpine:latest

# Scan with exit code (fail CI on findings)
trivy image --severity CRITICAL --exit-code 1 alpine:latest

# Scan only OS packages
trivy image --vuln-type os alpine:latest

# Scan only library dependencies
trivy image --vuln-type library alpine:latest

# Scan a local image (not pushed to registry)
docker build -t my-app:latest .
trivy image --severity HIGH,CRITICAL my-app:latest

# Scan Dockerfile / IaC config files
trivy config .

# Scan filesystem
trivy fs .
```

#### Trivy Severity Threshold Examples

```bash
# CI fails only on CRITICAL
trivy image --severity CRITICAL --exit-code 1 my-image:latest

# CI fails on CRITICAL + HIGH
trivy image --severity CRITICAL,HIGH --exit-code 1 my-image:latest

# CI reports all but never fails (audit mode)
trivy image --severity CRITICAL,HIGH,MEDIUM --exit-code 0 my-image:latest
```

#### Trivy Example Output

```
┌─────────────────────┬────────────────┬──────────┬─────────────────────────────────────┐
│       Library       │ Vulnerability  │ Severity │         Installed Version           │
├─────────────────────┼────────────────┼──────────┼─────────────────────────────────────┤
│ python (Python 3.11)│ CVE-2024-XXXX  │ CRITICAL │ 3.11.0                              │
│ libssl3             │ CVE-2024-YYYY  │ HIGH     │ 3.0.12                              │
│ zip (Debian)        │ CVE-2024-ZZZZ  │ MEDIUM   │ 3.0-13                              │
└─────────────────────┴────────────────┴──────────┴─────────────────────────────────────┘
```

---

## 4. Secret Scanning — GitLeaks

**Purpose:** Detect accidentally committed secrets (API keys, tokens, passwords) in Git repositories.

### GitLeaks

```bash
# Install (macOS via brew)
brew install gitleaks

# Scan local repository (default: only current commit)
gitleaks detect --source .

# Scan with verbose output
gitleaks detect --source . --verbose

# Scan full Git history (catches secrets that were later removed)
gitleaks detect --source . --log-opts="--all"

# Scan a specific branch
gitleaks detect --source . --log-opts="--all main"

# Scan with custom rules
gitleaks detect --source . --config=custom-rules.toml

# Output JSON report
gitleaks detect --source . --report-path=gitleaks-report.json --report-format=json

# Scan without exiting with error (continue on findings)
gitleaks detect --source . --no-git

# Protect mode — scan before commit
gitleaks protect --staged

# Pre-commit hook (add to .git/hooks/pre-commit):
#   gitleaks protect --staged

# CI-friendly: exit with code 1 if secrets found
gitleaks detect --source . --verbose --exit-code 1

# Scan a range of commits
gitleaks detect --source . --log-opts="--all --since=2024-01-01"
```

#### What GitLeaks Detects

```
- AWS Access Keys        (AKIA*)
- GitHub Tokens          (ghp_*, gho_*, ghu_*)
- GitLab Tokens          (glpat-*)
- Slack Tokens           (xoxb-*, xoxa-*, xoxp-*)
- Google API Keys        (AIza*)
- SSH Private Keys       (-----BEGIN.*PRIVATE KEY-----)
- JWT Tokens             (eyJ.*)
- Generic Passwords      (High-entropy strings)
- Docker passwords in ENV
```

---

## 5. DAST — Dynamic Application Security Testing

**Purpose:** Test the *running* application by simulating real attacks against the OWASP Top 10.

### OWASP ZAP (Zed Attack Proxy)

```bash
# Run ZAP baseline scan with Docker
docker run --rm -v "$(pwd):/zap/wrk" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py -t https://target-app.com -r report.html

# Scan with JSON output
docker run --rm -v "$(pwd):/zap/wrk" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py -t https://target-app.com -J report.json

# Scan with configurable alert threshold
docker run --rm -v "$(pwd):/zap/wrk" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py -t https://target-app.com -c zap.conf

# Fail on any alerts
docker run --rm -v "$(pwd):/zap/wrk" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py -t https://target-app.com -w warning-output.txt

# Full API scan (for REST/GraphQL APIs)
docker run --rm -v "$(pwd):/zap/wrk" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-api-scan.py -t https://api.target.com/openapi.json -f openapi
```

#### OWASP Top 10 Checks

```
A01 - Broken Access Control
A02 - Cryptographic Failures
A03 - Injection (SQL, NoSQL, OS)
A04 - Insecure Design
A05 - Security Misconfiguration
A06 - Vulnerable Components
A07 - Authentication Failures
A08 - Integrity Failures
A09 - Logging & Monitoring Failures
A10 - SSRF (Server-Side Request Forgery)
```

#### Health Check Loop (for DAST pre-requisite)

```bash
# Wait for application to be healthy before DAST scan
for i in {1..30}; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/health)
  if [ "$STATUS" = "200" ]; then
    echo "Application is healthy!"
    break
  fi
  echo "Waiting for app... attempt $i"
  sleep 10
done
```

---

## 6. GitHub Actions Workflow Snippets

### Trivy Step (CRITICAL gate, report only)

```yaml
- name: Run Trivy Scanner
  uses: aquasecurity/trivy-action@0.30.0
  continue-on-error: true
  with:
    image-ref: ${{ vars.DOCKERHUB_USERNAME }}/my-app:latest
    format: table
    exit-code: 1
    ignore-unfixed: true
    vuln-type: os,library
    severity: CRITICAL
```

### hadolint Step

```yaml
- name: Dockerfile Lint
  uses: hadolint/hadolint-action@v3.1.0
  with:
    dockerfile: backend/Dockerfile
```

### GitLeaks Step

```yaml
- uses: actions/checkout@v4
  with:
    fetch-depth: 0
- name: GitLeaks Scan
  uses: gitleaks/gitleaks-action@v2
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

### Govulncheck Step

```yaml
- name: Install Govulncheck
  run: go install golang.org/x/vuln/cmd/govulncheck@latest
- name: Go Vulncheck
  continue-on-error: true
  run: govulncheck ./... > govulncheck-report.txt
  working-directory: backend
```

### OWASP ZAP Step

```yaml
- name: OWASP ZAP Scan
  uses: zaproxy/action-baseline@v0.14.0
  with:
    target: 'http://localhost:8080'
    failAction: false
```

### Upload Artifact Step

```yaml
- name: Upload Report
  if: always()
  uses: actions/upload-artifact@v4
  with:
    name: security-report
    path: reports/*.txt
    retention-days: 5
```

---

## 7. Quick-Install Reference

| Tool | Install Command | Category |
|------|----------------|----------|
| Bandit | `pip install bandit` | SAST (Python) |
| flake8 | `pip install flake8` | SAST (Python) |
| ESLint | `npm install --save-dev eslint` | SAST (JS/TS) |
| govulncheck | `go install golang.org/x/vuln/cmd/govulncheck@latest` | SCA (Go) |
| pip-audit | `pip install pip-audit` | SCA (Python) |
| hadolint | `brew install hadolint` | Container |
| Trivy | `brew install trivy` | Container |
| GitLeaks | `brew install gitleaks` | Secrets |
| OWASP ZAP | `docker pull ghcr.io/zaproxy/zaproxy:stable` | DAST |
| SonarQube Scanner | `docker pull sonarsource/sonar-scanner-cli` | SAST (Advanced) |

---

## 8. DevSecOps Pipeline Flow (ASCII Diagram)

```
┌─────────────────────── CI STAGE (Parallel) ───────────────────────┐
│                                                                    │
│  ┌─────────────┐  ┌──────────┐  ┌──────────┐  ┌───────────────┐  │
│  │ code-quality │  │ code-    │  │ sonar-   │  │ docker-checks │  │
│  │ (SAST)       │  │ tests    │  │ qube     │  │ (hadolint +   │  │
│  │              │  │ (unit)   │  │ (SAST+)  │  │  Trivy)       │  │
│  └─────────────┘  └──────────┘  └──────────┘  └───────────────┘  │
│                                                                    │
│  ┌──────────────┐  ┌───────────────┐                               │
│  │ dependency-  │  │ secret-       │                               │
│  │ checks (SCA) │  │ scanning      │                               │
│  │              │  │ (GitLeaks)    │                               │
│  └──────────────┘  └───────────────┘                               │
└─────────────────────────┬──────────────────────────────────────────┘
                          │  (ALL PASS — Security Gate)
                          ▼
              ┌─────────────────────────┐
              │    docker-push          │
              │    (Image → DockerHub)  │
              └───────────┬─────────────┘
                          │  (needs: [docker-push])
                          ▼
              ┌─────────────────────────┐
              │     deploy              │
              │  (Self-Hosted Runner)   │
              └───────────┬─────────────┘
                          │  (needs: [deploy])
                          ▼
              ┌─────────────────────────┐
              │     dast-scan           │
              │   (OWASP ZAP)           │
              └─────────────────────────┘
```

---

## 9. GitHub Secrets vs Vars

| Type | Usage | Example | Visible in Logs? |
|------|-------|---------|-----------------|
| **Secrets** | `${{ secrets.DOCKERHUB_TOKEN }}` | Passwords, tokens, keys | ❌ Masked as `***` |
| **Vars** | `${{ vars.DOCKERHUB_USERNAME }}` | Usernames, env names, ports | ✅ Plain text |

**Rule of thumb:** If it's sensitive — it's a **Secret**. If it's configuration — it's a **Var**.

---

> *🛡️ DevSecOps Cheatsheet — #LearnDevOpsIn90Days • Module 08*
>
> *Maintainer: [Aryashree Pritikrishna](https://github.com/aryashreep)*
