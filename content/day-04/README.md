# 🗓️ Day 04 — Linux Practice: Processes and Services

Welcome to **Day 04** of the **#LearnDevOpsIn90Days** challenge 🚀

Today's goal is to **practice Linux fundamentals with real commands**.

You will create a short practice note by actually running basic commands and capturing what you see:

* Check running processes
* Inspect one systemd service
* Capture a small troubleshooting flow

This is hands-on. Keep it simple and focused on fundamentals.

---

# 🎯 Today's Goals

✅ Run and record process, service, and log commands on your system

✅ Inspect one systemd service end-to-end

✅ Build a practice note showing real command output

✅ Share your progress publicly

---

# 📌 Tasks for Today

## 1️⃣ Create Your Practice Note

Create a markdown file named `linux-practice.md` or a hand-written practice log (Recommended).

Your note should show what you actually ran on your system.

---

## 2️⃣ Follow the Guidelines

Run and record output for **at least 6 commands**:

* **Process commands (2+):** `ps`, `top`, `pgrep`, etc.
* **Service commands (2+):** `systemctl status`, `systemctl list-units`, etc.
* **Log commands (2+):** `journalctl -u <service>`, `tail -n 50`, etc.

Pick **one service on your system** (example: `ssh`, `cron`, `docker`) and inspect it.

Suggested structure for `linux-practice.md`:

* Process checks
* Service checks
* Log checks
* Mini troubleshooting steps

Keep it **simple and actionable**.

---

# 📚 Resources

You may refer to:

* Your notes from Day 02 and Day 03
* Linux `man` pages
* Your class notes

---

# 🧠 Key Concepts Introduced Today

| Concept            | Meaning                                               |
| ------------------ | ----------------------------------------------------- |
| Process Inspection | Viewing running processes and their resource usage     |
| systemd Services   | Managing services with systemctl (start/stop/status)  |
| journalctl         | Reading systemd service logs                          |
| Service Health     | Checking if a service is active, enabled, or failed   |
| Log Analysis       | Reading recent log entries to diagnose issues          |

---

# ⚙️ Why This Matters for DevOps

Hands-on practice builds speed and confidence.

When issues happen in production, you won't have time to search for basic commands.
This day helps you build muscle memory with Linux fundamentals.

---

# 📝 Mini Assignment

Pick one service on your system and document:

* Its current status
* Its recent logs (last 50 lines)
* Whether it is enabled on boot

Commit your practice note to GitHub.

---

# 📂 Suggested Folder Structure

```bash
content/day-04/
├── README.md
└── linux-practice.md
```

---

# ⭐ Bonus Challenge

Create a LinkedIn post using:

* #LearnDevOpsIn90Days
* #DevOps
* #LearningInPublic

and share:

* 2–3 lines on the Linux commands you practiced
* One service you inspected and what you learned
* Optional: screenshot of your practice note

---

# ✅ Day 04 Checklist

* [ ] Ran and recorded at least 6 commands
* [ ] Inspected one systemd service (status, logs, enabled)
* [ ] Created a practice note with real command output
* [ ] Wrote learning notes
* [ ] Shared progress publicly on LinkedIn
* [ ] Committed Day 04 work to GitHub

---

# 🚀 Next Day

➡️ Day 05 — Linux Troubleshooting Drill: CPU, Memory, and Logs
