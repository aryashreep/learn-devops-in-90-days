# 🧪 Lab Session: Day 74 — Create a Reusable Nginx Role

**Jagu:** "Beep Boop! Golu, let's turn our Nginx playbook into a reusable role that we can share!"

## 🎯 Task Objectives
- Create an Nginx role with proper directory structure.
- Use Jinja2 templates for dynamic configuration.
- Encrypt a sensitive variable with Ansible Vault.

## 🛠️ Hands-on Challenges

1. **Create an Nginx role:**
   ```bash
   ansible-galaxy init nginx
   ```

2. **Populate the role:**
   - `tasks/main.yml` — Install Nginx, create web root, deploy config, start service
   - `handlers/main.yml` — Restart and reload Nginx
   - `templates/nginx.conf.j2` — Template with variables (server_name, http_port)
   - `defaults/main.yml` — Default variable values
   - `files/index.html` — A simple HTML page

3. **Create a playbook that uses the role:**
   ```yaml
   - name: Deploy Nginx with role
     hosts: webservers
     become: yes
     roles:
       - nginx
   ```

4. **Encrypt a secret with Vault:**
   ```bash
   ansible-vault create vars/secret.yml
   # Add: db_password: SuperSecret123
   ```

5. **Run the playbook:**
   ```bash
   ansible-playbook site.yml --ask-vault-pass
   ```

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste your role's `tasks/main.yml`, `templates/nginx.conf.j2`, and the playbook content.
3. Include terminal output showing the role execution.
4. Commit and push!

---

*#LearnDevOpsIn90Days • Day 74 • Golu & Jagu Edition*
