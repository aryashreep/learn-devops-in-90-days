# 🏆 Module 12 Mastery Exam: Ansible [Configuration Management]

Welcome to the **Ansible Mastery Exam**! This assessment tests your knowledge of Ansible architecture, inventory management, playbooks, variables, conditionals, loops, roles, templates, vault, and automation best practices.

---

## 📝 Part 1: Ansible Fundamentals

**1. What architecture does Ansible use?**
- A) Agent-based with daemon on each node
- B) Agentless push model over SSH
- C) Pull-based model with periodic checks
- D) API-gateway model
- **Ans: B**

**2. Which of the following is NOT required on an Ansible managed node?**
- A) Python
- B) SSH server
- C) Ansible agent
- D) Network connectivity
- **Ans: C**

**3. Who developed Ansible?**
- A) Red Hat
- B) HashiCorp
- C) Michael DeHaan
- D) Docker Inc
- **Ans: C**

**4. In which year was Ansible acquired by Red Hat?**
- A) 2012
- B) 2013
- C) 2015
- D) 2018
- **Ans: C**

**5. Which protocol does Ansible use by default to connect to Linux managed nodes?**
- A) HTTPS
- B) SSH
- C) Telnet
- D) SNMP
- **Ans: B**

**6. What is the default location of the Ansible configuration file?**
- A) `~/.ansible.cfg`
- B) `/etc/ansible/ansible.cfg`
- C) `/etc/ansible.cfg`
- D) `/opt/ansible/ansible.cfg`
- **Ans: B**

**7. Which command displays the Ansible version and configuration?**
- A) `ansible info`
- B) `ansible version`
- C) `ansible --version`
- D) `ansible config`
- **Ans: C**

**8. What format does Ansible use for playbooks?**
- A) JSON
- B) XML
- C) YAML
- D) TOML
- **Ans: C**

**9. What is an Ansible "Play"?**
- A) A single installed module
- B) A mapping between a group of hosts and the tasks to run on them
- C) A Python script for automation
- D) A configuration file for managed nodes
- **Ans: B**

**10. What is the purpose of `gather_facts: yes` in a playbook?**
- A) Installs additional Python packages on managed nodes
- B) Collects system information about managed nodes
- C) Downloads the latest modules from Galaxy
- D) Creates a backup of configuration files
- **Ans: B**

---

## 📝 Part 2: Inventory & Ad-Hoc Commands

**11. Which file type is NOT valid for Ansible inventory?**
- A) INI format
- B) YAML format
- C) JSON format
- D) XML format
- **Ans: D**

**12. What is a dynamic inventory?**
- A) An inventory that changes during playbook execution
- B) A script or plugin that fetches host lists from cloud APIs
- C) An inventory with rotating host names
- D) An inventory stored in a database
- **Ans: B**

**13. Which ad-hoc module tests connectivity to managed nodes?**
- A) `command`
- B) `shell`
- C) `ping`
- D) `test`
- **Ans: C**

**14. Which ad-hoc module gathers system facts?**
- A) `facts`
- B) `setup`
- C) `info`
- D) `system`
- **Ans: B**

**15. How do you run an ad-hoc command on all hosts in the webservers group?**
- A) `ansible-playbook webservers -m command`
- B) `ansible webservers -m command -a "uptime"`
- C) `ansible all -m webservers -a "uptime"`
- D) `ansible-playbook webservers.yml`
- **Ans: B**

---

## 📝 Part 3: Playbooks & Modules

**16. What does `become: yes` do in a playbook?**
- A) Creates a background process
- B) Allows the playbook to continue on error
- C) Elevates privileges to run tasks as root (sudo)
- D) Makes the playbook executable
- **Ans: C**

**17. Which module is used to manage files and directories?**
- A) `copy`
- B) `file`
- C) `template`
- D) `manage`
- **Ans: B**

**18. What is the purpose of idempotency in Ansible?**
- A) Running tasks in parallel for speed
- B) Ensuring the same result regardless of how many times the playbook runs
- C) Encrypting sensitive data during transfer
- D) Automatically recovering from failures
- **Ans: B**

**19. Which flag runs a playbook in check (dry-run) mode?**
- A) `--check`
- B) `--dry-run`
- C) `--test`
- D) `--preview`
- **Ans: A**

**20. How do you pass extra variables to a playbook?**
- A) Using `--vars` flag
- B) Using `--extra-vars` flag
- C) Using `--params` flag
- D) Using `--set-vars` flag
- **Ans: B**

---

## 📝 Part 4: Variables, Conditionals, Loops & Handlers

**21. Which variable type has the HIGHEST precedence?**
- A) Role defaults
- B) Extra vars (`--extra-vars`)
- C) Inventory variables
- D) Play vars
- **Ans: B**

**22. Which keyword is used for conditional execution?**
- A) `if`
- B) `when`
- C) `condition`
- D) `unless`
- **Ans: B**

**23. How do you iterate over a list in an Ansible task?**
- A) `for_each`
- B) `loop`
- C) `iterate`
- D) `each`
- **Ans: B**

**24. When do handlers run in a playbook?**
- A) Immediately when notified
- B) At the end of the play, after all tasks
- C) At the beginning of the play
- D) In random order
- **Ans: B**

**25. What triggers a handler?**
- A) The `trigger` keyword
- B) The `notify` keyword
- C) The `call` keyword
- D) The `run` keyword
- **Ans: B**

---

## 📝 Part 5: Roles, Galaxy, Templates & Vault

**26. What command creates a new role skeleton?**
- A) `ansible-role init <name>`
- B) `ansible-galaxy init <name>`
- C) `ansible-create role <name>`
- D) `ansible new role <name>`
- **Ans: B**

**27. What file extension do Jinja2 templates use?**
- A) `.tmpl`
- B) `.j2`
- C) `.template`
- D) `.ans`
- **Ans: B**

**28. Which directory in a role stores low-priority default variables?**
- A) `vars/`
- B) `defaults/`
- C) `meta/`
- D) `config/`
- **Ans: B**

**29. What command encrypts a file with Ansible Vault?**
- A) `ansible-vault encrypt <file>`
- B) `ansible-vault lock <file>`
- C) `ansible encrypt <file>`
- D) `ansible-vault create <file>`
- **Ans: A**

**30. How do you supply the Vault password when running a playbook?**
- A) Using `--vault-password` flag
- B) Using `--ask-vault-pass` or `--vault-password-file`
- C) Using `--vault-key` flag
- D) Using `--password-file` flag
- **Ans: B**

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 12: Ansible [Config Mgmt]*
