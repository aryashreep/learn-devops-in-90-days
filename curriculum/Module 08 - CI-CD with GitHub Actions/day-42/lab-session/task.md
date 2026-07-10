# 🧪 Lab Session: Day 42 — Your First GitHub Actions Workflow

**Jagu:** "Beep Boop! Golu, aaj hum .github/workflows folder mein apna pehla YAML file banayenge jo push pe automatically run hoga!"

## 🎯 Task Objectives
- Create a GitHub Actions workflow file.
- Understand workflow components: name, on, jobs, steps, uses, run.
- Trigger and observe your first workflow run.

## 🛠️ Hands-on Challenges

1.  **Create the Workflow Directory:**
    ```bash
    mkdir -p .github/workflows
    ```

2.  **Create Your First Workflow:**
    Create `.github/workflows/first.yml`:
    ```yaml
    name: My First Workflow
    on: [push]

    jobs:
      greet:
        runs-on: ubuntu-latest
        steps:
          - name: Hello World
            run: echo "Hello from GitHub Actions! 🚀"
          
          - name: Show Runner Info
            run: |
              echo "Runner OS: ${{ runner.os }}"
              echo "Branch: ${{ github.ref }}"
              echo "Commit: ${{ github.sha }}"
          
          - name: List Files
            run: ls -la ${{ github.workspace }}
    ```

3.  **Push to GitHub:**
    ```bash
    git add .github/workflows/first.yml
    git commit -m "feat: add first GitHub Actions workflow"
    git push
    ```

4.  **Observe the Run:**
    - Go to GitHub → Your repo → Actions tab
    - Watch the workflow execute
    - Click into the "greet" job to see each step's logs
    - Screenshot the successful run

5.  **Add a Second Job:**
    ```yaml
    jobs:
      greet:
        runs-on: ubuntu-latest
        steps:
          - run: echo "Hello!"

      check:
        runs-on: ubuntu-latest
        steps:
          - uses: actions/checkout@v4
          - name: Files in repo
            run: ls -la
    ```

---

### ✅ Proof of Work
**Jagu:** "Apna pehla workflow sach me chalta dekhna — ye DevOps ka 'Hello World' hai!"

1. Create **`first-workflow.md`** in the **`solution/`** folder.
2. Include your workflow YAML and a screenshot/link of the successful run.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 42 • Golu & Jagu Edition*
