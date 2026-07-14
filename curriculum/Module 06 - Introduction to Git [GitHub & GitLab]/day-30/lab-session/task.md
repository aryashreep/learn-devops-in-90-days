# 🧪 Lab Session: Day 30 — Git Mastery (Advanced Tools)

**Jagu:** "Beep Boop! Congratulations Golu, we are on the last day of Git module! Today we will seek advanced Git techniques that standard developers would not know. Finding bugs with Bisect, running automatic validation from a Git hooks script, tagging releases with annotations, and using Git Worktrees for multi-tasking!"

## 🎯 Task Objectives
- Debug history by running a binary search using `git bisect`.
- Version release your codebase with annotated tags (`git tag -a`).
- Setup custom pre-commit hooks inside `.git/hooks/`.
- Manage and checkout multiple branches simultaneously using `git worktree`.

## 🛠️ Hands-on Challenges

1.  **Bug Hunting with Bisect:**
    - Create a file `code.txt` with content: `Stable line 1`. Commit it.
    - Edit `code.txt` to add: `Stable line 2`. Commit it (This is a good commit).
    - Edit `code.txt` to add: `A hidden BUG was introduced here`. Commit it (This is bad).
    - Edit `code.txt` to add: `Extra stable line 3`. Commit it.
    - Locate the bug:
      - `git bisect start`
      - `git bisect bad HEAD`
      - `git bisect good <insert-SHA-of-second-commit>`
      - Git will checkout intermediate commits. Check `code.txt` each time and run `git bisect good` or `git bisect bad`.
      - Find the culprit commit hash, then reset: `git bisect reset`.
2.  **Annotated Release Tags:**
    - Create a release tag v1.0: `git tag -a v1.0 -m "DevOps Academy Release Version 1.0"`.
    - Push this tag to remote: `git push origin v1.0`.
3.  **Local Git Hooks:**
    - Go to `.git/hooks/` inside your repository directory.
    - Create a new file named `pre-commit` (no file extension).
    - Add the following shell code to it:
      ```bash
      #!/bin/sh
      echo "🤖 Jagu says: Checking code quality... Ready to commit!"
      exit 0
      ```
    - Make the script executable: `chmod +x .git/hooks/pre-commit`.
    - Try making a dummy change and commit it. Verify that Jagu's automated check runs and prints in your terminal.
4.  **Multi-Tasking with Git Worktree:**
    - Switch to main repository directory.
    - Add a separate hotfix directory linked to a new branch: `git worktree add ../hotfix-folder -b hotfix-branch`.
    - Navigate to `../hotfix-folder` and verify you can edit files on `hotfix-branch` while your original folder remains safely on `main`.

---

### ✅ Proof of Work
**Jagu:** "Git Ninja title unlocked! Final log copy karo."

1. Create a file named **`git-mastery.md`** in the **`solution/`** folder.
2. Paste the commit hash identified by `git bisect` and the output of `git worktree list`.
3. Commit and push your work!

---
*#LearnDevOpsIn90Days • Day 30 • Golu & Jagu Edition*
