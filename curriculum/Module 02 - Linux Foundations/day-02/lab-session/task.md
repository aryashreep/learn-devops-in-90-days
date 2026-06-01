# 🧪 Lab Session: Day 02 — Architecture & Processes

**Jagu:** "Beep Boop! Golu, aaj hum Linux ke 'Brain' aur 'Heart' ko dekhenge. System kaise chalta hai aur processes kaise manage hote hain, ye seekhna bahut zaroori hai!"

## 🎯 Task Objectives
- Explain core Linux components.
- Identify process states.
- List daily essential commands.

## 🛠️ Hands-on Challenges

1.  **Architecture Map:** Create a note describing the relationship between Hardware, Kernel, Shell, and User Space.
2.  **Process Detective:** Use `ps aux` or `top` to find:
    - One process in a **Running (R)** state.
    - One process in a **Sleeping (S)** state.
3.  **The Master Control:** Use `systemctl list-units --type=service` to see which services are currently active on your machine.
4.  **Identity Trace:** Use `pstree` (install if missing) to see the hierarchy of processes starting from `systemd`.
5.  **Status Check:** Pick a service like `ssh` or `docker` and use `systemctl status <name>` to see its uptime and PID.

---

### ✅ Proof of Work
**Jagu:** "Golu, apna 'Architecture Report' ready karo!"

1. Create a file named **`linux-architecture-notes.md`** in the **`solution/`** folder.
2. Record your process state findings and daily command list.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 02 • Golu & Jagu Edition*
