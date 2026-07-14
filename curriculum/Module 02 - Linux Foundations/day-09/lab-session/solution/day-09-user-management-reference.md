# 🧪 Day 09 Solution: User & Group Management

**Jagu:** "Well done Golu! Tune team has mastered access control. Now 'Professor's team is secure! Here is your reference user report."

---

## 🛠️ Step-by-Step Command History

### 1. Creating the Team
```bash
$ sudo useradd -m tokyo
$ sudo useradd -m berlin
$ sudo useradd -m professor
$ sudo useradd -m nairobi
```

### 2. Assigning Roles (Groups)
```bash
$ sudo groupadd developers
$ sudo groupadd admins

# Multi-group assignment for Berlin
$ sudo usermod -aG developers berlin
$ sudo usermod -aG admins berlin

# Tokyo and Professor roles
$ sudo usermod -aG developers tokyo
$ sudo usermod -aG admins professor
```

### 3. Shared Workspace Setup
```bash
$ sudo mkdir -p /opt/dev-project
$ sudo chgrp developers /opt/dev-project
$ sudo chmod 775 /opt/dev-project
```

---

## 🔍 Verification Findings

### Group Membership Check
```bash
$ grep "developers" /etc/group
developers:x:1001:tokyo,berlin

$ grep "admins" /etc/group
admins:x:1002:berlin,professor
```

---

## 💡 Jagu's Pro Tip:
"Golu, always use `-a` (append) flag with `usermod`. If you forget, the user will be removed from all the old groups!"

---
*#LearnDevOpsIn90Days • Day 09 • Golu & Jagu Edition*
