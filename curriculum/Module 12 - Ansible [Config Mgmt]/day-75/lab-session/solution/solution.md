# 🧪 Day 75 — Solution: End-to-End Deployment Project (Docker + Nginx)

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 0. Prerequisites

Before running this capstone project, install the required Ansible collection:

```bash
# Install community.docker collection for Docker container management
ansible-galaxy collection install community.docker
```

This collection provides the `community.docker.docker_container` and `community.docker.docker_image` modules used in the Nginx App role.

---

## ✅ 1. Project Structure

```
ansible-docker-nginx/
├── ansible.cfg
├── inventory/
│   └── hosts.ini
├── site.yml
├── roles/
│   ├── docker/
│   │   ├── tasks/
│   │   │   └── main.yml
│   │   ├── handlers/
│   │   │   └── main.yml
│   │   └── defaults/
│   │       └── main.yml
│   └── nginx-app/
│       ├── tasks/
│       │   └── main.yml
│       ├── handlers/
│       │   └── main.yml
│       ├── templates/
│       │   └── index.html.j2
│       └── defaults/
│           └── main.yml
```

---

## ✅ 2. Docker Role

### `roles/docker/tasks/main.yml`

```yaml
---
- name: Install required system packages
  ansible.builtin.apt:
    name:
      - apt-transport-https
      - ca-certificates
      - curl
      - gnupg
      - lsb-release
    state: present

- name: Add Docker GPG key
  ansible.builtin.apt_key:
    url: https://download.docker.com/linux/ubuntu/gpg
    state: present

- name: Add Docker repository
  ansible.builtin.apt_repository:
    repo: "deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ ansible_distribution_release }} stable"
    state: present

- name: Install Docker Engine
  ansible.builtin.apt:
    name:
      - docker-ce
      - docker-ce-cli
      - containerd.io
      - docker-buildx-plugin
      - docker-compose-plugin
    state: present

- name: Start and enable Docker
  ansible.builtin.service:
    name: docker
    state: started
    enabled: yes

- name: Add current user to docker group
  ansible.builtin.user:
    name: "{{ ansible_user }}"
    groups: docker
    append: yes
  notify: restart docker
```

### `roles/docker/handlers/main.yml`

```yaml
---
- name: restart docker
  ansible.builtin.service:
    name: docker
    state: restarted
```

### `roles/docker/defaults/main.yml`

```yaml
---
docker_compose_version: "v2.24.0"
docker_edition: "ce"
```

---

## ✅ 3. Nginx App Role

### `roles/nginx-app/tasks/main.yml`

```yaml
---
- name: Create app directory
  ansible.builtin.file:
    path: "{{ app_directory }}"
    state: directory
    mode: '0755'

- name: Deploy index page from template
  ansible.builtin.template:
    src: index.html.j2
    dest: "{{ app_directory }}/index.html"
    mode: '0644'
  notify: restart nginx container

- name: Pull Nginx Alpine image
  community.docker.docker_image:
    name: nginx
    tag: alpine
    source: pull

- name: Run Nginx container
  community.docker.docker_container:
    name: "{{ container_name }}"
    image: "nginx:alpine"
    state: started
    restart_policy: always
    ports:
      - "{{ nginx_host_port }}:80"
    volumes:
      - "{{ app_directory }}/index.html:/usr/share/nginx/html/index.html:ro"
    env:
      TZ: "UTC"
```

### `roles/nginx-app/handlers/main.yml`

```yaml
---
- name: restart nginx container
  community.docker.docker_container:
    name: "{{ container_name }}"
    image: nginx:alpine
    state: started
    restart_policy: always
    ports:
      - "{{ nginx_host_port }}:80"
    volumes:
      - "{{ app_directory }}/index.html:/usr/share/nginx/html/index.html:ro"
```

### `roles/nginx-app/templates/index.html.j2`

```jinja
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ site_title }}</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0c0c1d 0%, #1a1a3e 50%, #0c0c1d 100%);
            color: #ffffff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container { text-align: center; padding: 40px; }
        .logo { font-size: 5em; margin-bottom: 20px; }
        h1 { font-size: 2.8em; background: linear-gradient(45deg, #667eea, #764ba2);
             -webkit-background-clip: text; -webkit-text-fill-color: transparent; margin-bottom: 15px; }
        .subtitle { color: #a0a0c0; font-size: 1.2em; margin-bottom: 30px; }
        .info-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px;
                      max-width: 600px; margin: 30px auto; }
        .info-card { background: rgba(255,255,255,0.05); border-radius: 12px; padding: 20px;
                      border: 1px solid rgba(255,255,255,0.1); }
        .info-card .icon { font-size: 2em; margin-bottom: 10px; }
        .info-card .label { font-size: 0.85em; color: #667eea; font-weight: bold; }
        .badge { background: rgba(102, 126, 234, 0.2); padding: 8px 20px; border-radius: 50px;
                  display: inline-block; font-size: 0.9em; border: 1px solid rgba(102, 126, 234, 0.3); }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">🐳</div>
        <h1>{{ site_title }}</h1>
        <p class="subtitle">{{ site_description }}</p>
        <div class="badge">🚀 Deployed with Ansible + Docker</div>
        <div class="info-grid">
            <div class="info-card">
                <div class="icon">⚙️</div>
                <div class="label">Ansible</div>
                <div style="font-size:0.8em;margin-top:5px;color:#ccc;">Automation Engine</div>
            </div>
            <div class="info-card">
                <div class="icon">🐳</div>
                <div class="label">Docker</div>
                <div style="font-size:0.8em;margin-top:5px;color:#ccc;">Container Runtime</div>
            </div>
            <div class="info-card">
                <div class="icon">🌐</div>
                <div class="label">Nginx</div>
                <div style="font-size:0.8em;margin-top:5px;color:#ccc;">Web Server</div>
            </div>
        </div>
        <p style="margin-top: 40px; font-size: 0.9em; color: #666;">
            Host: {{ ansible_hostname }} · Deployed: {{ ansible_date_time.iso8601 }}<br>
            <small>Day 75 — Ansible Capstone · Learn DevOps in 90 Days</small>
        </p>
    </div>
</body>
</html>
```

### `roles/nginx-app/defaults/main.yml`

```yaml
---
app_directory: /opt/nginx-app
container_name: nginx-app
nginx_host_port: 8080
site_title: "Ansible + Docker Capstone"
site_description: "End-to-end automation with Ansible roles, Docker, and Nginx"
```

---

## ✅ 4. Main Playbook (`site.yml`)

```yaml
---
- name: Install Docker Engine
  hosts: all
  become: yes
  roles:
    - docker

- name: Deploy Nginx Application
  hosts: all
  become: yes
  roles:
    - role: nginx-app
      vars:
        site_title: "Welcome to {{ inventory_hostname }}"
        nginx_host_port: 8080
```

---

## ✅ 5. Inventory (`inventory/hosts.ini`)

```ini
[webservers]
server1.example.com ansible_user=ubuntu
server2.example.com ansible_user=ubuntu

[all:vars]
ansible_ssh_private_key_file=~/.ssh/id_rsa
```

---

## ✅ 6. Ansible Config (`ansible.cfg`)

```ini
[defaults]
inventory = ./inventory/hosts.ini
host_key_checking = False
remote_user = ubuntu
timeout = 30
stdout_callback = yaml
```

---

## ✅ 7. Terminal Output

```bash
# Syntax check
$ ansible-playbook --syntax-check site.yml

playbook: site.yml

# Check mode (dry-run)
$ ansible-playbook -C --diff site.yml

PLAY [Install Docker Engine] *************************************************

TASK [Gathering Facts] *******************************************************
ok: [server1.example.com]

TASK [docker : Install required system packages] ******************************
ok: [server1.example.com]

TASK [docker : Add Docker GPG key] ********************************************
changed: [server1.example.com]

TASK [docker : Add Docker repository] *****************************************
changed: [server1.example.com]

TASK [docker : Install Docker Engine] *****************************************
changed: [server1.example.com]

TASK [docker : Start and enable Docker] ***************************************
changed: [server1.example.com]

PLAY [Deploy Nginx Application] **********************************************

TASK [nginx-app : Create app directory] ***************************************
changed: [server1.example.com]

TASK [nginx-app : Deploy index page from template] ****************************
changed: [server1.example.com]

TASK [nginx-app : Pull Nginx Alpine image] ************************************
changed: [server1.example.com]

TASK [nginx-app : Run Nginx container] ****************************************
changed: [server1.example.com]

PLAY RECAP *******************************************************************
server1.example.com       : ok=10   changed=7    failed=0    skipped=0

# Apply (after successful check mode)
$ ansible-playbook site.yml

PLAY RECAP *******************************************************************
server1.example.com       : ok=10   changed=0    failed=0    skipped=0

# Verify deployment
$ curl http://server1.example.com:8080
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Welcome to server1.example.com</title>
    ...
    <h1>Welcome to server1.example.com</h1>
    ...

$ docker ps
CONTAINER ID   IMAGE          PORTS                  NAMES
abc123def456   nginx:alpine   0.0.0.0:8080->80/tcp   nginx-app
```

---

## ✅ Lessons Learned

- **Multi-role playbooks** allow separation of concerns (Docker install vs app deploy).
- **Community modules** like `community.docker` extend Ansible's capabilities.
- **Templates** make deployment content dynamic and customizable.
- **Handlers** ensure clean restarts only when configuration changes.
- The combination of **Terraform** (provisioning) + **Ansible** (configuration) is a powerful DevOps pattern.

---

## 🏆 Module 12 Complete!

You have successfully completed the Ansible Configuration Management module! You can now:
- ✅ Write Ansible playbooks and run ad-hoc commands
- ✅ Use variables, facts, conditionals, loops, and handlers
- ✅ Create reusable roles with Ansible Galaxy
- ✅ Template dynamic configs with Jinja2
- ✅ Encrypt secrets with Ansible Vault
- ✅ Automate Docker deployments end-to-end

---

*#LearnDevOpsIn90Days • Day 75 • Golu & Jagu Edition*
