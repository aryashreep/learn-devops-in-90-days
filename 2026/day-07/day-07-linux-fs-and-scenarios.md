# 🐧 Linux File System Hierarchy & Scenario Practice — Day 07

## 📅 Topic
Linux File System Hierarchy and Real-World Troubleshooting Scenarios

---

# 📂 Part 1 — Linux File System Hierarchy

## 1. Root Directory `/`

### Purpose

- The starting point of the Linux filesystem
- All files and directories originate from `/`

### Command

```bash
ls -l /
```

### Observation

- Contains directories like `/home`, `/etc`, `/var`, and `/usr`
- Acts as the top-level directory structure

### I Would Use This When

- Navigating the overall Linux filesystem structure

---

## 2. Home Directory `/home`

### Purpose

- Stores personal files for normal users
- Each user gets a separate home directory

### Command

```bash
ls -l /home
```

### Observation

- Contains user-specific folders
- Example: `/home/devops`

### I Would Use This When

- Managing user files and scripts

---

## 3. Root User Directory `/root`

### Purpose

- Home directory for the root administrator user
- Separate from normal users for security

### Command

```bash
ls -l /root
```

### Observation

- Contains root-level configuration and scripts
- Requires elevated privileges

### I Would Use This When

- Performing administrative troubleshooting tasks

---

## 4. Configuration Directory `/etc`

### Purpose

- Stores system-wide configuration files
- Critical for services and applications

### Command

```bash
ls -l /etc
```

### Observation

- Contains configuration files like `hosts`, `hostname`, and `passwd`

### I Would Use This When

- Updating application or system configurations

---

## 5. Log Directory `/var/log`

### Purpose

- Stores system and application log files
- Essential for troubleshooting

### Command

```bash
ls -l /var/log
```

### Observation

- Contains logs for services like nginx, ssh, and system logs

### I Would Use This When

- Investigating service failures or incidents

---

## 6. Temporary Directory `/tmp`

### Purpose

- Stores temporary files
- Files may be deleted automatically after reboot

### Command

```bash
ls -l /tmp
```

### Observation

- Frequently used by applications during runtime

### I Would Use This When

- Creating temporary scripts or debug files

---

## 7. Binary Directory `/bin`

### Purpose

- Contains essential Linux command binaries

### Command

```bash
ls -l /bin
```

### Observation

- Includes commands like `ls`, `cp`, and `mv`

### I Would Use This When

- Understanding where system commands are stored

---

## 8. User Binary Directory `/usr/bin`

### Purpose

- Stores user-level executable programs

### Command

```bash
ls -l /usr/bin
```

### Observation

- Contains many commonly used applications and utilities

### I Would Use This When

- Verifying installed tools and binaries

---

## 9. Optional Applications `/opt`

### Purpose

- Used for third-party or optional software installations

### Command

```bash
ls -l /opt
```

### Observation

- Often contains manually installed applications

### I Would Use This When

- Managing custom software installations

---

# 🛠️ Hands-On Commands

## Find Largest Log Files

### Command

```bash
du -sh /var/log/* 2>/dev/null | sort -h | tail -5
```

### Observation

- Identified the largest log-consuming files

---

## View Hostname Configuration

### Command

```bash
cat /etc/hostname
```

### Observation

- Displayed the current server hostname

---

## Inspect Home Directory

### Command

```bash
ls -la ~
```

### Observation

- Viewed hidden files like `.bashrc` and `.ssh`

---

# 🔎 Part 2 — Scenario-Based Practice

# ✅ Scenario 1 — Service Not Starting

## Problem

A web application service called `myapp` failed after reboot.

---

### Step 1: Check Service Status

```bash
systemctl status myapp
```

**Why:** Verify whether the service is active, failed, or stopped.

---

### Step 2: Check Service Logs

```bash
journalctl -u myapp -n 50
```

**Why:** Review recent error messages and failures.

---

### Step 3: Check Boot Startup Configuration

```bash
systemctl is-enabled myapp
```

**Why:** Verify whether the service starts automatically during boot.

---

### Step 4: Restart Service

```bash
systemctl restart myapp
```

**Why:** Attempt recovery after reviewing logs.

---

## What I Learned

- Always inspect logs before restarting services

---

# ✅ Scenario 2 — High CPU Usage

## Problem

The application server is responding slowly.

---

### Step 1: Monitor Live CPU Usage

```bash
top
```

**Why:** Identify processes consuming high CPU resources.

---

### Step 2: View Top CPU Consumers

```bash
ps aux --sort=-%cpu | head -10
```

**Why:** Display processes sorted by CPU usage.

---

### Step 3: Identify Process ID

```bash
pgrep nginx
```

**Why:** Retrieve the PID of a specific process.

---

## What I Learned

- CPU-heavy processes can quickly affect application performance

---

# ✅ Scenario 3 — Finding Service Logs

## Problem

A developer wants Docker service logs.

---

### Step 1: Check Service Status

```bash
systemctl status docker
```

**Why:** Confirm whether Docker is active.

---

### Step 2: View Recent Logs

```bash
journalctl -u docker -n 50
```

**Why:** Review recent Docker log entries.

---

### Step 3: Follow Logs Live

```bash
journalctl -u docker -f
```

**Why:** Monitor logs in real time.

---

## What I Learned

- `journalctl` is essential for troubleshooting systemd services

---

# ✅ Scenario 4 — File Permission Issue

## Problem

Script execution failed with `Permission denied`.

---

### Step 1: Check Current Permissions

```bash
ls -l /home/user/backup.sh
```

**Why:** Verify whether execute permission exists.

---

### Step 2: Add Execute Permission

```bash
chmod +x /home/user/backup.sh
```

**Why:** Make the script executable.

---

### Step 3: Verify Updated Permissions

```bash
ls -l /home/user/backup.sh
```

**Why:** Confirm execute permissions were applied.

---

### Step 4: Execute the Script

```bash
./backup.sh
```

**Why:** Validate successful execution.

---

## What I Learned

- Linux requires execute permissions for scripts and binaries

---

# 🧠 Key Takeaways

- Linux directories have specific purposes
- Logs and configs are critical during troubleshooting
- Step-by-step diagnosis prevents guesswork
- File permissions directly affect execution
- Real-world scenarios improve operational confidence

