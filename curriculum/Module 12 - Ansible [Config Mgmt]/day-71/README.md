# 🗓️ Day 71 — Introduction to Ansible and Inventory Setup

Welcome to **Day 71**! Today we begin the module **Ansible [Configuration Management]**. We'll understand what Ansible is, how its agentless architecture works, install it, and set up our first inventory.

---

## 🎯 Today's Goal
Understand Ansible's architecture, install the control node, create static inventory files, and run ad-hoc commands against managed nodes.

## 🧠 Key Learnings
- **Agentless Architecture:** How Ansible uses SSH/WinRM instead of agents.
- **Control Node vs Managed Nodes:** The master-less push model.
- **Inventory:** Static YAML/INI inventory files with host groups.
- **Ad-Hoc Commands:** Quick automation with `ansible` CLI.
- **Modules:** Understanding the `ping`, `command`, `shell`, and `setup` modules.

## 🧠 Pro Module
[🎓 Day 71 Pro Module: Introduction to Ansible and Inventory Setup](./Day71_Ansible_Intro.html)

## 🧪 Hands-on Lab
👉 [Lab Session: First Ansible Inventory & Ad-Hoc Commands](./lab-session/task.md)

---

## 📖 Key Concepts

### Ansible Architecture

Ansible follows a **push-based, agentless** architecture:
- **Control Node:** The machine where Ansible is installed (your laptop or CI server).
- **Managed Nodes:** Target servers that Ansible manages over SSH (Linux) or WinRM (Windows).
- **No Agents Required:** Managed nodes only need Python and SSH — no extra software to install!

```
┌─────────────┐      SSH       ┌──────────────┐
│  Control     │ ────────────→ │  Managed      │
│  Node        │               │  Node 1       │
│  (Ansible)   │      SSH       ├──────────────┤
│              │ ────────────→ │  Managed      │
└─────────────┘               │  Node 2       │
                              └──────────────┘
```

### Comparing Ansible vs Other Tools

| Feature | Ansible | Chef/Puppet | Terraform |
|---|---|---|---|
| Architecture | Agentless (SSH) | Agent-based | API-based |
| Language | YAML | Ruby DSL | HCL |
| Primary Use | Config Management | Config Management | Infrastructure Provisioning |
| State Model | Procedural/Idempotent | Declarative | Declarative |
| Learning Curve | Low (YAML) | High | Medium |

### Installing Ansible on Ubuntu

```bash
# Update package list
sudo apt update

# Install Ansible from official PPA
sudo apt install -y ansible

# Verify installation
ansible --version

# Check config file location
ansible-config list | grep CONFIG_FILE
```

### Understanding `ansible.cfg`

The configuration file determines how Ansible behaves:

```ini
[defaults]
inventory = ./hosts.ini
host_key_checking = False
remote_user = ubuntu
private_key_file = ~/.ssh/id_rsa
timeout = 30
```

### Ad-Hoc Commands

Ad-hoc commands let you run quick tasks without writing playbooks:

```bash
# Test connectivity to all hosts
ansible all -m ping

# Run a command on webservers group
ansible webservers -m command -a "uptime"

# Gather system facts
ansible all -m setup -a "filter=ansible_distribution*"

# Install a package
ansible all -m apt -a "name=nginx state=present" --become
```

---

## ❓ Mini Quiz

1. **What protocol does Ansible use by default to connect to Linux managed nodes?**
   - a) HTTPS
   - b) SSH
   - c) Telnet
   - d) RDP

2. **Which file holds the list of managed nodes?**
   - a) ansible.cfg
   - b) playbook.yml
   - c) inventory (hosts) file
   - d) vault.yml

3. **What is the simplest ad-hoc module to test connectivity?**
   - a) shell
   - b) ping
   - c) command
   - d) debug

**Answers:** 1-b | 2-c | 3-b

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 12: Ansible [Config Mgmt]*
