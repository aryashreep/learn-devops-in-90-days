# 🧪 Lab Session: Day 72 — First Playbook — Deploy Nginx

**Jagu:** "Beep Boop! Golu, let's write our first Ansible playbook to deploy Nginx on web servers!"

## 🎯 Task Objectives
- Write a playbook that installs and configures Nginx.
- Use `copy`, `file`, `service`, and `debug` modules.
- Run the playbook in check mode first, then apply.

## 🛠️ Hands-on Challenges

1. **Create a playbook** named `deploy-nginx.yml`:
   - Target: `webservers` group
   - Become: yes
   - Tasks:
     - Install `nginx` package
     - Create directory `/var/www/html` with mode `0755`
     - Copy an `index.html` file to `/var/www/html/index.html`
     - Start and enable Nginx service

2. **Create an index.html** file with a simple "Hello from Ansible!" message.

3. **Run the playbook:**
   ```bash
   # Syntax check first
   ansible-playbook --syntax-check deploy-nginx.yml
   
   # Check mode (dry-run)
   ansible-playbook -C --diff deploy-nginx.yml
   
   # Apply
   ansible-playbook deploy-nginx.yml
   ```

4. **Verify:**
   ```bash
   curl http://<server-ip>
   ```

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste your `deploy-nginx.yml` and `index.html` contents.
3. Include terminal output showing the playbook run (with changed/failed counts).
4. Commit and push!

---

*#LearnDevOpsIn90Days • Day 72 • Golu & Jagu Edition*
