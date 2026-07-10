# 🧪 Lab Session: Day 29 — Collaboration & Safety

**Jagu:** "Beep Boop! Golu, team collaboration mein 'Merge Conflict' aana toh normal baat hai. Lekin real-world DevOps projects mein log tab panic karte hain jab unhe conflicts resolve karna nahi aata ya wo `--force` push karke doosre ka code delete kar dete hain! Aaj hum seekhenge conflicts resolve karna aur safety force push seekhna."

## 🎯 Task Objectives
- Intentionally create and resolve a merge conflict.
- Work with the Pull Request workflow structure.
- Understand the difference between `git push --force` and `git push --force-with-lease`.

## 🛠️ Hands-on Challenges

1.  **Setting up a Conflict:**
    - In your repository, create a file named `conflict-zone.txt` on the `main` branch with the text: `Initial code base: Created by Golu`. Commit and push this to GitHub.
    - Create a branch named `feature-left`: `git checkout -b feature-left`.
    - Edit `conflict-zone.txt` to say: `Initial code base: Modified by Jagu on Left Branch`. Commit this locally.
    - Switch back to `main`: `git checkout main`.
    - Edit `conflict-zone.txt` on `main` to say: `Initial code base: Modified by Golu on Main Branch`. Commit this change.
2.  **Triggering the Merge Clash:**
    - Try to merge the left branch: `git merge feature-left`.
    - Git will block this and output: `CONFLICT (content): Merge conflict in conflict-zone.txt`.
3.  **Conflict Surgery:**
    - Open `conflict-zone.txt` in VS Code or your terminal text editor.
    - Identify the conflict markers: `<<<<<<< HEAD`, `=======`, and `>>>>>>> feature-left`.
    - Edit the file to resolve the conflict (e.g., combine or select the correct lines) and remove all conflict marker lines.
    - Save the file, stage it: `git add conflict-zone.txt`.
    - Finish the merge: `git commit -m "Merge resolved: Combined changes from main and feature-left"`.
4.  **Safe Force Pushing:**
    - Amend your last commit message: `git commit --amend -m "Resolved clash: Combined edits from main & feature-left"`.
    - Push this updated history using the safe force push command: `git push origin main --force-with-lease`.

---

### ✅ Proof of Work
**Jagu:** "Conflict resolved and safely pushed! Report update karo."

1. Create a file named **`conflict-resolution.md`** in the **`solution/`** folder.
2. Paste the final resolved content of `conflict-zone.txt` and the output of your force push command.
3. Commit and push your work!

---
*#LearnDevOpsIn90Days • Day 29 • Golu & Jagu Edition*
