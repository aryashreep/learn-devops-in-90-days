# 🧪 Lab Session: Day 11 — Ownership Mastery

**Jagu:** "Beep Boop! Golu, you have learned the tune permissions, but what if you want to change the 'Owner' of the file? Today we will become kings of the pure system through the mastery of 'chown'!"

## 🎯 Task Objectives
- Change file and directory owners.
- Manage group assignments.
- Perform recursive ownership changes safely.

## 🛠️ Hands-on Challenges

1.  **The King's Change:** Create a file `king.txt`. Use `sudo chown root king.txt` to make Root the owner. Try to edit it without sudo!
2.  **Team Transfer:** Use `chgrp` to change the group of a folder to `developers`.
3.  **Recursive Power:** Create a folder `top-secret/` with 3 files inside. Use one command (`chown -R`) to change the owner of the folder and all 3 files at once.
4.  **The Double Swap:** Research how to change the **User and Group** at the same time using a single `chown` command (Hint: use the colon `:`).
5.  **Verify:** Use `ls -la` to check the 3rd and 4th columns of your files.

---

### ✅ Proof of Work
**Jagu:** "Golu, changing ownership is a big responsibility. Save your work report!"

1. Create a file named `ownership-report.md` in the **`solution/`** folder.
2. Record the commands you used for the 'Double Swap' and a screenshot or text of `ls -la` results.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 11 • Golu & Jagu Edition*
