# 🧪 Lab Session: Day 09 — User & Group Management Challenge

**Jagu:** "Golu, there is no 'Root' on production servers. Today we will learn how to manage multiple users (Tokyo, Berlin, Professor) and give permissions!"

## 🎯 Task Objectives
- Create and manage system users.
- Implement Group-based access control.
- Setup shared team workspaces with strict permissions.

## 🛠️ Hands-on Challenges

1.  **The Money Heist Team:**
    - Create 3 users: `tokyo`, `berlin`, `professor`.
    - Use `sudo useradd -m <name>` and set passwords with `sudo passwd <name>`.
2.  **Organizing the Gang:**
    - Create 2 groups: `developers` and `admins`.
    - Assign users:
        - `tokyo` ➔ `developers`
        - `berlin` ➔ `developers` AND `admins`
        - `professor` ➔ `admins`
3.  **Shared Workspace:**
    - Create directory: `sudo mkdir -p /opt/dev-project`.
    - Change group owner: `sudo chgrp developers /opt/dev-project`.
    - Set permissions: `sudo chmod 775 /opt/dev-project`.
4.  **Verification:**
    - Switch to user `tokyo`: `sudo su - tokyo`.
    - Try creating a file in `/opt/dev-project`.
5.  **New Recruit:**
    - Create user `nairobi` and group `project-team`.
    - Add `nairobi` and `tokyo` to `project-team`.
    - Setup `/opt/team-workspace` with `775` for the new group.

---

### ✅ Proof of Work
**Jagu:** "Golu, system secure hai! Access list ready karo."

1. Create a file named **`day-09-user-management.md`** in the **`solution/`** folder.
2. List the members of each group using `grep` on `/etc/group`.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 09 • Golu & Jagu Edition*
