# 🗓️ Day 06 — Linux Fundamentals: Read and Write Text Files

Welcome to **Day 06** of the **#LearnDevOpsIn90Days** challenge 🚀

Today's goal is to **practice basic file read/write** using only fundamental commands.

You will create a small text file and practice:

* Creating a file
* Writing text to a file
* Appending new lines
* Reading the file back

Keep it basic and repeatable.

---

# 🎯 Today's Goals

✅ Create files using `touch` and redirection

✅ Write and append text using `>` and `>>`

✅ Read files using `cat`, `head`, `tail`, and `tee`

✅ Share your progress publicly

---

# 📌 Tasks for Today

## 1️⃣ Create Your Practice Note

Create a markdown file named `file-io-practice.md` or a hand-written practice note (Recommended).

By the end of today, you should have:

* The newly created files
* Your practice note showing the commands you ran and what they did

---

## 2️⃣ Follow the Guidelines

* Create a file named `notes.txt`
* Write 3 lines into the file using **redirection** (`>` and `>>`)
* Use **`cat`** to read the full file
* Use **`head`** and **`tail`** to read parts of the file
* Use **`tee`** once to write and display at the same time
* Keep it short (8–12 lines total in the file)

Suggested command flow:

1. `touch notes.txt`
2. `echo "Line 1" > notes.txt`
3. `echo "Line 2" >> notes.txt`
4. `echo "Line 3" | tee -a notes.txt`
5. `cat notes.txt`
6. `head -n 2 notes.txt`
7. `tail -n 2 notes.txt`

---

# 📚 Resources

Use these docs to understand the commands:

* `touch` (create an empty file)
* `cat` (read full file)
* `head` and `tail` (read parts of a file)
* `tee` (write and display at the same time)

---

# 🧠 Key Concepts Introduced Today

| Concept            | Meaning                                                |
| ------------------ | ------------------------------------------------------ |
| Redirection (`>`)  | Write output to a file (overwrites existing content)   |
| Append (`>>`)      | Add output to the end of a file without overwriting    |
| `cat`              | Display the full contents of a file                    |
| `head` / `tail`    | Read the first or last N lines of a file               |
| `tee`              | Write to a file and display to terminal simultaneously |

---

# ⚙️ Why This Matters for DevOps

Reading and writing files is a daily task in DevOps.

Logs, configs, and scripts are all text files.
If you can handle files quickly, you can debug and automate faster.

---

# 📝 Mini Assignment

Create `notes.txt` using the suggested command flow, then document each command and its output in your practice note.

Commit your files to GitHub.

---

# 📂 Suggested Folder Structure

```bash
content/day-06/
├── README.md
├── file-io-practice.md
└── notes.txt
```

---

# ⭐ Bonus Challenge

Create a LinkedIn post using:

* #LearnDevOpsIn90Days
* #DevOps
* #LearningInPublic

and share:

* 2–3 lines on what you learned about file read/write
* One command you will use often
* Optional: screenshot of your notes

---

# ✅ Day 06 Checklist

* [ ] Created `notes.txt` using touch and redirection
* [ ] Used `>`, `>>`, `cat`, `head`, `tail`, and `tee`
* [ ] Documented commands and output in practice note
* [ ] Shared progress publicly on LinkedIn
* [ ] Committed Day 06 work to GitHub

---

# 🚀 Next Day

➡️ Day 07 — Linux File System Hierarchy & Scenario-Based Practice
