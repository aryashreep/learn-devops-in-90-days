# 🗓️ Day 75 — Capstone Project: Automate Docker & Nginx Deployment

Welcome to **Day 75**! This is the **Capstone Project** for the Ansible module. You'll use everything you've learned — inventory, playbooks, variables, conditionals, roles, templates, and handlers — to automate the deployment of Docker and Nginx on target servers.

---

## 🎯 Today's Goal
Create a complete Ansible automation that installs Docker, pulls an Nginx container, deploys a custom website, and configures the firewall — all using best practices with roles and templates.

## 🧠 Key Learnings
- **Full automation lifecycle:** From provisioning to running application.
- **Docker with Ansible:** Using `docker_container` and `docker_image` modules.
- **Multi-role design:** Separate roles for Docker, Nginx, and security.
- **End-to-end testing:** Verifying the complete deployment.

## 🧠 Pro Module
[🎓 Day 75 Pro Module: Automate Docker and Nginx Deployment](./Day75_Docker_Nginx_Project.html)

## 🧪 Hands-on Lab
👉 [Lab Session: End-to-End Deployment Project](./lab-session/task.md)

---

## 📖 Project Overview

### Architecture

```
┌─────────────────────────────────────────────┐
│              Ansible Control Node            │
│  site.yml → roles/docker → roles/nginx       │
└──────────────┬──────────────────────────────┘
               │ SSH
┌──────────────▼──────────────────────────────┐
│           Managed Node (Target Server)        │
│                                               │
│  ┌──────────┐  ┌──────────┐  ┌────────────┐ │
│  │  Docker   │  │  Nginx   │  │  Firewall  │ │
│  │  Engine   │  │  Container│  │  Config   │ │
│  └──────────┘  └──────────┘  └────────────┘ │
└───────────────────────────────────────────────┘
```

### Project Structure

```
ansible-docker-nginx/
├── inventory/
│   └── hosts.ini
├── roles/
│   ├── docker/
│   │   ├── tasks/main.yml
│   │   ├── handlers/main.yml
│   │   └── defaults/main.yml
│   └── nginx-app/
│       ├── tasks/main.yml
│       ├── templates/
│       │   └── index.html.j2
│       ├── handlers/main.yml
│       └── defaults/main.yml
├── site.yml
└── ansible.cfg
```

### Key Playbook Features

```yaml
---
- name: Install Docker Engine
  hosts: all
  become: yes
  roles:
    - docker

- name: Deploy Nginx Container
  hosts: all
  become: yes
  roles:
    - nginx-app
```

### Docker Role Tasks

```yaml
# roles/docker/tasks/main.yml
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
```

### Nginx App Role Tasks

```yaml
# roles/nginx-app/tasks/main.yml
- name: Create app directory
  ansible.builtin.file:
    path: /opt/nginx-app
    state: directory
    mode: '0755'

- name: Deploy index page from template
  ansible.builtin.template:
    src: index.html.j2
    dest: /opt/nginx-app/index.html
  notify: restart nginx container

- name: Run Nginx container
  community.docker.docker_container:
    name: nginx-app
    image: nginx:alpine
    state: started
    restart_policy: always
    ports:
      - "{{ nginx_host_port }}:80"
    volumes:
      - /opt/nginx-app/index.html:/usr/share/nginx/html/index.html:ro
```

---

## 📝 Deliverables

Your capstone submission should include:
1. **Complete project structure** with roles, inventory, and playbook
2. **Docker role** — installs and configures Docker
3. **Nginx-app role** — deploys Nginx container with custom website
4. **Template file** — Jinja2 template for the website
5. **Verification** — Show that the website is accessible

---

## ❓ Final Check

- [ ] Does your playbook run without errors?
- [ ] Is Docker installed and running?
- [ ] Is the Nginx container running?
- [ ] Can you access the custom website?
- [ ] Did you use at least one handler?
- [ ] Did you use at least one template?
- [ ] Is your code organized using roles?

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 12: Ansible [Config Mgmt]*
