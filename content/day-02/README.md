# 🗓️ Day 02 — Linux Architecture, Processes, and systemd

Welcome to **Day 02** of the **#LearnDevOpsIn90Days** challenge 🚀

Today we go under the hood of Linux — the OS powering almost every production system you'll work with as a DevOps engineer.

If you know how processes and systemd work, you can debug crashed services, fix CPU/memory issues, and understand logs confidently.

---

# 🎯 Today's Goals

✅ Understand the core components of Linux (kernel, user space, init/systemd)

✅ Learn how processes are created and managed

✅ Know what systemd does and why it matters

✅ Document your notes and share your progress

---

# 📌 Tasks for Today

## 1️⃣ Study Linux Architecture

Read the class material in [`module-2-linux-for-devOps/Linux_Foundations.pdf`](./module-2-linux-for-devOps/Linux_Foundations.pdf) and/or the resources listed below.

Focus on three areas:

* **Kernel** — what it does, how it talks to hardware
* **User Space** — where applications and shells live
* **init / systemd** — PID 1, the process that starts everything else

---

# 2️⃣ Understand Process Management

Learn how Linux creates and manages processes:

* `fork()` + `exec()` lifecycle
* Process states (Running, Sleeping, Stopped, Zombie)
* Parent-child relationship — the process tree starting from PID 1

---

# 3️⃣ Write Your Notes

Create a markdown file or hand-written notes covering:

* Linux core components
* Process states with one-line explanations
* 5 commands you'd use daily
* What systemd does

Keep it **short and practical** — under 1 page, bullet format.

---

# 📖 Linux Core Components

Linux has three main layers:

* **Kernel** — the core; only layer that talks directly to CPU, RAM, and hardware
* **User Space** — where all applications and shells run; communicates with kernel via system calls
* **init / systemd** — PID 1; the first process started at boot; manages all other services

## How Processes Work

* Every program running on Linux is a **process** — identified by a unique PID
* Processes are created with `fork()` (copy parent) followed by `exec()` (load new program)
* Every process has a **parent**; the tree starts at PID 1 (systemd)

---

# 🧠 Key Concepts Introduced Today

| Concept | Meaning |
| -------------- | ------------------------------------------- |
| Kernel | Core layer that manages hardware directly |
| User Space | Where applications and shells run |
| systemd | PID 1; starts/stops all services at boot |
| Process | A running program identified by a PID |
| fork() + exec() | How Linux creates new processes |

---

# ⚙️ Process States

| State | What it means |
| ------------------ | -------------------------------------------------- |
| **Running (R)** | Actively using CPU right now |
| **Sleeping (S)** | Waiting for I/O or an event (interruptible) |
| **Sleeping (D)** | Waiting for I/O — cannot be interrupted (e.g. disk read) |
| **Stopped (T)** | Paused — e.g. by Ctrl+Z or a debugger |
| **Zombie (Z)** | Finished but parent hasn't read its exit code yet |

---

# 🚀 What systemd Does

systemd replaced old SysVinit and is now the standard init system:

* Starts and stops **services** (nginx, docker, ssh, etc.)
* Faster parallel boot — services start simultaneously
* Manages dependencies: "start nginx only after network is ready"
* Keeps logs via **journald** — readable with `journalctl`

> "systemd is the first process (PID 1) that runs at boot. Everything else is a child of systemd."

---

# 🛠️ 5 Commands You Should Use Daily

```bash
ps aux                   # List all running processes
top                      # Live CPU/memory view of all processes
systemctl status nginx   # Check if a service is running
kill <PID>               # Send SIGTERM — graceful stop (use kill -9 only as last resort)
journalctl -u nginx -f   # Follow live logs for a service
```

---

# 📚 Resources

📺 Recommended resources:

## Linux `man` pages

* `man ps`, `man top`, `man systemctl`

## Official systemd Docs

https://systemd.io

## Class Material

[`Linux_Foundations.pdf`](./module-2-linux-for-devOps/Linux_Foundations.pdf)

## Linux Process Management — Red Hat

https://www.redhat.com/en/topics/linux

> Avoid copying/pasting AI-generated content. Focus on understanding.

---

# 📝 Mini Assignment

Write short notes that cover:

* Your understanding of Linux architecture,
* the 5 process states with one-line explanations,
* and 5 commands you would use daily as a DevOps engineer.

Commit your notes to GitHub.

---

# 📂 Suggested Folder Structure

```bash
content/day-02/
├── README.md
├── linux-architecture-notes.md
└── module-2-linux-for-devOps/
    └── Linux_Foundations.pdf
```

---

# ⭐ Bonus Challenge

Create a LinkedIn post using:

* #LearnDevOpsIn90Days
* #Linux
* #DevOps
* #LearningInPublic

and share:

* what you learned about Linux internals today,
* one systemd command you found useful,
* and optionally a screenshot of your notes.

---

# ✅ Day 02 Checklist

* [ ] Read Linux architecture material
* [ ] Understood process states (running, sleeping, stopped, zombie)
* [ ] Listed 5 daily commands with explanations
* [ ] Wrote learning notes (bullet format, under 1 page)
* [ ] Shared progress publicly on LinkedIn
* [ ] Committed Day 02 work to GitHub

---

# 🚀 Next Day

➡️ Day 03 — Linux File System, Permissions, and Users
