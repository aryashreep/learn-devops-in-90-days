# 🧪 Lab Session: Day 15 — The Smart Automation

**Jagu:** "Beep Boop! Golu, creating each file manually is like child's play. Today we will learn how to make thousands of files or users 'automatic' with a single script!"

## 🎯 Task Objectives
- Use positional arguments to make scripts dynamic.
- Implement a `for` loop to automate repetitive tasks.
- Add basic `if` logic to handle errors.

## 🛠️ Hands-on Challenges

1.  **The Argument Master:** 
    - Create a script `user_info.sh`. 
    - It should take your Name and Age as arguments: `./user_info.sh Golu 25`.
    - Print: "User $1 is $2 years old."
2.  **The Folder Factory:** 
    - Create a script `create_folders.sh`.
    - Use a `for` loop to create 5 folders named `module_1` to `module_5` in one go.
3.  **The Safe Script:**
    - Create a script that checks if a directory exists before creating it.
    - Use: `if [ -d "$DIR" ]; then echo "Already exists"; else mkdir $DIR; fi`.
4.  **Arg Count Check:** Write a script that checks if the user has provided EXACTLY 2 arguments. If not, print: "Brother, it is necessary to give 2 arguments!"

---

### ✅ Proof of Work
**Jagu:** "Golu, now you have become the king of 'Bulk Operations'! Save your scripts."

1. Create a file named **`logic-scripts-report.md`** in the **`solution/`** folder.
2. Paste the code for your `create_folders.sh` and the 'Safe Script'.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 15 • Golu & Jagu Edition*
