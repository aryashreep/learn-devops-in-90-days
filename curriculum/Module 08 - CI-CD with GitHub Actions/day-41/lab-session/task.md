# 🧪 Lab Session: Day 41 — What is CI/CD?

**Jagu:** "Beep Boop! Golu, CI/CD is that magic which is an automatic journey from writing the code to deploying it. Today we will understand the flow of CI/CD pipeline!"

## 🎯 Task Objectives
- Understand the difference between Continuous Integration, Continuous Delivery, and Continuous Deployment.
- Map a CI/CD pipeline for a sample application.
- Create a CI pipeline flowchart in markdown.

## 🛠️ Hands-on Challenges

1.  **CI vs CD — Venn Diagram:**
    - Create a file `cicd-concepts.md` and document:
    ```
    CI (Continuous Integration):
    - Developers push code multiple times a day
    - Each push triggers automated build + test
    - Catches bugs early (Shift-Left testing)
    - Tools: GitHub Actions, Jenkins, GitLab CI

    CD (Continuous Delivery/Deployment):
    - Delivery: Code is always in a deployable state
    - Deployment: Automatic deployment to production
    - Requires CI to pass first
    ```

2.  **Pipeline Mapping:**
    - For a simple Node.js web app, map the pipeline stages:
    ```
    Code Push → Lint → Build → Unit Test → Integration Test → 
    Staging Deploy → E2E Test → Production Deploy
    ```
    - Identify which stages are CI and which are CD.

3.  **Create a GitHub Repository Structure:**
    ```bash
    mkdir cicd-pipeline && cd cicd-pipeline
    mkdir -p .github/workflows
    mkdir -p src tests
    touch README.md
    ```

4.  **Research CI/CD Tools:**
    - Document 3 popular CI/CD tools and one-sentence description each
    - Explain why GitHub Actions fits naturally for GitHub-hosted projects

---

### ✅ Proof of Work
**Jagu:** "Golu, submit your CI/CD community!"

1. Create **`cicd-concepts.md`** in the **`solution/`** folder with your pipeline map.
2. Include your tool comparisons.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 41 • Golu & Jagu Edition*
