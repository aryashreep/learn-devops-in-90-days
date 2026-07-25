# 🧪 Lab Session: Day 64 — First AWS Connection

**Jagu:** "Beep Boop! Golu, let's provision our infrastructure as code! Today we will verify our setups and launch environments."

## 🎯 Task Objectives
- Install Terraform on your local machine.
- Create a programmatic IAM User in AWS with AdministratorAccess.
- Configure AWS CLI credentials locally.

## 🛠️ Hands-on Challenges
1. **Install Terraform:** Verify with `terraform -version`.
2. **AWS Configure:** Run `aws configure` and input your programmatic Access Keys.
3. **Test AWS Connection:** Run `aws sts get-caller-identity` to confirm connection.
4. **Credential Isolation:** Ensure there are no hardcoded secrets in your workspaces.

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste the terminal output of `terraform -version` and `aws sts get-caller-identity`.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 64 • Golu & Jagu Edition*
