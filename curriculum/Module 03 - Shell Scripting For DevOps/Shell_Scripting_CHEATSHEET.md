# 🐚 Shell Scripting — Command & Concept Cheatsheet

> **Quick reference for Bash scripting: variables, conditionals, loops, functions, file operations, and production-safety patterns.**
>
> *Print-friendly — designed for Cmd+P / PDF export.*

---

## 📋 Script Structure

```bash
#!/bin/bash
#=============================================
# Script:     myscript.sh
# Author:     Your Name
# Date:       $(date +%F)
# Description: What this script does
# Usage:      ./myscript.sh [options]
#=============================================

set -euo pipefail   # Safety net: exit on error, undefined vars, pipe failure

# ---------- Variables ----------
SCRIPT_NAME=$(basename "$0")
LOG_FILE="/var/log/${SCRIPT_NAME%.sh}.log"

# ---------- Functions ----------
log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"; }
error_exit() { log "FATAL: $1"; exit 1; }

# ---------- Main ----------
main() {
    log "Starting script..."
    # Your logic here
    log "Done!"
}

main "$@"
```

---

## 🔤 Variables

```bash
# Assignment (NO spaces around =)
NAME="Golu"
PORT=8080
DEBUG=true

# Access
echo "Hello, $NAME"
echo "Port: ${PORT}"

# Command substitution (modern syntax)
CURRENT_DATE=$(date +%F)
FILES=$(ls /var/log/*.log 2>/dev/null)

# Arithmetic (3 ways)
((COUNT++))
let TOTAL=COUNT+1
RESULT=$((5 + 3))

# Special variables
$0     # Script filename
$1-$9  # Positional arguments (1st-9th)
$#     # Number of arguments
$@     # All arguments as separate words
$*     # All arguments as single string
$?     # Exit code of last command
$$     # Current script PID
$!     # Last background process PID
```

### Variable Expansion Tricks

| Syntax | Description | Example |
|--------|-------------|---------|
| `${var:-default}` | Use default if unset/null | `echo "${USER:-guest}"` |
| `${var:=default}` | Assign default if unset | `: "${OUTPUT:=/tmp}"` |
| `${var:?error}` | Error if unset/null | `rm -rf "${DIR:?required}"` |
| `${#var}` | String length | `echo "${#NAME}"` |
| `${var:offset:len}` | Substring | `echo "${NAME:0:3}"` |
| `${var/replace/with}` | Replace first match | `echo "${NAME/o/O}"` |
| `${var//replace/with}` | Replace all matches | `echo "${NAME//o/O}"` |
| `${var%.ext}` | Remove suffix | `echo "${FILE%.txt}"` |
| `${var#prefix}` | Remove prefix | `echo "${VAR#my_}"` |

---

## 🔀 Conditionals

### Test Operators

```bash
# Numeric comparison
[ "$A" -eq "$B" ]   # Equal          [ "$A" -ne "$B" ]  # Not equal
[ "$A" -lt "$B" ]   # Less than      [ "$A" -le "$B" ]  # Less/equal
[ "$A" -gt "$B" ]   # Greater than   [ "$A" -ge "$B" ]  # Greater/equal

# String comparison
[ "$A" = "$B" ]     # Equal          [[ "$A" == "$B" ]]  # Bash-specific (pattern match)
[ "$A" != "$B" ]    # Not equal      [[ -z "$VAR" ]]     # Empty string
[[ -n "$VAR" ]]     # Non-empty

# File tests
[ -f "$FILE" ]   # File exists        [ -d "$DIR" ]    # Directory exists
[ -x "$FILE" ]   # Executable         [ -r "$FILE" ]   # Readable
[ -w "$FILE" ]   # Writable           [ -s "$FILE" ]   # Size > 0
[ -L "$FILE" ]   # Symlink            [ -e "$PATH" ]   # Exists (any type)

# Logical operators
[ "$A" -gt 5 -a "$B" -lt 10 ]      # AND (old style)
[[ "$A" -gt 5 && "$B" -lt 10 ]]     # AND (modern)[[ "$A" -gt 5 || "$B" -lt 10 ]]     # OR (modern)
[ ! -f "$FILE" ]                     # NOT
```

### If-Else-Elif

```bash
if [[ "$STATUS" == "success" ]]; then
    echo "All good!"
elif [[ "$STATUS" == "warning" ]]; then
    echo "Check logs..."
else
    echo "Failed!"
    exit 1
fi

# One-liner
[[ -f "$FILE" ]] && echo "Exists" || echo "Missing"
```

### Case Statement

```bash
case "$1" in
    start)   systemctl start nginx ;;
    stop)    systemctl stop nginx  ;;
    restart) systemctl restart nginx ;;
    *)       echo "Usage: $0 {start|stop|restart}" && exit 1 ;;
esac
```

---

## 🔁 Loops

### For Loop

```bash
# Numeric range
for i in {1..5}; do echo "Iteration $i"; done

# List items
for SERVER in web-01 web-02 db-01; do
    ping -c 1 "$SERVER" || echo "$SERVER is down"
done

# File glob
for FILE in /var/log/*.log; do
    echo "Processing: $FILE"
done

# Command output
for USER in $(cat /etc/passwd | cut -d: -f1); do
    echo "User: $USER"
done

# C-style
for ((i=0; i<10; i++)); do
    echo "Index: $i"
done
```

### While Loop

```bash
# Counter
COUNT=1
while [[ $COUNT -le 5 ]]; do
    echo "Attempt $COUNT"
    ((COUNT++))
done

# Read file line by line
while IFS= read -r line; do
    echo "Line: $line"
done < /etc/hosts

# Infinite loop (until break)
while true; do
    read -p "Enter command: " CMD
    [[ "$CMD" == "quit" ]] && break
    eval "$CMD"
done

# Until (loop while condition is false)
until [[ -f /tmp/ready.txt ]]; do
    echo "Waiting..."
    sleep 2
done
```

---

## ⚙️ Functions

```bash
# Define function
greet() {
    local NAME="$1"           # Local scope (important!)
    local GREETING="${2:-Hello}"
    echo "$GREETING, $NAME!"
    return 0                  # Explicit exit code
}

# Call function
greet "Golu" "Namaste"

# Capture output
RESULT=$(greet "Jagu")
echo "Function said: $RESULT"

# Function with error handling
check_port() {
    local PORT=$1
    if ss -tuln | grep -q ":$PORT "; then
        return 0  # Port is listening
    else
        return 1  # Port is free
    fi
}

check_port 8080 && echo "In use" || echo "Free"
```

---

## 📝 Input & Output

```bash
# Read user input
read -p "Enter your name: " NAME
read -s -p "Password: " PASS          # Silent input
read -t 5 -p "Quick! (5 sec): " ANS   # Timeout

# Command-line arguments
echo "Script: $0"
echo "Args: $#"
echo "All: $@"

# Shift: process arguments one by one
while [[ $# -gt 0 ]]; do
    case "$1" in
        -f) FILE="$2"; shift 2 ;;
        -v) VERBOSE=true; shift ;;
        *)  echo "Unknown: $1"; shift ;;
    esac
done
```

---

## 🛡️ Production-Safe Patterns

```bash
#!/bin/bash
set -euo pipefail   # THE safety net

# Never delete without verifying
rm -rf "${DIRECTORY:?Variable not set}/temp"

# Always check command success
if ! command -v docker &>/dev/null; then
    error_exit "Docker is not installed"
fi

# Temporary directory (auto-cleanup)
TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT

# Lock file (prevent concurrent runs)
LOCKFILE="/tmp/$(basename "$0").lock"
exec 200>"$LOCKFILE"
flock -n 200 || error_exit "Script already running"

# Log with timestamps
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}
```

---

## 📊 Quick Pattern Reference

| Task | One-Liner |
|------|-----------|
| Check if command exists | `command -v docker &>/dev/null \|\| { echo "Missing docker"; exit 1; }` |
| Wait for port | `timeout 30 bash -c 'until ss -tuln \| grep :8080; do sleep 1; done'` |
| Retry logic | `for i in {1..5}; do cmd && break \|\| sleep 2; done` |
| Parallel execution | `for s in host1 host2; do (ssh "$s" cmd) & done; wait` |
| Default value | `: "${OUTPUT_DIR:=/tmp}"` |
| Get script dir | `DIR="$(cd "$(dirname "$0")" && pwd)"` |
| Line count | `wc -l < "$FILE"` |
| Unique lines | `sort file \| uniq -c \| sort -rn` |
| Interactive confirm | `read -p "Continue? [y/N] " ans; [[ $ans == [yY] ]] \|\| exit 1` |

---

> *🐚 Shell Scripting Cheatsheet — #LearnDevOpsIn90Days • Module 03*
>
> *Maintainer: [Aryashree Pritikrishna](https://github.com/aryashreep)*
