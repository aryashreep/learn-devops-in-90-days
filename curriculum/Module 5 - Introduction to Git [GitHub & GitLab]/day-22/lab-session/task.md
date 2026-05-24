# 🧪 Lab Session: Day 22 — My First Save Point

**Jagu:** "Beep Boop! Golu, aaj se tera computer ek 'Time Machine' ban jayega. Aaj hum tera pehla 'Save Point' (Commit) create karenge taaki tu future mein past mein ja sake!"

## 🎯 Task Objectives
- Initialize a local Git repository.
- Configure your Git identity globally.
- Understand the life cycle of a file from "Untracked" to "Committed."

## 🛠️ Hands-on Challenges

1.  **Identity Setup:** 
    - Set your username: `git config --global user.name "Your Name"`.
    - Set your email: `git config --global user.email "your@email.com"`.
    - Verify: `git config --list`.
2.  **The Big Bang:** Create a new folder `git-mission/`. Go inside and run `git init`.
3.  **The First Draft:** 
    - Create a file `secret_mission.txt`.
    - Run `git status`. **Jagu says:** "Dekh, ye file abhi 'Untracked' hai!"
4.  **The Stage:** Add the file to the staging area: `git add secret_mission.txt`. Check status again.
5.  **The Save Point:** Commit your change: `git commit -m "Initial commit: The mission begins"`.

---

### ✅ Proof of Work
**Jagu:** "Golu, tune history create kar di hai! Screenshot ya logs save kar."

1. Create a file named **`git-init-log.md`** in the **`solution/`** folder.
2. Paste the output of `git status` after your first commit.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 22 • Golu & Jagu Edition*
