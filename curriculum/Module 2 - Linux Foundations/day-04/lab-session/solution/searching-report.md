# 🗓️ Linux Search & Discovery Practice

Welcome to the Linux search practice session 🚀

In this exercise, I practiced using:
- `find`
- `grep`
- `which`
- `whereis`
- Linux pipes (`|`)

These commands are essential for DevOps engineers during troubleshooting, log analysis, and system administration.

---

# 🎯 Task Objectives

- Master the `find` command for file discovery
- Use `grep` to search inside files
- Understand the difference between `locate`, `which`, and `whereis`
- Practice combining commands using pipes

---

# 🛠️ Hands-on Challenges

---

# 1️⃣ The Log Hunter

## Goal

Find all `.log` files inside `/var/log`

## Command

```bash
find /var/log -type f -name "*.log"
```

## Example Output

```bash
/var/log/messages.log
/var/log/nginx/access.log
/var/log/nginx/error.log
/var/log/secure.log
```

## What I Learned

- `find` recursively searches directories
- `-type f` filters only files
- `-name "*.log"` searches by filename pattern

---

# 2️⃣ Error Search

## Goal

Search for the word "error" (case-insensitive) inside log files

## Command

```bash
grep -Ri "error" /var/log
```

## Example Output

```bash
/var/log/nginx/error.log: connection refused
/var/log/messages.log: failed to start service
```

## What I Learned

- `grep` searches inside file contents
- `-i` ignores uppercase/lowercase
- `-R` searches recursively through folders

---

# 3️⃣ Big File Alert

## Goal

Search `/etc` for files larger than 1MB

## Command

```bash
find /etc -type f -size +1M
```

## Example Output

```bash
/etc/ssl/certs/ca-bundle.crt
```

## What I Learned

- `-size +1M` filters files larger than 1MB
- Useful for identifying unexpectedly large files

---

# 4️⃣ Binary Trace

## Goal

Find the exact path of `python3` and `git`

## Commands

```bash
which python3
which git
```

## Example Output

```bash
/usr/bin/python3
/usr/bin/git
```

## Additional Command

```bash
whereis python3
```

## Example Output

```bash
python3: /usr/bin/python3 /usr/lib/python3
```

## What I Learned

| Command | Purpose |
|----------|----------|
| `which` | Shows executable path |
| `whereis` | Shows binary, source, and man page locations |
| `locate` | Searches indexed file database quickly |

---

# 5️⃣ Piping Fun

## Goal

List files in `/bin` and filter names containing "zip"

## Command

```bash
ls /bin | grep zip
```

## Example Output

```bash
bunzip2
bzip2
gzip
gunzip
zip
unzip
```

## What I Learned

- `|` passes output from one command into another
- `grep` filters matching results
- Pipes are heavily used in Linux automation

---

# 📚 Bonus Practice

## Locate a File Quickly

```bash
locate nginx.conf
```

## Update Locate Database

```bash
updatedb
```

## Find Recently Modified Files

```bash
find /var/log -mtime -1
```

---

# 🧠 Key Concepts Learned

| Concept | Meaning |
|----------|----------|
| `find` | Search files and directories |
| `grep` | Search inside file contents |
| `which` | Locate executable binaries |
| `whereis` | Locate binaries and manual pages |
| `locate` | Fast indexed file search |
| Pipe (`|`) | Combine Linux commands |

---

# ⚙️ Why This Matters for DevOps

These commands help DevOps engineers:

- Troubleshoot production issues
- Search logs quickly
- Locate configuration files
- Identify installed binaries
- Automate repetitive tasks

Efficient searching saves time during incidents and debugging.

---

# 🚀 Final Thoughts

Linux searching tools are extremely powerful.

The better you become at:
- finding files,
- searching logs,
- filtering output,

the faster you can troubleshoot real production systems as a DevOps engineer 🚀