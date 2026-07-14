# 🧪 Lab Session: Day 18 — The Log Analyzer

**Jagu:** "Beep Boop! Golu, imagine you have a log file of 10GB. Do you manually count errors? Absolutely not! Today we will create an 'Intelligence Agent' (Script) which will do this work in 1 second."

## 🎯 Project Objectives
- Write a script that counts "ERROR" and "WARNING" messages in a log.
- Identify the most frequent error message.
- Generate a summary report with the current date.

## 🛠️ Project Challenges

1.  **The Scanner:** Create a script `log_analyzer.sh`.
    - It should take the log file path as an argument: `./log_analyzer.sh access.log`.
2.  **The Counter:** Use `grep -c "ERROR"` to count error lines. Do the same for "WARNING".
3.  **The Reporter:** Create a report file `log_report_$(date +%F).txt` that looks like this:
    ```text
    ---------------------------------
    Log Analysis Report - 2024-05-22
    ---------------------------------
    Total Errors: 45
    Total Warnings: 12
    ---------------------------------
    ```
4.  **The Critical List:** Add a feature that lists the specific line numbers where "CRITICAL" errors occurred.

---

### ✅ Proof of Work
**Jagu:** "Golu, this script will help in real production troubleshooting. Add it to your portfolio!"

1. Create a file named **`log-analyzer-project.md`** in the **`solution/`** folder.
2. Paste your `log_analyzer.sh` code and the content of one generated report.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 18 • Golu & Jagu Edition*
