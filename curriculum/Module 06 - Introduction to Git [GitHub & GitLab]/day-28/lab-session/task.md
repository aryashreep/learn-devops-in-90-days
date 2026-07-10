# 🧪 Lab Session: Day 28 — Undoing & Surgical Edits

**Jagu:** "Beep Boop! Git mein 'Oops' moments sabhi ke saath aate hain, Golu. Lekin real DevOps engineer wahi hai jo system bina crash kiye history ko operation theater (surgery) mein le jaakar thik kar sake! Aaj hum reset, revert, cherry-pick aur invisible time recorder 'reflog' ka use karenge."

## 🎯 Task Objectives
- Learn how to safely undo commits using `git reset` (soft) and `git revert`.
- Learn how to recover deleted commits or branches using `git reflog`.
- Selectively merge specific commits into another branch using `git cherry-pick`.

## 🛠️ Hands-on Challenges

1.  **The Soft Reset Surgery:**
    - Create a test file `test-file.txt` and commit it: `git commit -m "Important text added"`.
    - Make another commit: `git commit -am "Oops, wrong typo commit"`.
    - Undo this last commit using: `git reset --soft HEAD~1`.
    - Verify with `git status` that your file edits are still staged and safe, but the commit itself is gone.
2.  **Safety First with Revert:**
    - Commit the file again. Now pretend it's on a shared branch and we can't rewrite history.
    - Revert it: `git revert HEAD` (this will open an editor to write a commit message).
    - Run `git log` and see how Git has created a new commit that undoes the previous work without erasing history.
3.  **Reflog Time Travel:**
    - Create a temporary branch `temp-branch` and switch to it: `git checkout -b temp-branch`.
    - Create a file `secrets-lost.txt`, commit it, and switch back to `main`: `git checkout main`.
    - Delete the temporary branch: `git branch -D temp-branch`.
    - Oh no, the branch and commit are deleted! Run `git reflog` to see your past movements.
    - Locate the SHA of the commit where you added `secrets-lost.txt` and checkout that SHA onto a new branch to recover it: `git checkout -b recovered-branch <commit-SHA>`.
4.  **Surgical Grafting (Cherry-pick):**
    - Go to `main`: `git checkout main`.
    - Pull the commit from `recovered-branch` without merging the whole branch: `git cherry-pick <commit-SHA>`.

---

### ✅ Proof of Work
**Jagu:** "Git surgery successful! Logs save karo."

1. Create a file named **`surgical-edits.md`** in the **`solution/`** folder.
2. Paste the output of `git reflog` (first 10 lines) and the latest `git log --oneline -n 3` output after cherry-picking.
3. Commit and push your work!

---
*#LearnDevOpsIn90Days • Day 28 • Golu & Jagu Edition*
