# 🧪 Lab Session: Day 20 — The Log Analyzer

**Jagu:** "Beep Boop! Golu, imagine karo tumhare pass 10GB ki log file hai. Kya tum manually errors ginoge? Bilkul nahi! Aaj hum ek 'Intelligence Agent' (Script) banayenge jo ye kaam 1 second mein karega."

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
**Jagu:** "Golu, ye script real production troubleshooting mein kaam aayegi. Portfolio mein add karle!"

1. Create a file named **`log-analyzer-project.md`** in the **`solution/`** folder.
2. Paste your `log_analyzer.sh` code and the content of one generated report.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 20 • Golu & Jagu Edition*
