# ⚙️ Ansible CLI Cheatsheet

## 🚀 Essential Commands

| Command | Description |
|---|---|
| `ansible --version` | Display Ansible version and configuration |
| `ansible <host-pattern> -m <module> -a "<args>"` | Run an ad-hoc command |
| `ansible all -m ping` | Test connectivity to all managed hosts |
| `ansible-playbook <playbook>.yml` | Execute a playbook |
| `ansible-galaxy init <role-name>` | Create a new role skeleton |
| `ansible-galaxy install <author.role>` | Install a role from Galaxy |
| `ansible-vault encrypt <file>` | Encrypt a file with Ansible Vault |
| `ansible-vault decrypt <file>` | Decrypt a vault-encrypted file |
| `ansible-vault edit <file>` | Edit an encrypted file in-place |
| `ansible-vault create <file>` | Create a new encrypted file |
| `ansible-inventory --list` | Display inventory as JSON |
| `ansible-inventory --graph` | Display inventory as graph |
| `ansible-doc -l` | List available modules |
| `ansible-doc <module-name>` | Show documentation for a module |
| `ansible-config list` | List all config options |
| `ansible-pull` | Pull playbooks from a VCS repo and execute |

## 📁 Inventory Formats

### INI Format (`hosts.ini`)
```ini
[webservers]
web1.example.com
web2.example.com ansible_user=ubuntu

[databases]
db1.example.com
db2.example.com

[all:vars]
ansible_user=admin
ansible_ssh_private_key_file=~/.ssh/id_rsa
```

### YAML Format (`hosts.yml`)
```yaml
all:
  children:
    webservers:
      hosts:
        web1.example.com:
          ansible_user: ubuntu
        web2.example.com:
    databases:
      hosts:
        db1.example.com:
        db2.example.com:
    monitoring:
      hosts:
        monitor.example.com:
```

## 📝 Playbook Structure

```yaml
---
- name: Deploy Web Application
  hosts: webservers
  become: yes
  vars:
    app_port: 8080
    app_version: "1.2.3"

  tasks:
    - name: Install Nginx
      ansible.builtin.apt:
        name: nginx
        state: present

    - name: Copy configuration
      ansible.builtin.template:
        src: nginx.conf.j2
        dest: /etc/nginx/nginx.conf
      notify: restart nginx

    - name: Start service
      ansible.builtin.service:
        name: nginx
        state: started
        enabled: yes

  handlers:
    - name: restart nginx
      ansible.builtin.service:
        name: nginx
        state: restarted
```

## 🔧 Common Modules

| Module | Purpose |
|---|---|
| `ansible.builtin.ping` | Test connectivity to managed nodes |
| `ansible.builtin.apt` / `ansible.builtin.yum` | Package management (Debian/RHEL) |
| `ansible.builtin.copy` | Copy files from control to managed nodes |
| `ansible.builtin.template` | Deploy Jinja2 templated files |
| `ansible.builtin.file` | Manage file permissions, ownership, directories |
| `ansible.builtin.service` | Manage systemd/init services |
| `ansible.builtin.user` | Manage user accounts |
| `ansible.builtin.command` | Execute arbitrary commands |
| `ansible.builtin.shell` | Execute commands via shell |
| `ansible.builtin.debug` | Print variables/messages for debugging |
| `ansible.builtin.get_url` | Download files from URLs |
| `ansible.builtin.unarchive` | Extract compressed archives |
| `ansible.builtin.docker_container` | Manage Docker containers |
| `ansible.builtin.docker_image` | Manage Docker images |
| `ansible.builtin.uri` | Interact with HTTP/HTTPS APIs |

## 🔁 Conditionals & Loops

```yaml
# Conditional (when)
- name: Install on RedHat only
  ansible.builtin.yum:
    name: httpd
    state: present
  when: ansible_os_family == "RedHat"

# Loop over items
- name: Create multiple users
  ansible.builtin.user:
    name: "{{ item }}"
    state: present
  loop:
    - alice
    - bob
    - charlie

# Loop with dict
- name: Configure users with specific UIDs
  ansible.builtin.user:
    name: "{{ item.name }}"
    uid: "{{ item.uid }}"
  loop:
    - { name: alice, uid: 1001 }
    - { name: bob, uid: 1002 }
```

## 📂 Role Directory Structure

```
roles/
└── webserver/
    ├── tasks/
    │   └── main.yml
    ├── handlers/
    │   └── main.yml
    ├── templates/
    │   └── nginx.conf.j2
    ├── files/
    │   └── index.html
    ├── vars/
    │   └── main.yml
    ├── defaults/
    │   └── main.yml
    ├── meta/
    │   └── main.yml
    └── README.md
```

## 🔐 Ansible Vault Usage

```bash
# Create encrypted file
ansible-vault create secrets.yml

# Encrypt existing file
ansible-vault encrypt vars/prod.yml

# Run playbook with vault password
ansible-playbook site.yml --ask-vault-pass

# Run with vault password file
ansible-playbook site.yml --vault-password-file ~/.vault_pass

# View encrypted file content
ansible-vault view secrets.yml
```

## 🧪 Jinja2 Template Example (`nginx.conf.j2`)

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

## 🛠️ Checking & Testing

| Command | Description |
|---|---|
| `ansible-playbook --syntax-check playbook.yml` | Check YAML syntax |
| `ansible-playbook -C playbook.yml` | Dry-run (check mode) |
| `ansible-playbook --diff playbook.yml` | Show file changes |
| `ansible-playbook -v playbook.yml` | Verbose output (-vvv for more) |
| `ansible-playbook --step playbook.yml` | Step through tasks interactively |
| `ansible-playbook --start-at-task "Task Name"` | Start from a specific task |

## Best Practices

- Use FQCNs (e.g., `ansible.builtin.copy` instead of just `copy`)
- Always set `become: yes` explicitly when root is needed
- Keep secrets in Ansible Vault, never in plain text
- Use roles for reusable, modular automation
- Test playbooks with `--check` and `--diff` before production
- Organize inventory by environment (dev, staging, prod)
- Use `ansible-doc` to explore module options
- Leverage dynamic inventory for cloud environments
- Pin Ansible and collection versions for reproducibility
