# 🗓️ Day 05 — System Diagnosis Drill

> **Jagu:** "Golu, imagine karo server slow hai aur Manager sir khade hain! Aaj hum seekhenge ki pressure mein system health kaise check karte hain." 🚀

---

# 🎯 Task Objectives

- Use `top` and `df` to check system resource health
- Perform live log monitoring using `tail -f`
- Practice safe process management
- Build confidence in Linux troubleshooting

---

# 🛠️ Hands-on Challenges

---

# 1️⃣ CPU Spy

## Goal

Check CPU usage and identify top running processes.

## Command Used

```bash
top
```

### Action Performed

- Pressed `P` inside `top`
- Sorted processes by CPU usage

## Top 3 CPU Processes

| PID | Process | CPU Usage |
|-----|----------|------------|
| 2451 | java | 32.5% |
| 1980 | nginx | 12.1% |
| 3012 | mysqld | 9.8% |

## What I Learned

- `top` gives real-time system monitoring
- Sorting by CPU helps identify heavy processes quickly
- Useful during production slowness troubleshooting

---

# 2️⃣ Disk Check

## Goal

Check disk usage across mounted partitions.

## Command Used

```bash
df -h
```

## Example Output

```bash
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   38G   10G  80% /
tmpfs           2.0G     0  2.0G   0% /dev/shm
```

## Most Used Partition

| Partition | Usage |
|------------|-------|
| `/dev/sda1` | 80% |

## What I Learned

- `df -h` shows disk usage in human-readable format
- High disk usage can cause application failures and slowdowns
- `/` partition should be monitored carefully

---

# 3️⃣ Log Tailing

## Goal

Watch live logs for real-time activity.

## Command Used

```bash
tail -f /var/log/messages
```

## Alternative Command

```bash
journalctl -f
```

## Example Output

```bash
May 22 10:15:21 server nginx[2451]: worker process started
May 22 10:15:25 server sshd[1200]: Accepted password for root
```

## What I Learned

- `tail -f` streams live logs continuously
- Helpful for monitoring services during deployments or incidents
- Useful for debugging real-time errors

---

# 4️⃣ The Zombie Hunt

## Goal

Check for zombie processes.

## Command Used

```bash
ps aux | grep Z
```

## Example Output

```bash
root     3210  0.0  0.0      0     0 ?        Z    10:22   0:00 [test] <defunct>
```

## What I Learned

- Zombie processes show state `Z`
- Zombies are completed processes waiting for parent cleanup
- Too many zombies may indicate process management issues

---

# 5️⃣ Safe Kill

## Goal

Create and safely terminate a dummy process.

## Step 1 — Start Dummy Process

```bash
sleep 1000 &
```

## Step 2 — Find Process PID

```bash
ps aux | grep sleep
```

## Example Output

```bash
root     4120  0.0  0.0   4344   700 pts/0    S    10:30   0:00 sleep 1000
```

## Step 3 — Kill Process Gracefully

```bash
kill 4120
```

## Verify Process Stopped

```bash
ps aux | grep sleep
```

## What I Learned

- `kill` sends termination signals to processes
- Graceful termination is safer than force kill (`kill -9`)
- Always verify before and after killing a process

---

# 📚 Key Commands Practiced

| Command | Purpose |
|----------|----------|
| `top` | Monitor CPU and memory usage |
| `df -h` | Check disk space usage |
| `tail -f` | Watch live logs |
| `ps aux` | List running processes |
| `grep` | Filter command output |
| `kill` | Stop a running process |

---

# ⚙️ Why This Matters for DevOps

These commands are essential during:
- Production incidents
- Server slowdowns
- Log investigations
- Resource bottlenecks
- Emergency troubleshooting

Fast diagnosis reduces downtime and improves reliability.

---

# ✅ Proof of Work

- [x] Checked CPU usage using `top`
- [x] Identified top processes
- [x] Checked disk usage using `df -h`
- [x] Monitored live logs
- [x] Searched for zombie processes
- [x] Started and stopped a dummy process safely

---

# 🚀 Final Thoughts

Today I practiced basic Linux system diagnostics like a DevOps engineer.

The more I practice:
- monitoring resources,
- reading logs,
- managing processes,

the faster I can troubleshoot real-world production systems 🚀

---

*#LearnDevOpsIn90Days • Day 05 • Golu & Jagu Edition*