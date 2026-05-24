# 🧪 Day 09 Solution: User & Group Management

**Jagu:** "Shabash Golu! Tune team access control master kar liya hai. Ab 'Professor' ki team secure hai! Ye raha tera reference user report."

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
"Golu, hamesha `usermod` ke saath `-a` (append) flag use karna. Agar bhul gaya, toh purane saare groups se user nikal jayega!"

---
*#LearnDevOpsIn90Days • Day 09 • Golu & Jagu Edition*
