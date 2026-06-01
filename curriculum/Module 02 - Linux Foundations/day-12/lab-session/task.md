# 🧪 Lab Session: Day 12 — The Broken Server Challenge

**Jagu:** "Bhai Golu, aaj tera asali imtehaan (test) hai! Maine is system mein 5 cheezein jaan-boojh kar kharab ki hain. Agar tune pichle 11 din dhang se padha hai, toh tu ise 20 min mein fix kar lega!"

## 🎯 Task Objectives
- Perform a full system audit.
- Fix broken permissions and ownership.
- Clean up "Zombie" processes and find hidden files.

## 🛠️ The "Broken" Scenarios (Fix these!)

1.  **The Ghost File:** There is a file named `.hidden_key` somewhere in `/etc`. Find its exact path.
2.  **Permission Hell:** The script `/tmp/fix_me.sh` exists but won't run. Fix it without using `777`.
3.  **Ownership Crisis:** The folder `/opt/app-data` is owned by `nobody`. Change it back to your current user.
4.  **The Resource Hog:** There is a `sleep 9999` process eating up a slot in the process table. Find its PID and kill it.
5.  **The Log Overflow:** A file in `/var/log/dummy.log` has 1000 lines of junk. Show only the last 10 lines to prove you can read it.

---

### ✅ Proof of Work
**Jagu:** "Shabash! Tune server ko 'Dead' se 'Alive' kar diya. Final report ready kar!"

1. Create a file named `recovery-log.md` in the **`solution/`** folder.
2. List the 5 fixes you applied and the commands you used.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 12 • Golu & Jagu Edition*
