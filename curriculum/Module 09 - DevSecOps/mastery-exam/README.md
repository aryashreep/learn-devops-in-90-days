# 🏆 Module 08 Mastery Exam: DevSecOps Pipeline Architecture

Welcome to the **Mastery Exam** for Module 08! Test your knowledge on DevSecOps principles, SAST, DAST, SCA, container security with Trivy & hadolint, secret scanning with GitLeaks, OWASP ZAP, severity gating, reusable workflow orchestration, and pipeline dependency chains.

---

### 📝 30 Multiple Choice Questions

#### 🛡️ Section 1: DevSecOps Foundations & Shift-Left (1–8)

1. **What is the primary principle behind "Shift Left" security?**
   - A) Move security testing to the end of the pipeline
   - B) Move security testing earlier in the development lifecycle
   - C) Eliminate all security testing
   - D) Only test security in production
   - **Answer:** B

2. **How does a DevSecOps pipeline differ from a traditional DevOps pipeline?**
   - A) DevSecOps skips the build stage
   - B) Security is embedded at every stage rather than bolted on at the end
   - C) DevSecOps only runs on self-hosted runners
   - D) There is no difference — they are the same
   - **Answer:** B

3. **What is the primary advantage of catching a vulnerability early in the pipeline (during SAST) vs. later in production?**
   - A) It costs approximately the same either way
   - B) It costs about 10x less to fix early
   - C) Production fixes are always easier
   - D) Early catches don't matter
   - **Answer:** B

4. **Which of the following best describes the DevSecOps formula?**
   - A) Speed + Automation
   - B) Speed + Automation + Security built-in
   - C) Security only at deployment
   - D) Manual security reviews only
   - **Answer:** B

5. **In a DevSecOps pipeline, what is the role of the `needs:` keyword in the docker-push job?**
   - A) It runs docker-push in parallel with security checks
   - B) It blocks docker-push until ALL listed security jobs pass — acting as the security gate
   - C) It pushes the image to multiple registries
   - D) It skips all previous job results
   - **Answer:** B

6. **Which `on:` trigger makes a workflow reusable so it can be called from another workflow?**
   - A) `on: push`
   - B) `on: workflow_dispatch`
   - C) `on: workflow_call`
   - D) `on: pull_request`
   - **Answer:** C

7. **What does `secrets: inherit` do when used in a job that calls a reusable workflow?**
   - A) It creates new empty secrets for the child workflow
   - B) It passes all secrets from the parent workflow down to the child workflow
   - C) It deletes the secrets after use
   - D) It logs all secret values in the console
   - **Answer:** B

8. **Which jobs should typically use `secrets: inherit`?**
   - A) Every job in the pipeline, including simple linting
   - B) Only jobs that require authentication (e.g. Docker push, SonarQube scan)
   - C) No jobs — secrets: inherit is deprecated
   - D) Only the deploy job
   - **Answer:** B

---

#### 🔍 Section 2: SAST — Static Application Security Testing (9–13)

9. **Which security scanning type analyzes source code WITHOUT executing it?**
   - A) DAST — Dynamic Application Security Testing
   - B) SAST — Static Application Security Testing
   - C) SCA — Software Composition Analysis
   - D) Container Scan
   - **Answer:** B

10. **Which of the following is a SAST tool for Python code?**
    - A) Trivy
    - B) Bandit
    - C) GitLeaks
    - D) OWASP ZAP
    - **Answer:** B

11. **In the `code-quality.yml` workflow, what does `go vet` do?**
    - A) It formats Go source code
    - B) It performs static analysis to detect suspicious constructs and bugs in Go code
    - C) It runs Go unit tests
    - D) It builds the Go binary
    - **Answer:** B

12. **Which tool goes beyond basic linting and reports code smells, security hotspots, duplication percentage, and maintainability rating?**
    - A) ESLint
    - B) flake8
    - C) SonarQube
    - D) hadolint
    - **Answer:** C

13. **When does SAST typically run in the DevSecOps pipeline?**
    - A) After deployment to production
    - B) During runtime of the application
    - C) On every push or pull request — in parallel with other CI checks
    - D) Only once a week via a scheduled trigger
    - **Answer:** C

---

#### 📦 Section 3: SCA — Software Composition Analysis (14–17)

14. **What does SCA (Software Composition Analysis) scan for?**
    - A) Hardcoded passwords in the application's own source code
    - B) Known vulnerabilities in third-party libraries and packages
    - C) Runtime behavior of the application
    - D) Dockerfile best practices
    - **Answer:** B

15. **Which Go tool is used for vulnerability scanning of Go dependencies in the pipeline?**
    - A) `go fmt`
    - B) `govulncheck`
    - C) `go build`
    - D) `go run`
    - **Answer:** B

16. **In the `dependency-scan.yml` workflow, what is the purpose of `continue-on-error: true`?**
    - A) The job will fail silently without notification
    - B) Even if vulnerabilities are found, the job reports them without failing the pipeline
    - C) The job skips the scan entirely
    - D) The job runs indefinitely
    - **Answer:** B

17. **Why is the `if: always()` condition used on the artifact upload step in the dependency scan?**
    - A) To ensure the report is uploaded even if a prior step in the job fails
    - B) To make the upload faster
    - C) To prevent the upload from running
    - D) To trigger the next workflow
    - **Answer:** A

---

#### 🐳 Section 4: Container Security — hadolint & Trivy (18–23)

18. **What does hadolint check?**
    - A) Running containers for runtime vulnerabilities
    - B) Dockerfile syntax and best practices
    - C) Go source code for bugs
    - D) Git history for leaked secrets
    - **Answer:** B

19. **What is the purpose of the matrix strategy (`matrix: folders: [backend, frontend]`) in the Docker scan workflow?**
    - A) To run the scan once for both folders combined
    - B) To run the same scan job twice — once for backend and once for frontend — in parallel
    - C) To deploy both folders simultaneously
    - D) To combine the folders into a single image
    - **Answer:** B

20. **In the Trivy scanner step, what does `severity: CRITICAL` specify?**
    - A) Only CRITICAL severity vulnerabilities will be reported
    - B) All vulnerabilities will be reported as CRITICAL
    - C) CRITICAL vulnerabilities will be ignored
    - D) The scan only checks for CRITICAL malware
    - **Answer:** A

21. **What is the effect of `ignore-unfixed: true` in the Trivy configuration?**
    - A) Vulnerabilities without an available patch are ignored (reducing noise)
    - B) All vulnerabilities are ignored
    - C) Only unfixed vulnerabilities are reported
    - D) The scan runs faster by skipping all checks
    - **Answer:** A

22. **What does `exit-code: 1` do in the Trivy action configuration?**
    - A) It always exits with code 1 regardless of findings
    - B) It tells Trivy to return a non-zero exit code when vulnerabilities matching the severity threshold are found
    - C) It forces the runner to restart
    - D) It disables all output
    - **Answer:** B

23. **What is the purpose of `fail-fast: false` in the Docker scan matrix strategy?**
    - A) If one folder's scan fails, the other folder's scan continues independently
    - B) The workflow fails immediately on any error
    - C) No jobs run in parallel
    - D) The build is cancelled entirely
    - **Answer:** A

---

#### 🔐 Section 5: Secret Scanning & GitLeaks (24–26)

24. **Why does the GitLeaks scan use `fetch-depth: 0` when checking out the repository?**
    - A) To speed up the checkout process
    - B) To download the complete Git history, since a secret may have been committed and later removed
    - C) To only fetch the latest commit
    - D) To disable all Git operations
    - **Answer:** B

25. **How does GitLeaks detect secrets in code?**
    - A) By running the application and monitoring network traffic
    - B) By using regex pattern matching and entropy-based detection
    - C) By asking developers to manually mark secrets
    - D) By checking only the Dockerfile
    - **Answer:** B

26. **Which of the following would GitLeaks be able to detect?**
    - A) Python syntax errors
    - B) AWS access keys committed to a repository
    - C) Docker image layer sizes
    - D) Unit test coverage percentage
    - **Answer:** B

---

#### 🌐 Section 6: DAST — Dynamic Application Security Testing (27–28)

27. **What does OWASP ZAP Baseline Scan test against?**
    - A) The source code without executing it
    - B) The running application against the OWASP Top 10 web security risks
    - C) Docker images for known CVEs
    - D) Git history for leaked credentials
    - **Answer:** B

28. **Why does the DAST scan run AFTER deployment, not before?**
    - A) Because DAST requires the application to be live and running to simulate real attacks
    - B) Because DAST only runs on weekends
    - C) Because DAST is faster when the app is deployed
    - D) Because DAST replaces all other security scans
    - **Answer:** A

---

#### ⚠️ Section 7: Severity Gating & Pipeline Architecture (29–30)

29. **In a production DevSecOps pipeline, which severity levels should BLOCK the build from proceeding?**
    - A) All severities including LOW
    - B) CRITICAL and HIGH
    - C) Only CRITICAL — HIGH can be ignored
    - D) None — all findings are just reported
    - **Answer:** B

30. **What is the correct order of stages in the DevSecOps pipeline dependency chain?**
    - A) deploy → docker-push → dast-scan → CI checks (parallel)
    - B) CI checks (parallel) → docker-push → deploy → dast-scan
    - C) dast-scan → CI checks → docker-push → deploy
    - D) docker-push → CI checks → deploy → dast-scan
    - **Answer:** B

---

### 📊 Answer Key

| Q# | Answer | Topic |
|----|--------|-------|
| 1 | B | Shift-Left |
| 2 | B | DevSecOps vs DevOps |
| 3 | B | Cost of early fixes |
| 4 | B | DevSecOps formula |
| 5 | B | needs: keyword as gate |
| 6 | C | workflow_call |
| 7 | B | secrets: inherit |
| 8 | B | Least privilege |
| 9 | B | SAST definition |
| 10 | B | Bandit (Python SAST) |
| 11 | B | go vet |
| 12 | C | SonarQube |
| 13 | C | SAST timing |
| 14 | B | SCA definition |
| 15 | B | govulncheck |
| 16 | B | continue-on-error |
| 17 | A | if: always() |
| 18 | B | hadolint |
| 19 | B | Matrix strategy |
| 20 | A | Trivy severity filter |
| 21 | A | ignore-unfixed |
| 22 | B | exit-code: 1 |
| 23 | A | fail-fast: false |
| 24 | B | fetch-depth: 0 |
| 25 | B | GitLeaks detection |
| 26 | B | AWS keys detection |
| 27 | B | OWASP ZAP |
| 28 | A | DAST timing |
| 29 | B | Severity gating |
| 30 | B | Pipeline order |

---

*Module 08 — DevSecOps Pipeline Architecture • #LearnDevOpsIn90Days*
