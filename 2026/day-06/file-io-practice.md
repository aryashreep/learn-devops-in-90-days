# 📄 File IO Practice — Day 06

## 📅 Topic

Linux Fundamentals: Read and Write Text Files

---

# 🎯 Objective

Practice basic Linux file operations using:

* `touch`
* `>`
* `>>`
* `cat`
* `head`
* `tail`
* `tee`

---

# 📁 Create a File

## 1. Create an Empty File

### Command

```bash id="y8w2mp"
touch notes.txt
```

### Observation

* Created an empty file named `notes.txt`

---

# ✍️ Write Content to the File

## 2. Write First Line Using `>`

### Command

```bash id="v4q9nc"
echo "Linux file practice started" > notes.txt
```

### Observation

* Added the first line to the file
* `>` overwrites existing content

---

## 3. Append Second Line Using `>>`

### Command

```bash id="k3r8tx"
echo "Learning file read and write commands" >> notes.txt
```

### Observation

* Appended a new line without removing existing content

---

## 4. Append Third Line Using `tee`

### Command

```bash id="z6m1pd"
echo "Practicing DevOps fundamentals" | tee -a notes.txt
```

### Observation

* Displayed output on terminal
* Added the same line to the file
* `-a` enables append mode

---

# 📖 Read the File

## 5. Display Full File Content

### Command

```bash id="f9c4lv"
cat notes.txt
```

### Observation

* Displayed all lines from the file

---

## 6. Read First Two Lines

### Command

```bash id="n7w5rm"
head -n 2 notes.txt
```

### Observation

* Displayed the first 2 lines only

---

## 7. Read Last Two Lines

### Command

```bash id="m2x8qa"
tail -n 2 notes.txt
```

### Observation

* Displayed the last 2 lines from the file

---

# 📝 Sample File Content

```text id="g4t7pl"
Linux file practice started
Learning file read and write commands
Practicing DevOps fundamentals
```

---

# 🧠 What I Learned

* `touch` creates empty files
* `>` overwrites file content
* `>>` appends content safely
* `cat` displays full file contents
* `head` and `tail` help inspect parts of files
* `tee` writes and displays output simultaneously

---

# ⚙️ Why This Matters for DevOps

* Configuration files are text-based
* Logs are stored as text files
* Automation scripts frequently read/write files
* Quick file inspection speeds up troubleshooting

---

# ✅ Summary

* Created and modified text files
* Practiced file redirection
* Used common Linux file-reading commands
* Improved Linux command-line confidence

