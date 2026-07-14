# 🧪 Lab Session: Day 27 — Integrating Work (Merge vs Rebase)

**Jagu:** "Beep Boop! Golu, when developers work in parallel, their history is added to the main branch. There are two ways to do this: Git Merge (which creates a merge commit) and Git Rebase (which creates a linear history). Let's see the magic of these two!"

## 🎯 Task Objectives
- Practice branching and parallel development.
- Learn how to integrate changes using `git merge`.
- Learn how to rewrite branch history using `git rebase` to keep a clean, linear project timeline.

## 🛠️ Hands-on Challenges

1.  **Branch Off:**
    - In a new Git repository `integration-practice/`, create an initial file `README.md` and commit it.
    - Create a branch named `feature-a`: `git checkout -b feature-a`.
    - Create a file `feature-a.txt`, write "Feature A content", and commit it.
2.  **Parallel Progress on Main:**
    - Switch back to `main`: `git checkout main`.
    - Create a file `main-update.txt`, write "Main updated", and commit it. Now, `main` and `feature-a` have diverged.
3.  **The Rebase Route:**
    - Switch to `feature-a`: `git checkout feature-a`.
    - Rebase your branch onto `main`: `git rebase main`. 
    - Check the log: `git log --oneline --graph`. Notice that the feature-a commit is now placed directly after the latest commit on `main` (linear history).
4.  **The Merge Route:**
    - Switch back to `main` and fast-forward/merge `feature-a`: `git merge feature-a`.
    - Create a new branch `feature-b`: `git checkout -b feature-b`.
    - Create `feature-b.txt` and commit it.
    - Switch back to `main` and update `README.md` again (make a commit).
    - Merge `feature-b` using standard merge: `git merge feature-b`. Notice the merge commit is created.

---

### ✅ Proof of Work
**Jagu:** "Git log history looks clean! Ise file mein save karo."

1. Create a file named **`merge-vs-rebase-log.md`** in the **`solution/`** folder.
2. Paste the output of `git log --oneline --graph --all`.
3. Commit and push your work!

---
*#LearnDevOpsIn90Days • Day 27 • Golu & Jagu Edition*
