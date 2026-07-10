# 🧪 Lab Session: Day 45 — Jobs, Steps, Env Vars and Conditionals

**Jagu:** "Beep Boop! Golu, aaj hum workflow mein logic dalenge — jobs ka order, variables, aur if-else conditions!"

## 🎯 Task Objectives
- Define multiple jobs with dependencies using `needs`.
- Set environment variables at different scopes.
- Use `if` conditionals to control step execution.

## 🛠️ Hands-on Challenges

1.  **Multi-Job Workflow:**
    - Create a workflow `.github/workflows/sequence.yml`:
    ```yaml
    name: Job Sequence
    on: [push]
    jobs:
      setup:
        runs-on: ubuntu-latest
        steps:
          - run: echo "::notice ::Setup phase complete"
      
      test:
        needs: setup
        runs-on: ubuntu-latest
        steps:
          - run: echo "::notice ::Running tests..."
      
      deploy:
        needs: test
        runs-on: ubuntu-latest
        steps:
          - run: echo "::notice ::Deploying to production"
    ```

2.  **Environment Variables:**
    - Add env vars at different scopes:
    ```yaml
    env:
      GLOBAL_VAR: "I am global"
    jobs:
      demo:
        env:
          JOB_VAR: "I am job-scoped"
        steps:
          - env:
              STEP_VAR: "I am step-scoped"
            run: |
              echo "Global: $GLOBAL_VAR"
              echo "Job: $JOB_VAR"
              echo "Step: $STEP_VAR"
    ```

3.  **Conditionals:**
    - Add a step that runs only on the main branch:
    ```yaml
      - name: Deploy to Production
        if: github.ref == 'refs/heads/main'
        run: echo "Deploying to production..."
    ```

---

### ✅ Proof of Work
**Jagu:** "Golu, apna workflow proof submit karo!"

1. Create a file named **`sequence.yml`** and **`conditional-logic.md`** in the **`solution/`** folder.
2. Include your workflow YAML and describe how conditionals work.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 45 • Golu & Jagu Edition*
