# 🧪 Lab Session: Day 65 — Docker Nginx and Local File Blocks

**Jagu:** "Beep Boop! Golu, let's provision our infrastructure as code! Today we will verify our setups and launch environments."

## 🎯 Task Objectives
- Initialize Docker provider on local host.
- Declare Nginx container resource and local file resource.
- Order execution so local file block must resolve first.

## 🛠️ Hands-on Challenges
1. **Create config:** Write a `main.tf` with a `docker_image` and a `docker_container` running Nginx.
2. **Create local_file:** Add a resource block creating a file named `/tmp/nginx_health.txt` containing health checks.
3. **Explicit dependency:** Make the container block explicitly depend on the local file block using `depends_on = [local_file.pet]`.
4. **Apply:** Run `terraform init` and `terraform apply`.

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste your `main.tf` contents and the terminal output of `docker ps` after `terraform apply`.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 65 • Golu & Jagu Edition*
