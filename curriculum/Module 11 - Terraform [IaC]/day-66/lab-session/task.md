# 🧪 Lab Session: Day 66 — Parameterizing AWS EC2 Instance

**Jagu:** "Beep Boop! Golu, let's provision our infrastructure as code! Today we will verify our setups and launch environments."

## 🎯 Task Objectives
- Parameterize EC2 instance type and names via input variables.
- Fetch latest Amazon Linux 2 AMI using a data source.
- Use outputs to print the public IP and flag database secrets.

## 🛠️ Hands-on Challenges
1. **Input variables:** Write a `variables.tf` declaring `instance_type` (default = `t2.micro`) and `env`.
2. **AMI Data Source:** Add an `aws_ami` data block to search for latest Linux 2 AMI.
3. **Resource EC2:** Provision an EC2 instance with properties mapped to variables and data source AMI.
4. **Outputs:** Print `instance_public_ip` and a sensitive `db_password` secret using `sensitive = true`.

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste your `variables.tf`, `outputs.tf` and the terminal display showing the public IP (and hidden sensitive value) after running `terraform apply`.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 66 • Golu & Jagu Edition*
