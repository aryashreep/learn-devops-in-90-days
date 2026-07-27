# 🗓️ Day 74 — Roles, Galaxy, Templates and Vault

Welcome to **Day 74**! Today we level up our Ansible automation by organizing code into **roles**, using **Ansible Galaxy** for community roles, leveraging **Jinja2 templates** for dynamic configs, and securing secrets with **Ansible Vault**.

---

## 🎯 Today's Goal
Structure Ansible code using roles, download community roles from Galaxy, create dynamic configuration files with Jinja2 templates, and encrypt sensitive data with Ansible Vault.

## 🧠 Key Learnings
- **Roles:** Directory structure, why roles matter, creating reusable automation.
- **Ansible Galaxy:** Downloading and using community roles.
- **Jinja2 Templates:** Dynamic config generation with variables and filters.
- **Ansible Vault:** Encrypting and managing secrets.

## 🧠 Pro Module
[🎓 Day 74 Pro Module: Roles, Galaxy, Templates and Vault](./Day74_Roles_Galaxy_Vault.html)

## 🧪 Hands-on Lab
👉 [Lab Session: Create a Reusable Nginx Role](./lab-session/task.md)

---

## 📖 Key Concepts

### Role Directory Structure

```
roles/
└── nginx/
    ├── tasks/
    │   └── main.yml          # Main list of tasks
    ├── handlers/
    │   └── main.yml          # Handlers
    ├── templates/
    │   └── nginx.conf.j2     # Jinja2 templates
    ├── files/
    │   └── index.html        # Static files to copy
    ├── vars/
    │   └── main.yml          # High-priority variables
    ├── defaults/
    │   └── main.yml          # Default variables (low priority)
    ├── meta/
    │   └── main.yml          # Role metadata, dependencies
    └── README.md             # Role documentation
```

### Creating Roles Manually

```bash
# Using ansible-galaxy to create a role skeleton
ansible-galaxy init nginx
```

This creates the entire directory structure automatically.

### Using a Role in a Playbook

```yaml
---
- name: Apply Nginx role
  hosts: webservers
  become: yes

  roles:
    - nginx
```

With variables:
```yaml
roles:
  - role: nginx
    vars:
      http_port: 8080
      server_name: example.com
```

### Ansible Galaxy

```bash
# Search for roles
ansible-galaxy search nginx

# Install a role from Galaxy
ansible-galaxy install geerlingguy.nginx

# Install from requirements file
ansible-galaxy install -r requirements.yml

# List installed roles
ansible-galaxy list

# Remove a role
ansible-galaxy remove geerlingguy.nginx
```

### `requirements.yml`

```yaml
---
roles:
  - name: geerlingguy.nginx
    version: 3.1.4
  - name: geerlingguy.docker
    version: 7.1.0

collections:
  - name: community.docker
    version: 3.4.0
```

### Jinja2 Templates

Template files use the `.j2` extension and support Jinja2 syntax:

**Template (`templates/nginx.conf.j2`):**
```jinja
server {
    listen {{ http_port }};
    server_name {{ server_name }};
    
    location / {
        root {{ document_root }};
        index index.html;
    }
    
    location /health {
        return 200 "Healthy\n";
    }
}
```

**Using the template:**
```yaml
- name: Deploy Nginx config
  ansible.builtin.template:
    src: nginx.conf.j2
    dest: /etc/nginx/nginx.conf
  notify: restart nginx
```

### Ansible Vault

```bash
# Create a new encrypted file
ansible-vault create secrets.yml

# Encrypt an existing file
ansible-vault encrypt vars/prod.yml

# View encrypted file
ansible-vault view secrets.yml

# Edit encrypted file
ansible-vault edit secrets.yml

# Decrypt a file
ansible-vault decrypt secrets.yml

# Run playbook with vault
ansible-playbook site.yml --ask-vault-pass

# Use vault password file
ansible-playbook site.yml --vault-password-file ~/.vault_pass
```

---

## ❓ Mini Quiz

1. **Which tool creates a role skeleton?**
   - a) `ansible-role init`
   - b) `ansible-galaxy init`
   - c) `ansible-new role`
   - d) `ansible-create role`

2. **What file extension do Ansible templates use?**
   - a) `.tmpl`
   - b) `.j2`
   - c) `.template`
   - d) `.ansible`

3. **What command encrypts a file with Ansible Vault?**
   - a) `ansible-vault encrypt`
   - b) `ansible-vault lock`
   - c) `ansible encrypt`
   - d) `ansible-secure encrypt`

**Answers:** 1-b | 2-b | 3-a

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 12: Ansible [Config Mgmt]*
