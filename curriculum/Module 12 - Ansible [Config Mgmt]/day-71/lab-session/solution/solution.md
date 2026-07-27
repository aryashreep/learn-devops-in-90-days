# 🧪 Day 71 — Solution: First Ansible Inventory & Ad-Hoc Commands

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 1. Ansible Installation

```bash
# Install Ansible
sudo apt update && sudo apt install -y ansible

# Verify installation
ansible --version
```

**Expected Output:**
```
ansible [core 2.14.x]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/user/.ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ...
```

---

## ✅ 2. Inventory File (`hosts.ini`)

```ini
[webservers]
web1.example.com ansible_user=ubuntu
web2.example.com ansible_user=ubuntu

[databases]
db1.example.com ansible_user=admin

[monitoring]
monitor.example.com

[all:vars]
ansible_ssh_private_key_file=~/.ssh/id_rsa
ansible_python_interpreter=/usr/bin/python3
```

---

## ✅ 3. Ansible Configuration (`ansible.cfg`)

```ini
[defaults]
inventory = ./hosts.ini
host_key_checking = False
remote_user = ubuntu
timeout = 30
```

---

## ✅ 4. Test Connectivity

```bash
ansible all -m ping
```

**Expected Output:**
```
web1.example.com | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
web2.example.com | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
db1.example.com | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

---

## ✅ 5. Ad-Hoc Commands

### System Uptime
```bash
ansible all -m command -a "uptime"
```

**Expected Output:**
```
web1.example.com | CHANGED | rc=0 >>
 10:30:45 up 3 days,  2:15,  1 user,  load average: 0.08, 0.03, 0.01
```

### Distribution Info
```bash
ansible all -m setup -a "filter=ansible_distribution*"
```

**Expected Output:**
```
web1.example.com | SUCCESS => {
    "ansible_facts": {
        "ansible_distribution": "Ubuntu",
        "ansible_distribution_file_parsed": true,
        "ansible_distribution_file_path": "/etc/os-release",
        "ansible_distribution_major_version": "22",
        "ansible_distribution_release": "jammy",
        "ansible_distribution_version": "22.04"
    },
    "changed": false
}
```

### Disk Space
```bash
ansible all -m command -a "df -h"
```

**Expected Output:**
```
web1.example.com | CHANGED | rc=0 >>
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        20G   5G   15G  25% /
```

---

## ✅ Lessons Learned

- Ansible uses an **agentless push model** over SSH — no agents needed on managed nodes.
- The **inventory file** is the source of truth for which hosts to manage.
- **Ad-hoc commands** are great for quick, one-off automation tasks.
- The `ping` module tests connectivity; `setup` gathers system facts.
- Using `ansible.cfg` helps organize project-level settings.

---

*#LearnDevOpsIn90Days • Day 71 • Golu & Jagu Edition*
