# 🧪 Lab Session: Day 12 — The Broken Server Challenge

**Jagu:** "Brother Golu, today is your real test! I mean there are 5 things in the system which are spoiling the life and soul. If the tune has been playing since last 11 days, then you can fix it in 20 minutes!"

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
**Jagu:** "Bravo! Changed the Tune server from 'Dead' to 'Alive'. Prepare the final report!"

1. Create a file named `recovery-log.md` in the **`solution/`** folder.
2. List the 5 fixes you applied and the commands you used.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 12 • Golu & Jagu Edition*
