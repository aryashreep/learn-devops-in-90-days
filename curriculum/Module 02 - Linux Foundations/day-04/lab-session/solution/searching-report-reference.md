# 🧪 Day 04 Solution: Searching Mastery

**Jagu:** "Well done Golu! Tune has mastered Linux's 'Search Engines'. Here is your 'Proof of Work' reference report!"

---

## 🛠️ Step-by-Step Command History

### 1. Find all log files in `/var/log`
```bash
# L=long format, name pattern filter
find /var/log -name "*.log"
```

### 2. Search for "error" (case-insensitive) in all log files
```bash
# -i for case-insensitive, -r for recursive
grep -ri "error" /var/log/*.log
```

### 3. Find files larger than 1MB in `/etc`
```bash
# -size +1M finds files OVER 1 megabyte
find /etc -type f -size +1M
```

### 4. Find the exact path of the `python3` binary
```bash
$ which python3
/usr/bin/python3
```

---

## 🔍 Discovery Observations

### Top Search Pattern
`find . -name "*.conf" | xargs grep -i "port"`
> "Golu, this pipeline command is most useful for finding configurations!" — Jagu

---

## 💡 Jagu's Pro Tip:
"Golu, if the file is not found immediately, use `locate`, but don't forget to run `sudo updatedb` first. `find` is fresh, `locate` is fast!"

---
*#LearnDevOpsIn90Days • Day 04 • Golu & Jagu Edition*
