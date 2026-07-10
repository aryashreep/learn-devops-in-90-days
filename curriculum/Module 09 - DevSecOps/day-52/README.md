# 🗓️ Day 52 — DevSecOps Pipeline Architecture

Welcome to **Day 52** of the **#LearnDevOpsIn90Days** challenge 🚀

## 🎯 Today's Goal
Build a complete security-gated CI/CD pipeline with SAST, DAST, SCA, container scanning, secret detection, and severity-based gates that block vulnerable builds.

## 🧠 Key Learnings
- Understand Shift-Left security — move security to the beginning of the pipeline
- Differentiate SAST, DAST, SCA, Container Scanning, and Secret Scanning
- Design a master `devsecops.yml` pipeline orchestrating 10+ reusable workflows
- Configure Trivy severity thresholds (CRITICAL/HIGH/MEDIUM/LOW) as security gates
- Use GitLeaks for secret scanning across full Git history
- Understand the dependency chain with `needs:`, `uses:`, and `secrets: inherit`

## 🧪 Hands-on Lab
Ready to practice? Head over to the lab session:
👉 [Lab Session: DevSecOps Pipeline Architecture](./lab-session/task.md)

---

## Why This Matters for DevOps
Security is not optional — it's a core pillar of DevOps. A DevSecOps pipeline catches vulnerabilities automatically before they reach production, preventing breaches and saving costs. Companies like Amazon deploy every 11.7 seconds because they have automated security gates that protect every release.

## Submission
1. Fork this repository.
2. Navigate to today's folder: `curriculum/Module 09 - DevSecOps/day-52/lab-session/solution/`.
3. Add your proof of work files:
   - `devsecops.yml` — master workflow
   - `trivy-report.txt` — sample scan output
   - `pipeline-architecture.md` — architecture diagram description
4. Commit and push: `git commit -m "day-52: devsecops pipeline architecture complete"`.

## Learn in Public
Share your progress on LinkedIn:
- Tag **@AryashreePritikrishna** and use **#LearnDevOpsIn90Days**
- Share a screenshot of your pipeline dependency chain

Happy Learning! 🚀
