# 🐧 Linux Foundations — Command Cheatsheet

> **Quick reference for essential Linux commands: navigation, file operations, permissions, processes, networking, and package management.**
>
> *Print-friendly — designed for Cmd+P / PDF export.*

---

## 📁 File System Navigation

| Command | Description | Example |
|---------|-------------|---------|
| `pwd` | Print working directory | `/home/user/projects` |
| `ls` | List directory contents | `ls -la /var/log` |
| `cd` | Change directory | `cd /etc/nginx` |
| `tree` | Show directory tree | `tree -L 2 /app` |
| `du -sh` | Disk usage summary | `du -sh /var/log/*` |
| `df -h` | Disk free space | `df -h` |

### FHS — Filesystem Hierarchy Standard

| Path | Purpose |
|------|---------|
| `/` | Root — top of the filesystem tree |
| `/bin` | Essential user binaries (ls, cp, cat) |
| `/sbin` | System binaries (fdisk, mkfs) |
| `/etc` | Configuration files (nginx.conf, passwd) |
| `/var` | Variable data — logs, databases, caches |
| `/tmp` | Temporary files (cleared on reboot) |
| `/home` | User home directories |
| `/root` | Root user's home directory |
| `/opt` | Optional third-party software |
| `/usr` | User system resources (bin, lib, share) |

```text
/ ──┬── bin/     → Commands (cat, ls, cp)
    ├── sbin/    → System commands (fdisk, mkfs)
    ├── etc/     → Config files
    ├── var/ ──┬── log/   → Log files
    │           ├── www/   → Web server files
    │           └── spool/ → Print/mail queues
    ├── home/   → User data
    ├── tmp/    → Temp files
    └── opt/    → Third-party apps
```

---

## 📄 File Operations

| Command | Description | Example |
|---------|-------------|---------|
| `touch` | Create empty file / update timestamp | `touch file.txt` |
| `cp` | Copy files/directories | `cp -r src/ dest/` |
| `mv` | Move or rename | `mv old.txt new.txt` |
| `rm` | Remove files | `rm -rf dir/` |
| `mkdir` | Create directory | `mkdir -p a/b/c` |
| `cat` | Display file content | `cat file.txt` |
| `less` | View file page by page | `less /var/log/syslog` |
| `head` | First 10 lines | `head -n 20 file.log` |
| `tail` | Last 10 lines | `tail -f /var/log/nginx/access.log` |
| `wc` | Word/line/char count | `wc -l file.txt` |
| `find` | Search for files | `find /etc -name "*.conf"` |
| `grep` | Search file content | `grep -r "ERROR" /var/log/` |
| `sort` | Sort lines | `sort -u names.txt` |
| `uniq` | Filter duplicate lines | `sort file \| uniq -c` |
| `cut` | Extract columns | `cut -d',' -f1,3 data.csv` |
| `tee` | Write to file + stdout | `echo "data" \| tee file.txt` |

### Redirection

```bash
cmd > file        # stdout → file (overwrite)
cmd >> file       # stdout → file (append)
cmd 2> file       # stderr → file
cmd &> file       # stdout + stderr → file
cmd < file        # Read input from file
cmd1 | cmd2       # Pipe cmd1's output to cmd2
2>&1              # Redirect stderr to stdout
```

---

## 🔐 Permissions & Ownership

### Permission Format

```text
-rwxr-xr-x  1 golu devops  1024 Jul 10 12:00 script.sh
│││││││││
││││││││└── Other (world) permissions
│││││││└─── Group permissions
││││││└──── Owner permissions
│││││└─────── Special permissions
││││└───────── File type (-=file, d=dir, l=symlink)
```

| Octal | rwx | Permission |
|-------|-----|------------|
| 0 | `---` | None |
| 1 | `--x` | Execute |
| 2 | `-w-` | Write |
| 3 | `-wx` | Write + Execute |
| 4 | `r--` | Read |
| 5 | `r-x` | Read + Execute |
| 6 | `rw-` | Read + Write |
| 7 | `rwx` | Full control |

### Permission Commands

```bash
# Change permissions
chmod 755 script.sh           # rwxr-xr-x (owner=all, group=rx, other=rx)
chmod u+x script.sh           # Add execute for user
chmod g-w file.txt            # Remove write for group
chmod -R 644 /var/www/html/   # Recursive change

# Change ownership
chown user:group file.txt     # Change user + group
chown -R www-data:www-data /var/www/   # Recursive
chgrp devops file.txt         # Change group only

# Special permissions
chmod u+s script     # SetUID — run as owner
chmod g+s directory  # SetGID — inherit group
chmod +t /tmp        # Sticky bit — prevent deletion by others
```

---

## ⚙️ Process Management

| Command | Description | Example |
|---------|-------------|---------|
| `ps` | Process snapshot | `ps aux \| grep nginx` |
| `top` | Interactive process viewer (real-time) | `top` |
| `htop` | Enhanced top (if installed) | `htop` |
| `kill` | Send signal to process | `kill -9 1234` |
| `killall` | Kill by name | `killall nginx` |
| `pgrep` | Find PID by name | `pgrep -f "python app"` |
| `pkill` | Kill process by name | `pkill -f "node server"` |
| `nohup` | Run immune to hangups | `nohup ./script.sh &` |
| `bg` / `fg` | Background / Foreground jobs | `Ctrl+Z → bg` |
| `jobs` | List background jobs | `jobs -l` |
| `systemctl` | Systemd service manager | `systemctl status nginx` |

### Common Signals

| Signal | Number | Description |
|--------|--------|-------------|
| SIGHUP | 1 | Reload config (graceful restart) |
| SIGINT | 2 | Interrupt (Ctrl+C) |
| SIGKILL | 9 | Force kill (cannot be caught) |
| SIGTERM | 15 | Graceful termination |
| SIGSTOP | 19 | Pause process (Ctrl+Z) |
| SIGCONT | 18 | Resume paused process |

---

## 🌐 Networking Commands

| Command | Description | Example |
|---------|-------------|---------|
| `ip addr` | Show network interfaces | `ip addr show eth0` |
| `ip route` | Show routing table | `ip route \| grep default` |
| `ping` | Test connectivity | `ping -c 4 google.com` |
| `ss` | Socket statistics | `ss -tuln` |
| `netstat` | Network stats (older) | `netstat -tulnp` |
| `curl` | HTTP requests | `curl -I https://example.com` |
| `wget` | Download files | `wget https://example.com/file` |
| `scp` | Secure copy | `scp file.txt user@host:/tmp/` |
| `dig` | DNS lookup | `dig +short google.com` |
| `nslookup` | DNS query | `nslookup example.com` |
| `traceroute` | Trace network path | `traceroute google.com` |
| `tcpdump` | Packet capture | `tcpdump -i eth0 port 80` |
| `nc` | Netcat — TCP/UDP Swiss army knife | `nc -zv host 22` |
| `ss -tuln` | | |
| `ufw status` | Firewall status | `sudo ufw status verbose` |

### Port Checking

```bash
# Is port 80 open?
ss -tuln | grep :80

# Test TCP connection
nc -zv google.com 80

# Check listening services
netstat -tulnp | grep LISTEN
```

---

## 📦 Package Management

| Distribution | Update | Install | Remove | Search |
|-------------|--------|---------|--------|--------|
| **Ubuntu/Debian (apt)** | `apt update && apt upgrade` | `apt install nginx` | `apt remove nginx` | `apt search nginx` |
| **RHEL/CentOS (yum)** | `yum update` | `yum install nginx` | `yum remove nginx` | `yum search nginx` |
| **Fedora (dnf)** | `dnf update` | `dnf install nginx` | `dnf remove nginx` | `dnf search nginx` |
| **Alpine (apk)** | `apk update` | `apk add nginx` | `apk del nginx` | `apk search nginx` |

---

## 🧵 Text Processing

```bash
# Find and replace
sed 's/old/new/g' file.txt > file_new.txt
sed -i 's/old/new/g' file.txt    # In-place

# Print specific columns
awk '{print $1, $NF}' access.log

# Extract field from CSV
cut -d',' -f1,3 data.csv

# Count occurrences
grep -c "ERROR" app.log
grep "ERROR" app.log | wc -l

# Top 10 most frequent IPs
awk '{print $1}' access.log | sort | uniq -c | sort -rn | head -10
```

---

## 🔍 Troubleshooting Checklist

```bash
# 1. What's the error?
journalctl -xe                           # Systemd journal
tail -100 /var/log/syslog                # System log
tail -f /var/log/nginx/error.log         # App log

# 2. Are resources okay?
top / htop                               # CPU & memory
df -h                                    # Disk space
free -h                                  # Memory usage
uptime                                   # Load average

# 3. Is the service running?
systemctl status nginx
systemctl restart nginx

# 4. Network connectivity?
ping -c 3 google.com
curl -I http://localhost:8080/health
ss -tuln | grep :8080

# 5. Check recent changes
ls -lt /etc/ | head -20
history | tail -20
```

---

## ⏰ Cron & Scheduling

```text
# ┌───────── minute (0 - 59)
# │ ┌───────── hour (0 - 23)
# │ │ ┌───────── day of month (1 - 31)
# │ │ │ ┌───────── month (1 - 12)
# │ │ │ │ ┌───────── day of week (0 - 6, 0=Sunday)
# * * * * * command
```

```bash
# Edit crontab
crontab -e

# Common patterns
* * * * *         # Every minute
*/5 * * * *       # Every 5 minutes
0 * * * *         # Every hour
0 3 * * *         # Daily at 3 AM
0 0 * * 0         # Weekly (Sunday midnight)
0 0 1 * *         # Monthly (1st)
0 0 * * 1-5       # Weekdays at midnight
@daily            # Equivalent to 0 0 * * *
@reboot           # On system boot
```

---

> *🐧 Linux Foundations Cheatsheet — #LearnDevOpsIn90Days • Module 02*
>
> *Maintainer: [Aryashree Pritikrishna](https://github.com/aryashreep)*
