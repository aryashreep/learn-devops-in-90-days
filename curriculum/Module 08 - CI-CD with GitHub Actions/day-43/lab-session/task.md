# 🧪 Lab Session: Day 43 — Triggers and Matrix Builds

**Jagu:** "Beep Boop! Golu, aaj hum workflow triggers aur matrix builds seekhenge — push, PR, schedule, aur ek saath multiple versions pe test!"

## 🎯 Task Objectives
- Configure different workflow triggers: push, pull_request, schedule, workflow_dispatch.
- Create a matrix build strategy for multi-version testing.
- Use conditionals to control job execution.

## 🛠️ Hands-on Challenges

1.  **Workflow Dispatch (Manual Trigger):**
    Create `.github/workflows/dispatch.yml`:
    ```yaml
    name: Manual Trigger
    on:
      workflow_dispatch:
        inputs:
          environment:
            description: 'Deploy to?'
            required: true
            default: 'staging'
            type: choice
            options:
              - staging
              - production

    jobs:
      deploy:
        runs-on: ubuntu-latest
        steps:
          - run: echo "Deploying to ${{ github.event.inputs.environment }}"
    ```

2.  **Schedule Trigger (Cron):**
    ```yaml
    name: Daily Cleanup
    on:
      schedule:
        - cron: '0 6 * * 1-5'  # Weekdays at 6 AM UTC

    jobs:
      cleanup:
        runs-on: ubuntu-latest
        steps:
          - run: echo "Running daily maintenance..."
    ```

3.  **Matrix Build (Multi-version Testing):**
    ```yaml
    name: Matrix Build
    on: [push]

    jobs:
      test:
        runs-on: ${{ matrix.os }}
        strategy:
          matrix:
            os: [ubuntu-latest, windows-latest, macos-latest]
            node: ['16', '18', '20']
        steps:
          - uses: actions/checkout@v4
          - uses: actions/setup-node@v4
            with:
              node-version: ${{ matrix.node }}
          - run: echo "Testing on ${{ matrix.os }} with Node ${{ matrix.node }}"
          - run: npm install && npm test
    ```

4.  **Conditional Execution:**
    ```yaml
    jobs:
      deploy:
        if: github.ref == 'refs/heads/main'
        runs-on: ubuntu-latest
        steps:
          - run: echo "Deploying to production..."
    ```

5.  **Push & Test:** Commit all workflows, push to GitHub, and observe different triggers in the Actions tab.

---

### ✅ Proof of Work
**Jagu:** "Golu, trigger aur matrix build ka proof submit karo!"

1. Create **`triggers-matrix.md`** in the **`solution/`** folder.
2. Include your workflow YAMLs and screenshots from the Actions tab.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 43 • Golu & Jagu Edition*
