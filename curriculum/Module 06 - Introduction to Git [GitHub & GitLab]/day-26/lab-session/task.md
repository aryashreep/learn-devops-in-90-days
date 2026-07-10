# 🧪 Lab Session: Day 26 — GitHub Collaboration & CLI Lab

**Jagu:** "Beep Boop! Golu, local repository toh badhiya hai, par jab tak code cloud par nahi jaata, tab tak tu team mein collaborate nahi kar sakta. Aaj hum seekhenge remote repos aur GitHub CLI ka power!"

## 🎯 Task Objectives
- Create a remote repository on GitHub.
- Link your local repository to GitHub.
- Push your local changes to a remote repository.
- Use the GitHub CLI (`gh`) to manage repositories from your terminal.

## 🛠️ Hands-on Challenges

1.  **Remote Setup:** 
    - Create a local folder `remote-mission/` and initialize it: `git init`.
    - Create a file `index.html` with basic HTML content.
    - Commit it: `git add .` and `git commit -m "First HTML commit"`.
2.  **GitHub Connection:**
    - Go to GitHub and create a new repository named `remote-mission` (do NOT initialize with README or gitignore).
    - Link your local repo: `git remote add origin <your-github-repo-url>`.
    - Rename default branch to main: `git branch -M main`.
    - Push your commit: `git push -u origin main`.
3.  **Command Line Ninja (GitHub CLI):**
    - Install `gh` (e.g., `brew install gh` on Mac or `sudo apt install gh` on Linux).
    - Authenticate your terminal: `gh auth login`.
    - Create a new public repository on GitHub directly from your terminal using `gh repo create` command.
    - Verify with: `gh repo view`.

---

### ✅ Proof of Work
**Jagu:** "Remote repository ready hai! Logs save kar le."

1. Create a file named **`remote-collab.md`** in the **`solution/`** folder.
2. Paste the output of `git remote -v` and the confirmation from your `gh repo view` command.
3. Commit and push your work!

---
*#LearnDevOpsIn90Days • Day 26 • Golu & Jagu Edition*
