# 🧪 Lab Session: Day 17 — The Backup Project

**Jagu:** "Beep Boop! Golu, today we will work with an original 'DevOps Hero'. Logs on the servers are flowing so much that the disk becomes full. Today we will create a script that will clean them and take a backup!"

## 🎯 Project Objectives
- Build a script that finds files older than X days.
- Compress those files into a `.tar.gz` archive with a date-stamp.
- Schedule the script to run automatically every night.

## 🛠️ Project Challenges

1.  **The Architect:** Create a script `backup_manager.sh`.
    - Define a variable `BACKUP_DIR="/home/$USER/backups"`.
    - Create the directory if it doesn't exist (`mkdir -p`).
2.  **The Packer:** Use the `tar -cvzf` command to compress a dummy log folder into a file named `log_backup_$(date +%Y-%m-%d).tar.gz`.
3.  **The Cleaner:** Research and add a line to your script that deletes backups older than 7 days (Hint: use `find -mtime +7 -delete`).
4.  **The Clock:** Open your crontab with `crontab -e`.
    - Add a line to run your script every day at **03:00 AM**.
    - Verify with `crontab -l`.

---

### ✅ Proof of Work
**Jagu:** "Golu, this script will make you a star in your resume! Save the complete code."

1. Create a file named **`backup-project.md`** in the **`solution/`** folder.
2. Paste the full code of your `backup_manager.sh` and your **Crontab line**.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 17 • Golu & Jagu Edition*
