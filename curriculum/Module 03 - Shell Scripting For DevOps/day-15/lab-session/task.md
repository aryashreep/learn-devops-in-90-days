# 🧪 Lab Session: Day 15 — The Smart Automation

**Jagu:** "Beep Boop! Golu, manually ek-ek file banana toh baccho ka khel hai. Aaj hum seekhenge ki kaise ek single script se hazaron files ya users 'automatic' banaye jaate hain!"

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
4.  **Arg Count Check:** Write a script that checks if the user has provided EXACTLY 2 arguments. If not, print: "Bhai, 2 arguments dena zaroori hai!"

---

### ✅ Proof of Work
**Jagu:** "Golu, ab tu 'Bulk Operations' ka king ban gaya hai! Apne scripts save kar."

1. Create a file named **`logic-scripts-report.md`** in the **`solution/`** folder.
2. Paste the code for your `create_folders.sh` and the 'Safe Script'.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 15 • Golu & Jagu Edition*
