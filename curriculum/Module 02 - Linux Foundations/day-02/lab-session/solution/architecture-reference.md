# 🧪 Day 02 Solution: Architecture & Processes

**Jagu:** "Well done Golu! Tune includes the functioning of Linux's brain (kernel) and nervous system (systemd). This is your reference report!"

---

## 🛠️ Step-by-Step Command History

### 1. Process Detective
```bash
# Golu checked running and sleeping processes
$ ps aux | head -n 5
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.0 168612  9684 ?        Ss   May20   0:02 /sbin/init
```

### 2. Service Management
```bash
# Check status of a common service
$ systemctl status ssh
● ssh.service - OpenBSD Secure Shell server
     Loaded: loaded (/lib/systemd/system/ssh.service; enabled; vendor preset: enabled)
     Active: active (running)...
```

---

## 💡 Jagu's Pro Tip:
"Golu, always remember: `systemd` is the first process (PID 1) which calls all the others. If systemd down, then entire server down!"

---
*#LearnDevOpsIn90Days • Day 02 • Golu & Jagu Edition*
