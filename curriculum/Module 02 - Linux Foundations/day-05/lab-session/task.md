# 🧪 Lab Session: Day 05 — System Diagnosis Drill

**Jagu:** "Golu, imagine karo server slow hai aur Manager sir khade hain! Aaj hum seekhenge ki pressure mein system health kaise check karte hain."

## 🎯 Task Objectives
- Use `top` and `df` to check resource health.
- Perform a live log "Tail" to see what's happening NOW.
- Practice the art of safe process management.

## 🛠️ Hands-on Challenges

1.  **CPU Spy:** Run `top` (or `htop` if installed). Press `P` to sort by CPU. Identify the top 3 processes.
2.  **Disk Check:** Run `df -h`. Which partition is the most full? Record the percentage.
3.  **Log Tailing:** Use `tail -f /var/log/syslog` (or `journalctl -f`) and watch the live stream for 30 seconds.
4.  **The Zombie Hunt:** Use `ps aux` and `grep` to see if there are any "Z" (Zombie) processes.
5.  **Safe Kill:** Start a dummy process `sleep 1000 &`. Find its PID and use `kill` to stop it gracefully.

---

### ✅ Proof of Work
**Jagu:** "Shabash Golu! Apna diagnostic report ready karo."

1. Create a file named `health-check.md` in the **`solution/`** folder.
2. Record your top CPU processes and disk usage stats.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 05 • Golu & Jagu Edition*
