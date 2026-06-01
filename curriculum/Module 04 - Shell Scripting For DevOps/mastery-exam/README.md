# 🏆 Module 04 Mastery Exam: Shell Scripting For DevOps

Welcome to the **Mastery Exam**! This assessment covers everything from basic syntax to production-safe automation logic.

---

## 📝 Part 1: Shell Scripting Fundamentals (Day 1)

**1. A script needs to check for the existence of a configuration directory before proceeding. Which conditional statement correctly performs this check?**
- A) `if [ -f /etc/config ]; then ..... fi`
- B) `if [ -s /etc/config ]; then ..... fi`
- C) `if [ dir /etc/config ]; then ..... fi`
- D) `if [ -d /etc/config ]; then ..... fi`
- **Ans: D**

**2. Why is the Shebang line important in DevOps?**
- A) It makes the script run faster
- B) It grants root permissions
- C) It ensures portability by telling the system which interpreter to use
- D) It creates the documentation
- **Ans: C**

**3. How do you limit the scope of a variable to exist only inside a function?**
- A) `private VAR`
- B) `local VAR`
- C) `static VAR`
- D) `const VAR`
- **Ans: B**

**4. Which loop syntax is correct for iterating over a list?**
- A) `for (item in list) do ... done`
- B) `for item in list; do ... done`
- C) `foreach item in list do ... done`
- D) `for item = list do ... done`
- **Ans: B**

**5. In a deployment script, which of the following is the correct syntax for assigning the output of the 'date' command to a variable named 'TIMESTAMP'?**
- A) `TIMESTAMP = $(date)`
- B) `let TIMESTAMP = *date`
- C) `TIMESTAMP=$(date)`
- D) `TIMESTAMP=date`
- **Ans: C**

**6. How do you access/print the value of the variable PORT defined above?**
- A) `echo $PORT`
- B) `print(PORT)`
- C) `echo PORT`
- D) `echo %PORT%`
- **Ans: A**

**7. How do you increment a counter variable in a while loop?**
- A) `COUNT + 1`
- B) `increment COUNT`
- C) `COUNT = COUNT + 1`
- D) `((COUNT++))`
- **Ans: D**

**8. What command displays the shell you are currently using?**
- A) `whoami`
- B) `echo $SHELL`
- C) `which bash`
- D) `Is shell`
- **Ans: B**

**9. What is the primary purpose of using 'set -u' at the beginning of a production script?**
- A) print each command to the terminal before it is executed for debugging
- B) ensure that errors within a pipeline are properly caught
- C) treat unset variables as an error & exit, preventing potentially dangerous operations
- D) cause the script to exit immediately if a command fails
- **Ans: C**

**10. What does the flag -d check for in a conditional statement?**
- A) If a file exists
- B) If the item is a directory
- C) If the file is executable
- D) If the file is empty
- **Ans: B**

**11. A junior engineer uses command `grep "ERROR" syslog > error_log.txt` in a daily script to log server errors. Why does `error_log.txt` only contain errors from the most recent run?**
- A) redirection operator `>>` should have been used instead of `>`
- B) pipe `|` should have been used instead of `>`
- C) Standard error (2>&1) was not redirected
- D) 'grep' command does not support writing to files directly
- **Ans: A**

**12. How do you explicitly stop a script and indicate failure?**
- A) `stop`
- B) `return false`
- C) `exit 1`
- D) `break`
- **Ans: C**

**13. How do you write "OR" logic in a Bash if statement?**
- A) `||`
- B) `OR`
- C) `&&`
- D) `|`
- **Ans: A**

**14. A script named 'create_user.sh' is executed with command: `./create_user.sh admin dev`. Inside the script, what does the special variable '$#' contain?**
- A) first argument, 'admin'
- B) total number of arguments passed, which is 2
- C) name of the script, 'create_user.sh'
- D) all arguments as a single string, 'admin dev'
- **Ans: B**

**15. How do you redirect Standard Error to the same destination as Standard Output?**
- A) `1>2`
- B) `error >> output`
- C) `|&`
- D) `2>&1`
- **Ans: D**

---

## 🚀 Part 2: Shell Scripting Advanced (Day 2)

**1. What is the correct way to write the numerical comparison `if [ $count > 5 ]` in Bash to prevent it from creating an empty file named '5'?**
- A) `if ($count > 5)`
- B) `if [ $count -gt 5 ]`
- C) `if [[ $count > 5 ]]`
- D) `if test $count > 5`
- **Ans: B**

**2. In the context of DevOps, why are shell scripts often described as the 'glue' that connects different tools?**
- A) Because Bash scripts are compiled into a universal format that all DevOps tools can understand
- B) Because they are used to automate the sequence of operations between various tools, such as build, test, and deployment tools
- C) Because they provide a graphical user interface (GUI) for managing servers
- D) Because they are the only way to install new software on a Linux server
- **Ans: B**

**3. How do you declare an associative array in Bash?**
- A) `declare -A array`
- B) `array=()`
- C) `declare -a array`
- D) `typeset -A array`
- **Ans: A**

**4. In production scripts, why is `set -u` critical when using `rm -rf $DIRECTORY/*`?**
- A) Improves performance
- B) Prevents deleting root directory if DIRECTORY is unset
- C) Enables debugging
- D) Makes script faster
- **Ans: B**

**5. What is the primary benefit of using functions in a complex shell script?**
- A) Functions are only way to accept arguments into a shell script
- B) Functions run significantly faster than same code outside a function
- C) Functions automatically handle errors for the code they contain
- D) Functions allow for code reuse & improve script readability and maintainability
- **Ans: D**

**6. In a function, what's the difference between $1 inside vs outside the function?**
- A) No difference
- B) Inside function: function's first argument; Outside: script's first argument
- C) Inside function refers to script arguments
- D) Functions can't use $1
- **Ans: B**

**7. Why is it important to check if a directory exists before creating it?**
- A) To ensure Idempotency
- B) To save battery life
- C) To rename the directory
- D) To delete the directory
- **Ans: A**

**8. What happens if you check $? two commands later?**
- A) Gets the original exit code
- B) Gets average of all exit codes
- C) Only holds exit code of immediately preceding command
- D) Always returns 0
- **Ans: C**

**9. In `if [[ "$STATUS" == "success" ]]; then`, why quote "$STATUS"?**
- A) Enables case-insensitive matching
- B) Handles values with spaces or special characters
- C) Makes comparison faster
- D) Required syntax
- **Ans: B**

**10. In the context of "Command Substitution," what is the specific function of the `$(command)` syntax?**
- A) It runs the command in the background
- B) It stores the output of the command into a variable
- C) It verifies if the command exists
- D) It redirects errors to a log file
- **Ans: B**

**11. Regarding conditional syntax, why does the text recommend `[[ ... ]]` over the older `[ ... ]` syntax?**
- A) It is the modern, powerful Bash version
- B) It uses less memory
- C) It allows you to skip the if keyword
- D) It uses less memory (Duplicate)
- **Ans: A**

**12. Which command makes a variable available to child scripts or processes?**
- A) `set`
- B) `define`
- C) `export`
- D) `global`
- **Ans: C**

**13. Why should you always quote variables in file operations (e.g., "$VAR")?**
- A) To make them bold
- B) To handle filenames containing spaces
- C) To convert them to strings
- D) It is optional
- **Ans: B**

**14. Which external tool does the text explicitly mention for scanning code for syntax errors and bad practices?**
- A) `LintBash`
- B) `DebuggerPro`
- C) `ShellCheck`
- D) `BashDoctor`
- **Ans: C**

**15. In the "Environment Variables" section, what command is used to display all current environment variables?**
- A) `showall`
- B) `list-env`
- C) `printenv`
- D) `echo $ALL`
- **Ans: C**

---
*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 2: The Automation Surge*
