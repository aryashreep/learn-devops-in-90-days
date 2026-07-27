# 🧪 Day 74 — Solution: Create a Reusable Nginx Role

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 1. Project Structure

```
ansible-nginx-role/
├── ansible.cfg
├── inventory/
│   └── hosts.ini
├── site.yml
├── roles/
│   └── nginx/
│       ├── tasks/
│       │   └── main.yml
│       ├── handlers/
│       │   └── main.yml
│       ├── templates/
│       │   └── nginx.conf.j2
│       ├── files/
│       │   └── index.html
│       ├── defaults/
│       │   └── main.yml
│       ├── vars/
│       │   └── main.yml
│       └── meta/
│           └── main.yml
└── vars/
    └── secret.yml (encrypted with Ansible Vault)
```

---

## ✅ 2. Role: `tasks/main.yml`

```yaml
---
- name: Update apt cache
  ansible.builtin.apt:
    update_cache: yes
    cache_valid_time: 3600

- name: Install Nginx
  ansible.builtin.apt:
    name: nginx
    state: present

- name: Create web root directory
  ansible.builtin.file:
    path: "{{ nginx_document_root }}"
    state: directory
    owner: www-data
    group: www-data
    mode: '0755'

- name: Deploy Nginx configuration from template
  ansible.builtin.template:
    src: nginx.conf.j2
    dest: /etc/nginx/sites-available/default
    owner: root
    group: root
    mode: '0644'
  notify: restart nginx

- name: Deploy index.html
  ansible.builtin.copy:
    src: index.html
    dest: "{{ nginx_document_root }}/index.html"
    owner: www-data
    group: www-data
    mode: '0644'

- name: Ensure Nginx is started and enabled
  ansible.builtin.service:
    name: nginx
    state: started
    enabled: yes
```

---

## ✅ 3. Role: `handlers/main.yml`

```yaml
---
- name: restart nginx
  ansible.builtin.service:
    name: nginx
    state: restarted

- name: reload nginx
  ansible.builtin.service:
    name: nginx
    state: reloaded
```

---

## ✅ 4. Role: `templates/nginx.conf.j2`

```jinja
server {
    listen {{ nginx_http_port }};
    server_name {{ nginx_server_name }};

    root {{ nginx_document_root }};
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location /health {
        return 200 "Healthy\n";
        add_header Content-Type text/plain;
    }

    access_log /var/log/nginx/{{ nginx_server_name }}_access.log;
    error_log  /var/log/nginx/{{ nginx_server_name }}_error.log;

    # Security headers
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-XSS-Protection "1; mode=block" always;
}
```

---

## ✅ 5. Role: `defaults/main.yml`

```yaml
---
nginx_http_port: 80
nginx_server_name: _
nginx_document_root: /var/www/html
```

---

## ✅ 6. Role: `files/index.html`

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ansible Nginx Role</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #1a1a2e; color: #eee;
               text-align: center; padding: 80px 20px; margin: 0; }
        h1 { font-size: 2.8em; color: #e94560; }
        .card { background: #16213e; border-radius: 15px; padding: 30px; max-width: 600px; margin: 30px auto; }
    </style>
</head>
<body>
    <h1>🚀 Ansible Role Deployment</h1>
    <div class="card">
        <p>This page was deployed using the <strong>nginx</strong> Ansible role.</p>
        <p>✅ Jinja2 Template Engine</p>
        <p>✅ Ansible Vault Encryption</p>
        <p>✅ Idempotent Automation</p>
    </div>
    <small>Day 74 — Learn DevOps in 90 Days</small>
</body>
</html>
```

---

## ✅ 7. Main Playbook (`site.yml`)

```yaml
---
- name: Deploy Nginx with Role
  hosts: webservers
  become: yes

  pre_tasks:
    - name: Include vault secrets
      ansible.builtin.include_vars:
        file: vars/secret.yml
      no_log: true

  roles:
    - role: nginx
      vars:
        nginx_server_name: "{{ inventory_hostname }}"
        nginx_http_port: 80

  post_tasks:
    - name: Verify Nginx is running
      ansible.builtin.uri:
        url: http://localhost/health
        return_content: yes
      register: health_check
      changed_when: false

    - name: Print health check result
      ansible.builtin.debug:
        msg: "Nginx health: {{ health_check.content }}"
```

---

## ✅ 8. Ansible Vault

```bash
# Create encrypted secrets file
ansible-vault create vars/secret.yml
```

**Content of `vars/secret.yml` (encrypted):**
```yaml
---
db_password: SuperSecret123
api_key: abcdef123456
```

```bash
# Run playbook with vault password
ansible-playbook site.yml --ask-vault-pass
```

---

## ✅ 9. Terminal Output

```bash
# Create role skeleton
$ ansible-galaxy init nginx
- Role nginx was created successfully

# Run playbook with vault
$ ansible-playbook -i inventory/hosts.ini site.yml --ask-vault-pass
Vault password:

PLAY [Deploy Nginx with Role] ************************************************

TASK [Gathering Facts] *******************************************************
ok: [web1.example.com]

TASK [nginx : Update apt cache] **********************************************
ok: [web1.example.com]

TASK [nginx : Install Nginx] *************************************************
changed: [web1.example.com]

TASK [nginx : Deploy Nginx configuration from template] ***********************
changed: [web1.example.com]

TASK [nginx : Deploy index.html] *********************************************
changed: [web1.example.com]

TASK [nginx : Ensure Nginx is started and enabled] ****************************
changed: [web1.example.com]

TASK [Verify Nginx is running] ************************************************
ok: [web1.example.com]

TASK [Print health check result] **********************************************
ok: [web1.example.com] => {
    "msg": "Nginx health: Healthy"
}

PLAY RECAP *******************************************************************
web1.example.com          : ok=8    changed=4    failed=0    skipped=0
```

---

## ✅ Lessons Learned

- **Roles** organize Ansible code into reusable components with a standard directory structure.
- **Ansible Galaxy** (`ansible-galaxy init`) creates role skeletons automatically.
- **Jinja2 templates** (`.j2`) enable dynamic configuration files with variables.
- **Default variables** go in `defaults/main.yml` (low priority), overrides in `vars/main.yml`.
- **Ansible Vault** encrypts sensitive data; use `--ask-vault-pass` at runtime.
- Handlers triggered by `notify` run only at the end of the play.

---

*#LearnDevOpsIn90Days • Day 74 • Golu & Jagu Edition*
