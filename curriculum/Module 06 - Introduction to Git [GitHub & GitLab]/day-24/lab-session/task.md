# 🧪 Lab Session: Day 24 — Your First Save Point

**Jagu:** "Beep Boop! Golu, today we will make a time machine! Now you can undo any change."

## 🎯 Task Objectives
- Set up Git with your identity.
- Initialize your first repository.
- Practice the 3-stage cycle: Working Directory, Staging Area, Local Repository.

## 🛠️ Hands-on Challenges

1.  **Git Config (Identity):**
    - Set your username: `git config --global user.name "Your Name"`
    - Set your email: `git config --global user.email "your.email@example.com"`
    - Verify it: `git config --list`

2.  **Create a New Repository:**
    - Create a folder: `mkdir git-mission && cd git-mission`
    - Initialize Git: `git init`
    - Check status: `git status`

3.  **Your First Save:**
    - Create a file: `echo "Hello DevOps!" > README.md`
    - Stage it: `git add README.md`
    - Commit it: `git commit -m "initial commit: my first save point"`

4.  **The Change Cycle:**
    - Edit README.md and add a second line.
    - Check `git status` and `git diff`.
    - Stage and commit again.

---

### ✅ Proof of Work
**Jagu:** "Golu, save your life! Time Machine is ready!"

1. Create a file named **`first-savepoint.md`** in the **`solution/`** folder.
2. Paste your `git log` output showing your commits.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 24 • Golu & Jagu Edition*
