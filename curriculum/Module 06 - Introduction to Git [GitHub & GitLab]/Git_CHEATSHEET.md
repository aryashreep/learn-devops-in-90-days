# 🐙 Git & GitHub — Command Cheatsheet

> **Quick reference for Git version control: daily commands, branching, collaboration, remotes, and GitHub/GitLab workflows.**
>
> *Print-friendly — designed for Cmd+P / PDF export.*

---

## 🏗️ Git Basics

### Configuration

```bash
# Set identity (required for commits)
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# Common config
git config --global init.defaultBranch main
git config --global core.editor "code --wait"
git config --global pull.rebase true
git config --global fetch.prune true

# View all config
git config --list
git config --list --global

# Credential caching
git config --global credential.helper cache
git config --global credential.helper "cache --timeout=3600"
```

### Initialize & Clone

```bash
git init                    # Create new repository
git clone <url>             # Clone remote repo
git clone <url> --depth 1  # Shallow clone (no history, faster)
git clone <url> <folder>   # Clone into specific folder
```

---

## 📝 Daily Workflow

```bash
# Check status
git status                  # Show working tree status
git status -s               # Short format (M modified, ?? untracked)

# Stage changes
git add file.txt            # Stage specific file
git add .                   # Stage all changes in current dir
git add -p                  # Interactive staging (hunk by hunk)

# Commit
git commit -m "feat: add login page"            # Basic commit
git commit -m "fix: resolve timeout bug"        # Conventional commit
git commit -am "chore: update deps"             # Add + commit (tracked files only)
git commit --amend -m "New message"             # Fix last commit message
git commit --amend --no-edit                    # Add changes to last commit

# Diff
git diff                    # Unstaged changes
git diff --staged           # Staged changes (ready to commit)
git diff HEAD               # All changes since last commit
git diff branch1..branch2   # Compare two branches

# Log
git log                     # Commit history
git log --oneline           # Compact one-line format
git log --graph --oneline   # ASCII graph + commits
git log --author="name"     # Filter by author
git log --since="2 weeks ago"   # Filter by date
git log -p                  # Show diffs inline
```

### Conventional Commit Format

```text
<type>(<scope>): <description>

Types: feat, fix, chore, docs, style, refactor, perf, test, ci
```

---

## 🌿 Branching

```bash
# List branches
git branch                  # Local branches (* = current)
git branch -r               # Remote branches
git branch -a               # All branches (local + remote)
git branch -v               # Branches with last commit

# Create & switch
git branch feature-x        # Create branch
git checkout feature-x      # Switch to branch
git checkout -b feature-x   # Create + switch (shortcut)
git switch feature-x        # Modern way to switch
git switch -c feature-x     # Create + switch (modern)

# Delete
git branch -d feature-x     # Delete (safe — only if merged)
git branch -D feature-x     # Force delete (even if unmerged)

# Rename
git branch -m old-name new-name     # Rename current/local branch
git branch -m new-name              # Rename current branch

# Push new branch to remote
git push -u origin feature-x        # -u sets upstream tracking
```

### Branch Naming Conventions

| Prefix | Type | Example |
|--------|------|---------|
| `feature/` | New feature | `feature/user-auth` |
| `fix/` | Bug fix | `fix/login-timeout` |
| `hotfix/` | Urgent production fix | `hotfix/security-patch` |
| `chore/` | Maintenance | `chore/update-deps` |
| `release/` | Release branch | `release/v2.1.0` |

---

## 🔄 Merging & Rebasing

```bash
# Merge (creates merge commit)
git checkout main
git merge feature-x
git merge --no-ff feature-x         # Force merge commit even if fast-forward

# Rebase (linear history — no merge commit)
git checkout feature-x
git rebase main

# Interactive rebase
git rebase -i HEAD~3                # Squash, reword, reorder last 3 commits

# Cherry-pick (apply specific commit to current branch)
git cherry-pick <commit-hash>

# Resolve conflicts
git merge --abort                   # Abort merge
git rebase --abort                  # Abort rebase
git rebase --continue               # After resolving conflicts
```

---

## 🌐 Remote Repositories

```bash
# Show remotes
git remote -v                       # List remotes with URLs
git remote show origin              # Detailed remote info

# Add / Remove remotes
git remote add origin <url>         # Add remote
git remote remove origin            # Remove remote
git remote rename origin upstream   # Rename remote

# Push
git push origin main                # Push to main on origin
git push -u origin feature-x        # Push + set upstream
git push --tags                     # Push tags
git push origin --delete feature-x  # Delete remote branch
git push --force                    # Force push (⚠️ careful!)

# Pull = fetch + merge
git pull origin main                # Fetch + merge
git pull --rebase                   # Fetch + rebase (cleaner history)

# Fetch (just download, don't merge)
git fetch origin                    # Fetch all branches
git fetch --prune                   # Remove stale remote-tracking refs
```

---

## 🗂️ Undoing Changes

```bash
# Working directory
git restore file.txt                # Discard unstaged changes
git checkout -- file.txt            # Discard (older syntax)

# Staging
git restore --staged file.txt       # Unstage (keep changes in working dir)
git reset HEAD file.txt             # Unstage (older syntax)

# Commits
git reset --soft HEAD~1             # Undo commit, keep changes staged
git reset --mixed HEAD~1            # Undo commit, keep changes unstaged
git reset --hard HEAD~1             # ⚠️ Destroy last commit + changes
git revert HEAD                     # Safe: create new commit that reverses last

# Stash (temporary save)
git stash                           # Stash working dir changes
git stash save "WIP: login page"    # Stash with message
git stash list                      # List stashes
git stash pop                       # Restore + remove latest stash
git stash apply                     # Restore without removing
git stash drop                      # Delete latest stash
git stash clear                     # Delete all stashes
```

---

## 🔖 Tags

```bash
# Create
git tag v1.0.0                          # Lightweight tag
git tag -a v1.0.0 -m "Release 1.0"     # Annotated tag (recommended)
git tag -a v1.0.0 <commit-hash> -m "v1.0.0"  # Tag a specific commit

# List
git tag                                 # List all tags
git tag -l "v1.*"                       # Filter tags

# Push
git push origin v1.0.0                  # Push specific tag
git push origin --tags                  # Push all tags

# Delete
git tag -d v1.0.0                       # Delete local tag
git push origin --delete v1.0.0         # Delete remote tag
```

---

## 👥 Collaboration

```bash
# Fork + Pull Request workflow
# 1. Fork on GitHub/GitLab
# 2. Clone your fork
git clone https://github.com/yourname/repo.git

# 3. Add upstream remote
git remote add upstream https://github.com/original/repo.git

# 4. Sync fork
git checkout main
git pull upstream main
git push origin main

# 5. Create feature branch
git checkout -b feature-x

# 6. Commit, push, PR
git push -u origin feature-x
# → Open Pull Request on GitHub/GitLab

# 7. After PR is merged, clean up
git checkout main
git pull upstream main
git push origin main
git branch -d feature-x
git push origin --delete feature-x
```

---

## 📋 .gitignore Patterns

```text
# Dependencies
node_modules/
vendor/
.python-version

# Build output
dist/
build/
*.exe
*.dll

# Logs & temp
*.log
.tmp/

# IDE
.idea/
.vscode/
*.swp

# Environment
.env
.env.local
*.key

# OS files
.DS_Store
Thumbs.db
```

---

## 🔍 Advanced Git

```bash
# Bisect (binary search for a buggy commit)
git bisect start
git bisect bad HEAD               # Current commit is broken
git bisect good <commit>          # Mark a known-good commit
# → Git checks out middle commits — test each, mark good/bad
git bisect reset                  # End bisect

# Blame (who wrote each line?)
git blame file.txt
git blame -L 10,20 file.txt       # Lines 10-20 only

# Reflog (recover "lost" commits)
git reflog                        # All HEAD movements
git checkout HEAD@{5}             # Go back to previous state

# Clean untracked files
git clean -n                      # Preview (dry run)
git clean -fd                     # Force remove untracked files + dirs

# Submodules
git submodule add <url> <path>    # Add submodule
git clone --recursive <url>       # Clone with submodules
git submodule update --init       # Init submodules after clone
```

---

## 🎯 GitLab-Specific Commands

```bash
# GitLab CLI (glab) commands
glab mr create                    # Create merge request
glab mr list                      # List MRs
glab ci run                       # Run pipeline

# CI variables
glab variable list
glab variable set KEY VALUE

# GitLab CI/CD — .gitlab-ci.yml
stages:
  - build
  - test
  - deploy

build-job:
  stage: build
  script:
    - echo "Building..."
```

---

> *🐙 Git & GitHub Cheatsheet — #LearnDevOpsIn90Days • Module 06*
>
> *Maintainer: [Aryashree Pritikrishna](https://github.com/aryashreep)*
