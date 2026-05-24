# 🧪 Lab Session: Day 18 — Building with Blocks

**Jagu:** "Beep Boop! Golu, ek hi code baar-baar likhna band karo. Aaj hum 'Custom Stamps' (Functions) banayenge taaki tum ek bar design karo aur hazaron baar use karo!"

## 🎯 Task Objectives
- Define and execute custom Bash functions.
- Pass arguments specifically into functions.
- Understand variable scope (Local vs Global).

## 🛠️ Hands-on Challenges

1.  **The Logger Function:** 
    - Create a script `logger.sh`.
    - Define a function `log_info()` that takes one argument and prints: `[INFO] $(date): $1`.
    - Call the function twice with different messages.
2.  **Scope Detective:** 
    - Create a script `scope.sh`.
    - Define a global variable `CITY="Mumbai"`.
    - Inside a function, use `local CITY="Delhi"`.
    - Print the variable inside and outside the function to see the difference.
3.  **The Math Library:**
    - Write a script with functions for `add()`, `sub()`, and `multiply()`.
    - Each function should take two arguments and print the result.
4.  **Error Handler:** 
    - Write a function `check_file()` that takes a filename as an argument.
    - If the file exists, print "File found!"; if not, return an error code.

---

### ✅ Proof of Work
**Jagu:** "Golu, modular code hi maintainable code hota hai. Apni library save kar!"

1. Create a file named **`function-library.md`** in the **`solution/`** folder.
2. Paste the code for your `logger.sh` and the 'Scope Detective' script.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 18 • Golu & Jagu Edition*
