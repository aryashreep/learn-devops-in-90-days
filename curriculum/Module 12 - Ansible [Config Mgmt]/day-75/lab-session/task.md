# 🧪 Lab Session: Day 75 — End-to-End Deployment Project

**Jagu:** "Beep Boop! Golu, it's time to put it all together! Let's automate the complete deployment of Docker + Nginx using Ansible roles!"

## 🎯 Task Objectives
- Create a multi-role Ansible project.
- Automate Docker installation.
- Deploy an Nginx container with a custom website.
- Use templates, handlers, and variables.

## 🛠️ Hands-on Challenges

### Part 1: Project Setup
1. Create the project structure:
   ```
   ansible-docker-nginx/
   ├── inventory/
   │   └── hosts.ini
   ├── roles/
   │   ├── docker/
   │   └── nginx-app/
   ├── site.yml
   └── ansible.cfg
   ```

### Part 2: Docker Role
1. Use `ansible-galaxy init docker` inside roles/
2. Implement tasks to:
   - Install Docker dependencies
   - Add Docker repository
   - Install Docker Engine
   - Start and enable Docker service

### Part 3: Nginx App Role
1. Use `ansible-galaxy init nginx-app` inside roles/
2. Implement tasks to:
   - Create app directory
   - Deploy `index.html.j2` template
   - Run Nginx container with port mapping
3. Create the Jinja2 template
4. Add a handler to restart container on config change

### Part 4: Main Playbook
1. Create `site.yml` that calls both roles
2. Create `hosts.ini` with your target servers
3. Create `ansible.cfg` with defaults

### Part 5: Deploy and Verify
```bash
# Syntax check
ansible-playbook --syntax-check site.yml

# Dry-run
ansible-playbook -C --diff site.yml

# Apply
ansible-playbook site.yml

# Verify
curl http://<server-ip>:8080
```

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste your complete project structure (tree output).
3. Include key files: `site.yml`, role tasks, and the template.
4. Show terminal output of successful deployment and `curl` result.
5. Commit and push!

---

*#LearnDevOpsIn90Days • Day 75 • Golu & Jagu Edition*
