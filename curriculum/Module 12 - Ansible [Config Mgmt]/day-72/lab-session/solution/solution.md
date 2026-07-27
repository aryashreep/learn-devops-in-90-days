# 🧪 Day 72 — Solution: First Playbook — Deploy Nginx

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 1. Playbook (`deploy-nginx.yml`)

```yaml
---
- name: Deploy Nginx Web Server
  hosts: webservers
  become: yes
  vars:
    web_root: /var/www/html
    nginx_port: 80

  tasks:
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
        path: "{{ web_root }}"
        state: directory
        owner: www-data
        group: www-data
        mode: '0755'

    - name: Deploy index.html
      ansible.builtin.copy:
        src: index.html
        dest: "{{ web_root }}/index.html"
        owner: www-data
        group: www-data
        mode: '0644'

    - name: Start and enable Nginx
      ansible.builtin.service:
        name: nginx
        state: started
        enabled: yes

    - name: Verify Nginx is responding
      ansible.builtin.uri:
        url: http://localhost
        return_content: yes
        status_code: 200
      register: nginx_check
      changed_when: false

    - name: Print Nginx status
      ansible.builtin.debug:
        msg: "Nginx is running — HTTP 200 OK"
        verbosity: 0
```

---

## ✅ 2. Web Page (`index.html`)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deployed with Ansible!</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-align: center;
            padding: 100px 20px;
            margin: 0;
        }
        h1 { font-size: 3em; margin-bottom: 20px; }
        .badge {
            background: rgba(255,255,255,0.2);
            padding: 10px 25px;
            border-radius: 50px;
            display: inline-block;
            font-size: 1.2em;
        }
    </style>
</head>
<body>
    <h1>🚀 Hello from Ansible!</h1>
    <div class="badge">Deployed with Ansible Playbooks</div>
    <p style="margin-top: 40px; font-size: 1.2em;">
        This page was automatically deployed using Ansible<br>
        <small>Day 72 — Learn DevOps in 90 Days</small>
    </p>
</body>
</html>
```

---

## ✅ 3. Terminal Output

```bash
# Syntax check
$ ansible-playbook --syntax-check deploy-nginx.yml

playbook: deploy-nginx.yml

# Check mode (dry-run)
$ ansible-playbook -C --diff deploy-nginx.yml

PLAY [Deploy Nginx Web Server] ***********************************************

TASK [Gathering Facts] *******************************************************
ok: [web1.example.com]

TASK [Update apt cache] ******************************************************
ok: [web1.example.com]

TASK [Install Nginx] *********************************************************
changed: [web1.example.com]

TASK [Create web root directory] *********************************************
ok: [web1.example.com]

TASK [Deploy index.html] *****************************************************
changed: [web1.example.com]

--- before: /var/www/html/index.html
+++ after: /var/www/html/index.html
@@ -0,0 +1,32 @@
+<!DOCTYPE html>
+<html lang="en">
...

TASK [Start and enable Nginx] ************************************************
ok: [web1.example.com]

PLAY RECAP *******************************************************************
web1.example.com          : ok=6    changed=2    failed=0    skipped=0

# Apply the playbook
$ ansible-playbook deploy-nginx.yml

PLAY RECAP *******************************************************************
web1.example.com          : ok=6    changed=0    failed=0    skipped=0

# Verify
$ curl http://web1.example.com
<!DOCTYPE html>
<html lang="en">
...
<h1>🚀 Hello from Ansible!</h1>
...
```

---

## ✅ Lessons Learned

- **Playbooks** are YAML files that define the desired state of infrastructure.
- **Idempotency** — running the playbook multiple times yields the same result (no unexpected changes).
- Key modules: `apt` (packages), `file` (directories), `copy` (files), `service` (services), `debug` (logging).
- Always use `--syntax-check` and `-C --diff` before applying to production.

---

*#LearnDevOpsIn90Days • Day 72 • Golu & Jagu Edition*
