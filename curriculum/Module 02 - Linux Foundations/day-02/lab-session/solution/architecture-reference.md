# 🧪 Day 02 Solution: Architecture & Processes

**Jagu:** "Shabash Golu! Tune Linux ke brain (Kernel) aur nervous system (systemd) ki functioning samajh li hai. Ye raha tera reference report!"

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
"Golu, hamesha yaad rakh: `systemd` hi wo pehla process hai (PID 1) jo baaki sabko uthata hai. Agar systemd down, toh pura server down!"

---
*#LearnDevOpsIn90Days • Day 02 • Golu & Jagu Edition*
