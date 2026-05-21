# 🗓️ Day 05 — Linux Troubleshooting Drill: CPU, Memory, and Logs

Welcome to **Day 05** of the **#LearnDevOpsIn90Days** challenge 🚀

Today's goal is to **run a focused troubleshooting drill**.

You will pick a running process/service on your system and:

* Capture a quick health snapshot (CPU, memory, disk, network)
* Trace logs for that service
* Write a **mini runbook** describing what you did and what you'd do next if things were worse

This turns yesterday's practice into a repeatable troubleshooting routine.

### What's a runbook?

A **runbook** is a short, repeatable checklist you follow during an incident: the exact commands you run, what you observed, and the next actions if the issue persists. Keep it concise so you can reuse it under pressure.

---

# 🎯 Today's Goals

✅ Capture a system health snapshot (CPU, memory, disk, network)

✅ Trace logs for a chosen service

✅ Write a mini runbook with commands, observations, and next steps

✅ Share your progress publicly

---

# 📌 Tasks for Today

## 1️⃣ Create Your Runbook

Create a markdown file named `linux-troubleshooting-runbook.md` or a hand-written runbook (Recommended).

Your runbook should include both the commands you ran and brief interpretations.

---

## 2️⃣ Follow the Guidelines

Run and record output for **at least 8 commands** (save snippets in your runbook):

* **Environment basics (2):** `uname -a`, `lsb_release -a` (or `cat /etc/os-release`)
* **Filesystem sanity (2):** create a throwaway folder and file, e.g., `mkdir /tmp/runbook-demo`, `cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo`
* **CPU / Memory (2):** `top`/`htop`/`ps -o pid,pcpu,pmem,comm -p <pid>`, `free -h`, `vm_stat` (mac)
* **Disk / IO (2):** `df -h`, `du -sh /var/log`, `iostat`/`vmstat`/`dstat`
* **Network (2):** `ss -tulpn`/`netstat -tulpn`, `curl -I <service-endpoint>`/`ping`
* **Logs (2):** `journalctl -u <service> -n 50`, `tail -n 50 /var/log/<file>.log`

Choose **one target service/process** (e.g., `ssh`, `cron`, `docker`, your web app) and stick to it for the drill.

For each command, add a 1–2 line note on what you observed (e.g., "CPU spikes to 80% when restarting", "No recent errors in last 50 lines").

End with a **"If this worsens"** section listing 3 next steps you would take (ex: restart strategy, increase log verbosity, collect `strace`).

Keep it concise and actionable (aim for ~1 page).

Suggested structure for `linux-troubleshooting-runbook.md`:

* Target service / process
* Snapshot: CPU & Memory
* Snapshot: Disk & IO
* Snapshot: Network
* Logs reviewed
* Quick findings
* If this worsens (next steps)

---

# 📚 Resources

You may refer to:

* Notes from Day 02–04
* Linux `man` pages (`top`, `ps`, `df`, `journalctl`, `ss/netstat`)
* Your class notes

Avoid generic copy/paste. Use outputs from **your** machine.

---

# 🧠 Key Concepts Introduced Today

| Concept              | Meaning                                                 |
| -------------------- | ------------------------------------------------------- |
| Runbook              | A repeatable checklist for incident response             |
| Health Snapshot      | Quick capture of CPU, memory, disk, and network state    |
| Log Tracing          | Reading service logs to find errors and warnings         |
| Escalation Steps     | Pre-planned next actions if the issue worsens            |
| Evidence Collection  | Capturing data before acting (restart, escalate, etc.)   |

---

# ⚙️ Why This Matters for DevOps

Incidents rarely come with perfect clues. A fast, repeatable checklist saves minutes when services misbehave.

This drill builds:

* Habit of capturing evidence before acting
* Confidence reading resource signals (CPU, memory, disk, network)
* Log-first mindset before restarts or escalations

These habits reduce downtime and prevent guesswork in production.

---

# 📝 Mini Assignment

Pick one service, run the full drill, and write your runbook including:

* At least 8 commands with observations
* A "If this worsens" section with 3 next steps

Commit your runbook to GitHub.

---

# 📂 Suggested Folder Structure

```bash
content/day-05/
├── README.md
└── linux-troubleshooting-runbook.md
```

---

# ⭐ Bonus Challenge

Create a LinkedIn post using:

* #LearnDevOpsIn90Days
* #DevOps
* #LearningInPublic

and share:

* 2–3 lines on the checks you ran and one insight
* The service you inspected and one "next step" from your runbook
* Optional: screenshot of your runbook

---

# ✅ Day 05 Checklist

* [ ] Chose a target service/process for the drill
* [ ] Ran and recorded at least 8 commands with observations
* [ ] Created a mini runbook with structured sections
* [ ] Included an "If this worsens" section with next steps
* [ ] Shared progress publicly on LinkedIn
* [ ] Committed Day 05 work to GitHub

---

# 🚀 Next Day

➡️ Day 06 — Linux Fundamentals: Read and Write Text Files
