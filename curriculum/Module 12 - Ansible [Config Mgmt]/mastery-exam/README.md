# 🏆 Module 12 Mastery Exam: Ansible [Configuration Management]

Welcome to the **Ansible Mastery Exam**! This assessment tests your knowledge of Ansible architecture, inventory management, playbooks, variables, conditionals, loops, roles, templates, vault, and automation best practices.

---

## 📝 Part 1: Ansible Fundamentals

**1. What architecture does Ansible use?**
- A) Agent-based with daemon on each node
- B) Pull-based model with periodic checks
- C) Agentless push model over SSH
- D) API-gateway model
- **Ans: C**

**2. Which of the following is NOT required on an Ansible managed node?**
- A) Ansible agent
- B) Python
- C) SSH server
- D) Network connectivity
- **Ans: A**

**3. Who developed Ansible?**
- A) Red Hat
- B) HashiCorp
- C) Docker Inc
- D) Michael DeHaan
- **Ans: D**

**4. In which year was Ansible acquired by Red Hat?**
- A) 2012
- B) 2015
- C) 2013
- D) 2018
- **Ans: B**

**5. Which protocol does Ansible use by default to connect to Linux managed nodes?**
- A) SSH
- B) HTTPS
- C) Telnet
- D) SNMP
- **Ans: A**

**6. What is the default location of the Ansible configuration file?**
- A) `~/.ansible.cfg`
- B) `/etc/ansible.cfg`
- C) `/opt/ansible/ansible.cfg`
- D) `/etc/ansible/ansible.cfg`
- **Ans: D**

**7. Which command displays the Ansible version and configuration?**
- A) `ansible --version`
- B) `ansible info`
- C) `ansible version`
- D) `ansible config`
- **Ans: A**

**8. What format does Ansible use for playbooks?**
- A) JSON
- B) XML
- C) TOML
- D) YAML
- **Ans: D**

**9. What is an Ansible "Play"?**
- A) A single installed module
- B) A Python script for automation
- C) A mapping between a group of hosts and the tasks to run on them
- D) A configuration file for managed nodes
- **Ans: C**

**10. What is the purpose of `gather_facts: yes` in a playbook?**
- A) Collects system information about managed nodes
- B) Installs additional Python packages on managed nodes
- C) Downloads the latest modules from Galaxy
- D) Creates a backup of configuration files
- **Ans: A**

---

## 📝 Part 2: Inventory & Ad-Hoc Commands

**11. Which file type is NOT valid for Ansible inventory?**
- A) INI format
- B) XML format
- C) YAML format
- D) JSON format
- **Ans: B**

**12. What is a dynamic inventory?**
- A) An inventory that changes during playbook execution
- B) An inventory with rotating host names
- C) A script or plugin that fetches host lists from cloud APIs
- D) An inventory stored in a database
- **Ans: C**

**13. Which ad-hoc module tests connectivity to managed nodes?**
- A) `ping`
- B) `command`
- C) `shell`
- D) `test`
- **Ans: A**

**14. Which ad-hoc module gathers system facts?**
- A) `facts`
- B) `info`
- C) `system`
- D) `setup`
- **Ans: D**

**15. How do you run an ad-hoc command on all hosts in the webservers group?**
- A) `ansible-playbook webservers -m command`
- B) `ansible all -m webservers -a "uptime"`
- C) `ansible webservers -m command -a "uptime"`
- D) `ansible-playbook webservers.yml`
- **Ans: C**

---

## 📝 Part 3: Playbooks & Modules

**16. What does `become: yes` do in a playbook?**
- A) Creates a background process
- B) Elevates privileges to run tasks as root (sudo)
- C) Allows the playbook to continue on error
- D) Makes the playbook executable
- **Ans: B**

**17. Which module is used to manage files and directories?**
- A) `copy`
- B) `template`
- C) `manage`
- D) `file`
- **Ans: D**

**18. What is the purpose of idempotency in Ansible?**
- A) Ensuring the same result regardless of how many times the playbook runs
- B) Running tasks in parallel for speed
- C) Encrypting sensitive data during transfer
- D) Automatically recovering from failures
- **Ans: A**

**19. Which flag runs a playbook in check (dry-run) mode?**
- A) `--dry-run`
- B) `--test`
- C) `--check`
- D) `--preview`
- **Ans: C**

**20. How do you pass extra variables to a playbook?**
- A) Using `--vars` flag
- B) Using `--params` flag
- C) Using `--set-vars` flag
- D) Using `--extra-vars` flag
- **Ans: D**

---

## 📝 Part 4: Variables, Conditionals, Loops & Handlers

**21. Which variable type has the HIGHEST precedence?**
- A) Extra vars (`--extra-vars`)
- B) Role defaults
- C) Inventory variables
- D) Play vars
- **Ans: A**

**22. Which keyword is used for conditional execution?**
- A) `if`
- B) `condition`
- C) `when`
- D) `unless`
- **Ans: C**

**23. How do you iterate over a list in an Ansible task?**
- A) `for_each`
- B) `iterate`
- C) `each`
- D) `loop`
- **Ans: D**

**24. When do handlers run in a playbook?**
- A) At the end of the play, after all tasks
- B) Immediately when notified
- C) At the beginning of the play
- D) In random order
- **Ans: A**

**25. What triggers a handler?**
- A) The `trigger` keyword
- B) The `call` keyword
- C) The `notify` keyword
- D) The `run` keyword
- **Ans: C**

---

## 📝 Part 5: Roles, Galaxy, Templates & Vault

**26. What command creates a new role skeleton?**
- A) `ansible-role init <name>`
- B) `ansible-create role <name>`
- C) `ansible new role <name>`
- D) `ansible-galaxy init <name>`
- **Ans: D**

**27. What file extension do Jinja2 templates use?**
- A) `.j2`
- B) `.tmpl`
- C) `.template`
- D) `.ans`
- **Ans: A**

**28. Which directory in a role stores low-priority default variables?**
- A) `vars/`
- B) `defaults/`
- C) `meta/`
- D) `config/`
- **Ans: B**

**29. What command encrypts a file with Ansible Vault?**
- A) `ansible-vault lock <file>`
- B) `ansible-vault encrypt <file>`
- C) `ansible encrypt <file>`
- D) `ansible-vault create <file>`
- **Ans: B**

**30. How do you supply the Vault password when running a playbook?**
- A) Using `--vault-password` flag
- B) Using `--vault-key` flag
- C) Using `--password-file` flag
- D) Using `--ask-vault-pass` or `--vault-password-file`
- **Ans: D**

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 12: Ansible [Config Mgmt]*
