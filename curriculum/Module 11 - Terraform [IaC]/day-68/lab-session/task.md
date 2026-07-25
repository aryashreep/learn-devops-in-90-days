# 🧪 Lab Session: Day 68 — Custom Reusable Web Server Module

**Jagu:** "Beep Boop! Golu, let's provision our infrastructure as code! Today we will verify our setups and launch environments."

## 🎯 Task Objectives
- Create a local module folder named `web_server`.
- Configure input variables and EC2 resources inside the module.
- Instantiate the module twice (Dev & Prod) from root `main.tf`.

## 🛠️ Hands-on Challenges
1. **Create Module:** Add folder path `modules/web_server/` containing custom `main.tf`, `variables.tf`, and `outputs.tf`.
2. **Root config:** Reference the module from your root workspace twice: one block for `dev` (micro size) and one for `prod` (medium size).
3. **Outputs:** Print the instance ID of both instances in the root outputs.
4. **Apply:** Run `terraform init` and `terraform apply`.

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste your root `main.tf` and root `outputs.tf` configs, along with the terminal output showing the outputs of the two instantiated modules.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 68 • Golu & Jagu Edition*
