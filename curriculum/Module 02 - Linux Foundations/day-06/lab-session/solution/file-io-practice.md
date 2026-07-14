# 🧪 Day 06 Solution: File I/O Mastery

**Jagu:** "Well done Golu! Tune File I/O commands have been mastered. This is your 'Proof of Work' report!"

---

## 🛠️ Step-by-Step Command History

### 1. Create a new file
```bash
# Golu created the base file
touch notes.txt
```

### 2. Overwrite data using `>`
```bash
# Writing the first line (Removes any old content)
echo "Line 1: This is my DevOps journey" > notes.txt
```

### 3. Append data using `>>`
```bash
# Adding the second line without deleting the first
echo "Line 2: I am learning Linux foundations" >> notes.txt
```

### 4. Use `tee` for simultaneous display/write
```bash
# Writing Line 3 to the file and seeing it on terminal
echo "Line 3: Today is Day 06" | tee -a notes.txt
```

---

## 🔍 Verification & Reading Results

### Full Content (`cat`)
```text
$ cat notes.txt
Line 1: This is my DevOps journey
Line 2: I am learning Linux foundations
Line 3: Today is Day 06
```

### Partial Read (`head` & `tail`)
```bash
# See first 2 lines
$ head -n 2 notes.txt
Line 1: This is my DevOps journey
Line 2: I am learning Linux foundations

# See last line
$ tail -n 1 notes.txt
Line 3: Today is Day 06
```

---

## 💡 Jagu's Pro Tip:
"Golu, always remember: `>` means 'make a new one by breaking the wall' and `>>` means 'add one more to the wall'. Always use `>>` for log files!"

---
*#LearnDevOpsIn90Days • Day 06 • Golu & Jagu Edition*
