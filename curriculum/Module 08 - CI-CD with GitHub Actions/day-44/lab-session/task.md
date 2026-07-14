# 🧪 Lab Session: Day 44 — Runners: GitHub-Hosted and Self-Hosted

**Jagu:** "Beep Boop! Golu, runner is the worker that executes your workflow. Today we will understand which runner to use when!"

## 🎯 Task Objectives
- Understand the difference between GitHub-hosted and self-hosted runners.
- Configure a workflow with runner labels.
- Set up a simple self-hosted runner registration.

## 🛠️ Hands-on Challenges

1.  **GitHub-Hosted Runner:**
    - Create a workflow `.github/workflows/runner-check.yml`:
    ```yaml
    name: Runner Check
    on: [push]
    jobs:
      check:
        runs-on: ubuntu-latest
        steps:
          - run: echo "Running on ${{ runner.os }}"
          - run: echo "Runner name: ${{ runner.name }}"
    ```

2.  **Runner Labels:**
    - Modify the workflow to use `runs-on: [self-hosted, linux, x64]`.
    - Commit and push — observe what happens (it will wait for a self-hosted runner).

3.  **Runner Registration (Conceptual):**
    - Go to your repo: Settings → Actions → Runners → Add runner
    - Note the registration token and commands shown on screen
    - Document the steps without actually running them

---

### ✅ Proof of Work
**Jagu:** "Golu, runner knowledge record karo!"

1. Create a file named **`runner-setup.md`** in the **`solution/`** folder.
2. Document your workflow YAML and observations.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 44 • Golu & Jagu Edition*
