# 🧪 Lab Session: Day 67 — Migrating State to AWS S3 & DynamoDB

**Jagu:** "Beep Boop! Golu, let's provision our infrastructure as code! Today we will verify our setups and launch environments."

## 🎯 Task Objectives
- Set up remote storage bucket and locking table on AWS.
- Migrate local state database to AWS S3 backend.
- Manipulate state records via CLI commands.

## 🛠️ Hands-on Challenges
1. **AWS Infrastructure:** Create an S3 bucket (enable versioning & encryption) and a DynamoDB table with primary key `LockID`.
2. **Configure Backend:** Add the `backend "s3"` block inside your `main.tf`.
3. **Migrate:** Run `terraform init` and type `yes` to transfer local state to S3.
4. **State CLI:** Run `terraform state list` to check resources and inspect locks in DynamoDB console.

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste the terminal logs of your `terraform init` state migration success, and your `terraform state list` output.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 67 • Golu & Jagu Edition*
