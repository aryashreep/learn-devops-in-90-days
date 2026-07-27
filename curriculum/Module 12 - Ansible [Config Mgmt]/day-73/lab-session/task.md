# 🧪 Lab Session: Day 73 — Multi-OS Web Server Setup

**Jagu:** "Beep Boop! Golu, let's write a smart playbook that works on both Debian and RedHat systems!"

## 🎯 Task Objectives
- Use Ansible facts to detect OS family.
- Use conditionals to install different packages per OS.
- Use loops to install multiple packages.
- Implement a handler to restart services on config changes.

## 🛠️ Hands-on Challenges

1. **Create a playbook** named `multi-os-webserver.yml` that:
   - Gathers facts automatically
   - Uses `when` to conditionally install:
     - `apache2` on Debian/Ubuntu
     - `httpd` on RedHat/CentOS
   - Uses `loop` to install 3 additional packages (git, curl, htop)
   - Creates a custom `index.html` using `copy`
   - Handles service restart on config changes

2. **Run the playbook:**
   ```bash
   ansible-playbook --syntax-check multi-os-webserver.yml
   ansible-playbook -C --diff multi-os-webserver.yml
   ansible-playbook multi-os-webserver.yml
   ```

3. **Verify:**
   ```bash
   curl http://<server-ip>
   ```

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste your `multi-os-webserver.yml` content.
3. Include terminal output showing the playbook adapting to different OS families.
4. Commit and push!

---

*#LearnDevOpsIn90Days • Day 73 • Golu & Jagu Edition*
