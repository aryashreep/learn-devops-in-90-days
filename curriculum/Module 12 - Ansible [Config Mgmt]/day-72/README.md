# 🗓️ Day 72 — Ansible Playbooks and Modules

Welcome to **Day 72**! Today we move from ad-hoc commands to writing **playbooks** — the heart of Ansible automation. Playbooks are YAML files that define declarative automation workflows.

---

## 🎯 Today's Goal
Write your first Ansible playbook, understand YAML syntax, and use core modules for file management, package installation, and service management.

## 🧠 Key Learnings
- **Playbook Structure:** Plays, hosts, tasks, and variables.
- **YAML Syntax:** Indentation, lists, dictionaries, and data types.
- **Core Modules:** `apt`, `yum`, `copy`, `file`, `service`, `debug`.
- **Idempotency:** How Ansible ensures tasks run safely multiple times.

## 🧠 Pro Module
[🎓 Day 72 Pro Module: Ansible Playbooks and Modules](./Day72_Playbooks_Modules.html)

## 🧪 Hands-on Lab
👉 [Lab Session: First Playbook — Deploy Nginx](./lab-session/task.md)

---

## 📖 Key Concepts

### Playbook Anatomy

A playbook contains one or more **plays**, each targeting a group of hosts with a list of **tasks**:

```yaml
---
- name: Configure Web Servers
  hosts: webservers
  become: yes
  vars:
    http_port: 80
    max_clients: 200

  tasks:
    - name: Install Nginx
      ansible.builtin.apt:
        name: nginx
        state: present

    - name: Start Nginx service
      ansible.builtin.service:
        name: nginx
        state: started
        enabled: yes
```

### Key Playbook Elements

| Element | Description |
|---|---|
| `name` | Human-readable description of the play or task |
| `hosts` | Target host group from inventory |
| `become` | Elevate privileges (sudo) |
| `vars` | Variables used within the play |
| `tasks` | Ordered list of actions to execute |
| `handlers` | Special tasks triggered by `notify` |

### Core Modules Deep Dive

**Package Management:**
```yaml
- name: Install packages (Debian)
  ansible.builtin.apt:
    name: 
      - nginx
      - git
      - curl
    state: present  # present, latest, absent

- name: Install packages (RHEL)
  ansible.builtin.yum:
    name: httpd
    state: latest
```

**File Management:**
```yaml
- name: Create directory
  ansible.builtin.file:
    path: /var/www/html
    state: directory
    owner: www-data
    mode: '0755'

- name: Copy file
  ansible.builtin.copy:
    src: ./index.html
    dest: /var/www/html/index.html
    owner: www-data
    mode: '0644'
```

### Running Playbooks

```bash
# Basic execution
ansible-playbook site.yml

# Check mode (dry-run)
ansible-playbook -C site.yml

# Verbose mode
ansible-playbook -v site.yml   # -vvv for more detail

# Syntax check
ansible-playbook --syntax-check site.yml

# Limit to specific hosts
ansible-playbook site.yml --limit web1.example.com
```

---

## ❓ Mini Quiz

1. **What does `become: yes` do in a playbook?**
   - a) Runs tasks as a background process
   - b) Elevates privileges (sudo)
   - c) Makes the playbook executable
   - d) Creates a backup before changes

2. **Which module ensures a package is installed?**
   - a) `package`
   - b) `install`
   - c) `apt` / `yum`
   - d) `setup`

3. **What flag runs a playbook in check mode?**
   - a) `--check`
   - b) `--dry-run`
   - c) `--test`
   - d) `--preview`

**Answers:** 1-b | 2-c | 3-a

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 12: Ansible [Config Mgmt]*
