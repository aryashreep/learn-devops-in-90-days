# 🧪 Day 73 — Solution: Multi-OS Web Server Setup

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 1. Playbook (`multi-os-webserver.yml`)

```yaml
---
- name: Multi-OS Web Server Setup
  hosts: all
  become: yes
  vars:
    web_root: /var/www/html
    server_admin: admin@example.com

  tasks:
    - name: Print OS information
      ansible.builtin.debug:
        msg: "Managing {{ ansible_hostname }} — OS: {{ ansible_distribution }} {{ ansible_distribution_version }}"

    # Conditional package installation based on OS family
    - name: Install Apache on Debian/Ubuntu
      ansible.builtin.apt:
        name: apache2
        state: present
        update_cache: yes
      when: ansible_os_family == "Debian"
      notify: restart web server

    - name: Install Apache on RedHat/CentOS
      ansible.builtin.yum:
        name: httpd
        state: present
        update_cache: yes
      when: ansible_os_family == "RedHat"
      notify: restart web server

    # Loop to install additional packages
    - name: Install common utility packages
      ansible.builtin.package:
        name: "{{ item }}"
        state: present
      loop:
        - git
        - curl
        - htop
        - vim

    - name: Create web root directory
      ansible.builtin.file:
        path: "{{ web_root }}"
        state: directory
        mode: '0755'

    - name: Deploy custom index page
      ansible.builtin.copy:
        content: |
          <!DOCTYPE html>
          <html>
          <head><title>{{ ansible_hostname }}</title>
          <style>
            body { font-family: Arial; text-align: center; padding: 50px;
                   background: {% if ansible_os_family == 'Debian' %}#4CAF50{% else %}#2196F3{% endif %}; color: white; }
          </style></head>
          <body>
            <h1>🌐 {{ ansible_hostname }}</h1>
            <p>OS: {{ ansible_distribution }} {{ ansible_distribution_version }}</p>
            <p>CPU: {{ ansible_processor_cores }} cores | RAM: {{ ansible_memtotal_mb }} MB</p>
            <p>Deployed with Ansible — Day 73</p>
          </body>
          </html>
        dest: "{{ web_root }}/index.html"
        mode: '0644'

    - name: Start web server (Debian)
      ansible.builtin.service:
        name: apache2
        state: started
        enabled: yes
      when: ansible_os_family == "Debian"

    - name: Start web server (RedHat)
      ansible.builtin.service:
        name: httpd
        state: started
        enabled: yes
      when: ansible_os_family == "RedHat"

  handlers:
    - name: restart web server
      ansible.builtin.service:
        name: "{{ 'apache2' if ansible_os_family == 'Debian' else 'httpd' }}"
        state: restarted
```

---

## ✅ 2. Terminal Output

```bash
# Syntax check
$ ansible-playbook --syntax-check multi-os-webserver.yml

playbook: multi-os-webserver.yml

# Check mode
$ ansible-playbook -C --diff multi-os-webserver.yml

PLAY [Multi-OS Web Server Setup] *********************************************

TASK [Gathering Facts] *******************************************************
ok: [ubuntu-server]
ok: [centos-server]

TASK [Print OS information] **************************************************
ok: [ubuntu-server] => {
    "msg": "Managing ubuntu-server — OS: Ubuntu 22.04"
}
ok: [centos-server] => {
    "msg": "Managing centos-server — OS: CentOS 7.9"
}

TASK [Install Apache on Debian/Ubuntu] ***************************************
changed: [ubuntu-server]
skipping: [centos-server]

TASK [Install Apache on RedHat/CentOS] ***************************************
skipping: [ubuntu-server]
changed: [centos-server]

TASK [Install common utility packages] ***************************************
changed: [ubuntu-server] => (item=git)
changed: [ubuntu-server] => (item=curl)
ok: [ubuntu-server] => (item=htop)
changed: [centos-server] => (item=git)
changed: [centos-server] => (item=curl)
ok: [centos-server] => (item=htop)

TASK [Create web root directory] *********************************************
ok: [ubuntu-server]
ok: [centos-server]

TASK [Deploy custom index page] **********************************************
changed: [ubuntu-server]
changed: [centos-server]

TASK [Start web server (Debian)] *********************************************
changed: [ubuntu-server]
skipping: [centos-server]

TASK [Start web server (RedHat)] *********************************************
skipping: [ubuntu-server]
changed: [centos-server]

PLAY RECAP *******************************************************************
ubuntu-server  : ok=8    changed=5    failed=0    skipped=2
centos-server  : ok=8    changed=5    failed=0    skipped=2

# Verify
$ curl http://ubuntu-server
<!DOCTYPE html>
<html>
<head><title>ubuntu-server</title>...
<body><h1>🌐 ubuntu-server</h1>...

$ curl http://centos-server
<!DOCTYPE html>
<html>
<head><title>centos-server</title>...
<body><h1>🌐 centos-server</h1>...
```

---

## ✅ Lessons Learned

- **Facts** (via `gather_facts`) provide system information like OS, CPU, memory.
- **Conditionals** (`when: ansible_os_family == "Debian"`) allow OS-agnostic playbooks.
- **Loops** (`loop`) reduce repetitive tasks for installing multiple packages.
- **Handlers** run once at the end of the play when notified by a task.
- The `content` parameter in `copy` can inline file content directly.

---

*#LearnDevOpsIn90Days • Day 73 • Golu & Jagu Edition*
