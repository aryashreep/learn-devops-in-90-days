# 🛠️ Linux Troubleshooting Runbook — Day 05

## 📅 Topic

CPU, Memory, Disk, Network, and Log Troubleshooting

---

# 🎯 Target Service

## Selected Service

```bash id="t2n9sw"
nginx
```

### Why This Service?

* Common production web server
* Easy to inspect logs and resource usage
* Frequently used in DevOps environments

---

# 🖥️ Environment Basics

## 1. Check Kernel and System Information

### Command

```bash id="y3b4lz"
uname -a
```

### Observation

* Displays Linux kernel version and architecture
* Confirms the operating system environment

---

## 2. Check OS Distribution

### Command

```bash id="o2t5mn"
cat /etc/os-release
```

### Observation

* Identified the Linux distribution and version
* Useful during troubleshooting and package management

---

# 📁 Filesystem Sanity Checks

## 3. Create Temporary Test Directory

### Command

```bash id="h9v4xq"
mkdir /tmp/runbook-demo
```

### Observation

* Temporary workspace created successfully

---

## 4. Copy and Verify File

### Command

```bash id="j1z6rw"
cp /etc/hosts /tmp/runbook-demo/hosts-copy
ls -l /tmp/runbook-demo
```

### Observation

* Verified filesystem read/write operations
* Confirmed file permissions and ownership

---

# ⚡ CPU & Memory Snapshot

## 5. Monitor Live Resource Usage

### Command

```bash id="z4v7pc"
top
```

### Observation

* CPU usage remained stable
* No abnormal memory spikes observed

---

## 6. Check Memory Usage

### Command

```bash id="c5w8nd"
free -h
```

### Observation

* Sufficient free memory available
* Swap usage was minimal

---

# 💾 Disk & IO Snapshot

## 7. Check Disk Space

### Command

```bash id="x7k3mr"
df -h
```

### Observation

* Root filesystem had adequate free space
* No partitions nearing full capacity

---

## 8. Check Log Directory Size

### Command

```bash id="n2r8tw"
du -sh /var/log
```

### Observation

* Log directory size was within normal limits
* No unexpected disk growth detected

---

# 🌐 Network Snapshot

## 9. Check Listening Ports

### Command

```bash id="f9u3qe"
ss -tulpn
```

### Observation

* Confirmed nginx listening on port 80
* Verified active network services

---

## 10. Test HTTP Response

### Command

```bash id="w6m1sa"
curl -I http://localhost
```

### Observation

* Received HTTP 200 response
* Web server responding correctly

---

# 📜 Log Review

## 11. Review Service Logs

### Command

```bash id="d3q7ly"
journalctl -u nginx -n 50
```

### Observation

* No critical errors found
* Recent restart logs appeared normal

---

## 12. Review System Logs

### Command

```bash id="r5x9kp"
tail -n 50 /var/log/messages
```

### Observation

* No major warnings detected
* System operating normally

---

# 🔎 Quick Findings

* Nginx service was active and healthy
* CPU and memory usage remained stable
* Disk utilization was normal
* No recent critical errors in logs
* Network connectivity verified successfully

---

# 🚨 If This Worsens

## Next Steps

### 1. Restart Service Safely

```bash id="m7v2rd"
systemctl restart nginx
```

* Restart only after capturing logs and evidence

---

### 2. Increase Log Inspection

```bash id="u8x4tn"
journalctl -u nginx -xe
```

* Review detailed error messages and failures

---

### 3. Capture Process-Level Diagnostics

```bash id="v4c8qy"
strace -p <PID>
```

* Trace system calls if the process becomes unresponsive

---

# 🧠 What I Learned

* Health snapshots help identify issues quickly
* Logs provide valuable troubleshooting context
* Evidence collection should happen before restarting services
* Structured runbooks improve incident response speed

---

# ✅ Summary

* Practiced Linux troubleshooting workflow
* Captured CPU, memory, disk, and network snapshots
* Reviewed nginx service logs
* Created a reusable troubleshooting runbook
* Improved operational debugging skills


