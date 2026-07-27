# 🗓️ Day 73 — Variables, Facts, Conditionals and Loops

Welcome to **Day 73**! Today we make our playbooks dynamic and intelligent using variables, system facts, conditional execution, and loops.

---

## 🎯 Today's Goal
Master variable precedence, gather and use system facts (Ansible facts), implement conditional logic with `when`, iterate tasks with `loop`, and use handlers with `notify`.

## 🧠 Key Learnings
- **Variables:** Precedence levels, `vars_files`, and variable interpolation.
- **Facts:** Gathering system info with the `setup` module and `gather_facts`.
- **Conditionals:** Using `when` to control task execution.
- **Loops:** Iterating with `loop`, `with_items`, and loop controls.
- **Handlers:** Triggering actions on state changes with `notify`.

## 🧠 Pro Module
[🎓 Day 73 Pro Module: Variables, Facts, Conditionals and Loops](./Day73_Vars_Facts_Conditionals.html)

## 🧪 Hands-on Lab
👉 [Lab Session: Multi-OS Web Server Setup](./lab-session/task.md)

---

## 📖 Key Concepts

### Variable Precedence (Lowest to Highest)

1. **Role defaults** — Lowest priority
2. **Inventory variables** — `host_vars/` and `group_vars/`
3. **Play vars** — Defined in the playbook
4. **vars_files** — External variable files
5. **Roles vars** — Inside roles directory
6. **Block vars** — Scope-limited variables
7. **Task vars** — Specific to a single task
8. **Extra vars** — Highest priority (`--extra-vars`)

### Using System Facts

```yaml
- name: Gather facts
  ansible.builtin.setup:

- name: Print OS family
  ansible.builtin.debug:
    msg: "This is a {{ ansible_os_family }} system"

- name: Conditional based on fact
  ansible.builtin.apt:
    name: httpd
    state: present
  when: ansible_os_family == "RedHat"
```

### Conditionals with `when`

```yaml
- name: Install Apache on Debian
  ansible.builtin.apt:
    name: apache2
    state: present
  when: 
    - ansible_os_family == "Debian"
    - ansible_distribution_version is version("20.04", ">=")

- name: Skip if file exists
  ansible.builtin.stat:
    path: /etc/nginx/nginx.conf
  register: nginx_conf

- name: Configure Nginx only if not exists
  ansible.builtin.template:
    src: nginx.conf.j2
    dest: /etc/nginx/nginx.conf
  when: not nginx_conf.stat.exists
```

### Loops

```yaml
- name: Create multiple users
  ansible.builtin.user:
    name: "{{ item }}"
    state: present
  loop:
    - alice
    - bob
    - charlie

- name: Install multiple packages
  ansible.builtin.apt:
    name: "{{ item }}"
    state: present
  loop:
    - nginx
    - git
    - curl
    - htop

- name: Loop with dictionaries
  ansible.builtin.user:
    name: "{{ item.name }}"
    uid: "{{ item.uid }}"
    groups: "{{ item.groups }}"
  loop:
    - { name: alice, uid: 1001, groups: "sudo" }
    - { name: bob, uid: 1002, groups: "www-data" }
```

### Handlers

Handlers are special tasks that run only when notified by another task:

```yaml
tasks:
  - name: Update Nginx config
    ansible.builtin.template:
      src: nginx.conf.j2
      dest: /etc/nginx/nginx.conf
    notify: restart nginx

  - name: Update index page
    ansible.builtin.copy:
      src: index.html
      dest: /var/www/html/index.html
    notify: reload nginx

handlers:
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

## ❓ Mini Quiz

1. **Which variable type has the highest priority?**
   - a) Role defaults
   - b) Extra vars (`--extra-vars`)
   - c) Inventory variables
   - d) Play vars

2. **Which module gathers system facts?**
   - a) `facts`
   - b) `setup`
   - c) `system`
   - d) `info`

3. **What does `notify` do in a playbook?**
   - a) Sends an email alert
   - b) Triggers a handler task
   - c) Prints a debug message
   - d) Creates a log entry

**Answers:** 1-b | 2-b | 3-b

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 12: Ansible [Config Mgmt]*
