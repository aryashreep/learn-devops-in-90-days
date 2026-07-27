# 🧪 Lab Session: Day 71 — First Ansible Inventory & Ad-Hoc Commands

**Jagu:** "Beep Boop! Golu, let's set up your first Ansible control node and automate your servers!"

## 🎯 Task Objectives
- Install Ansible on your local machine (control node).
- Create a static inventory file with host groups.
- Run ad-hoc commands against managed nodes.

## 🛠️ Hands-on Challenges

1. **Install Ansible:**
   ```bash
   sudo apt update && sudo apt install -y ansible
   ansible --version
   ```

2. **Create an inventory file** named `hosts.ini` with at least two groups:
   - `[webservers]` — list 2 hosts (can use `localhost` or test VMs)
   - `[databases]` — list 1 host
   - Set the `ansible_user` variable in `[all:vars]`

3. **Test connectivity:**
   ```bash
   ansible all -i hosts.ini -m ping
   ```

4. **Run ad-hoc commands:**
   - Check system uptime on all hosts
   - Gather distribution info using the `setup` module
   - Run a shell command to check disk space

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste your `hosts.ini` content and the terminal outputs of:
   - `ansible all -m ping`
   - `ansible all -m setup -a "filter=ansible_distribution*"`
   - `ansible all -m command -a "df -h"`
3. Commit and push!

---

*#LearnDevOpsIn90Days • Day 71 • Golu & Jagu Edition*
