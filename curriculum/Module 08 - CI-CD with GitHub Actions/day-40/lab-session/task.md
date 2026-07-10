# 🧪 Lab Session: Day 40 — YAML Basics

**Jagu:** "Beep Boop! Golu, YAML GitHub Actions ki language hai. Agar YAML nahi aati to workflow nahi likh sakte. Aaj hum YAML seekhenge — indentation se arrays tak!"

## 🎯 Task Objectives
- Understand YAML syntax: key-value pairs, lists, nested structures.
- Validate YAML files using online tools and command-line.
- Write YAML configurations for GitHub Actions workflows.

## 🛠️ Hands-on Challenges

1.  **Your First YAML:**
    - Create a file `hello.yaml` with:
    ```yaml
    name: "My First YAML"
    language: "YAML"
    is_fun: true
    version: 1.0
    ```

2.  **Lists & Nested Data:**
    - Add a list of tools:
    ```yaml
    tools:
      - Docker
      - Kubernetes
      - Terraform
      - Ansible
    ```
    - Add nested configuration:
    ```yaml
    server:
      host: "localhost"
      port: 8080
      ssl: true
      env: production
    ```

3.  **Multi-line Strings:**
    - Use `|` (literal block) and `>` (folded block):
    ```yaml
    description: |
      This is a multi-line
      string that preserves
      newlines.
    summary: >
      This is a folded string
      where newlines become
      spaces.
    ```

4.  **YAML Anchors & References:**
    ```yaml
    defaults: &defaults
      timeout: 10
      retries: 3

    job1:
      <<: *defaults
      name: "Build"

    job2:
      <<: *defaults
      name: "Test"
      timeout: 15  # override
    ```

5.  **Validate Your YAML:**
    - Run: `python3 -c "import yaml; yaml.safe_load(open('hello.yaml'))"` (install PyYAML if needed)
    - Or use an online YAML validator
    - Fix any indentation errors

---

### ✅ Proof of Work
**Jagu:** "Golu, apni YAML mastery submit karo!"

1. Create a file named **`yaml-basics.md`** in the **`solution/`** folder.
2. Include your `hello.yaml` content and the validation output.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 40 • Golu & Jagu Edition*
