# 🧪 Day 05 Solution: System Diagnosis Drill

**Jagu:** "Shabash Golu! Tune server ka BP aur Pulse (Vitals) check karna seekh liya hai. Ye raha tera 'Proof of Work' diagnostic report!"

---

## 🛠️ Step-by-Step Command History

### 1. Identify top CPU-consuming processes
```bash
# Sorted by CPU %
$ top -b -o +%CPU | head -n 15
```

### 2. Check disk usage and identify the largest partition
```bash
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   42G  8.0G  84% /
```

### 3. List the last 50 lines of system logs
```bash
$ tail -n 50 /var/log/syslog
```

### 4. Practice killing a dummy process
```bash
# Start dummy
sleep 1000 &
[1] 12345

# Graceful Kill
kill 12345
```

---

## 🔍 Diagnostic Findings

| Component | Status | Observation |
| :--- | :--- | :--- |
| **CPU** | Healthy | Avg load < 1.0. |
| **RAM** | Warning | Chrome using 2GB. |
| **Disk** | Healthy | 15% available. |

---

## 💡 Jagu's Pro Tip:
"Golu, hamesha yaad rakh: `kill -9` aakhri rasta hona chahiye. Pehle `kill` (SIGTERM) try karo taaki process apna kaam samet kar band ho sake!"

---
*#LearnDevOpsIn90Days • Day 05 • Golu & Jagu Edition*
