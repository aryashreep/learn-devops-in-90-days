# 🧪 Lab Session: Day 70 — Multi-Environment Workspace Capstone

**Jagu:** "Beep Boop! Golu, let's provision our infrastructure as code! Today we will verify our setups and launch environments."

## 🎯 Task Objectives
- Create 'dev' and 'prod' workspaces locally.
- Implement HCL code that selects instance counts and naming tags dynamically based on active workspace.
- Test env switching and verify state separation on S3 bucket.

## 🛠️ Hands-on Challenges
1. **Create Workspaces:** Run `terraform workspace new dev` and `terraform workspace new prod`.
2. **Dynamic variables:** Set up locals mapping `dev` to 1 instance (t2.micro) and `prod` to 2 instances (t2.small).
3. **Dynamic resource:** Write a main block where `instance_type` and count are dynamically assigned using `local.instance_type` and `terraform.workspace`.
4. **Switch & apply:** Select `dev`, apply changes. Select `prod`, apply changes. Verify S3 bucket contains keys under `env:/`.

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste output of `terraform workspace list` and terminal logs showing resource count changes when switching from dev to prod workspace.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 70 • Golu & Jagu Edition*
