# 🏆 Module 02 Mastery Exam: Linux Foundations

Welcome to the **Mastery Exam**! This assessment covers everything from file permissions and process management to user administration and text processing.

---

## 📝 Part 1: File Permissions & Ownership (Days 2–7)

**1. A DevOps engineer runs `chmod 755 deploy.sh`. Which of the following correctly describes the resulting permissions?**
- A) Owner: read/write; Group: read/execute; Others: read/execute
- B) Owner: read/write/execute; Group: read/execute; Others: read/execute
- C) Owner: read/write/execute; Group: read/write; Others: read
- D) Owner: full; Group: full; Others: none
- **Ans: B**

**2. What does the command `chmod u+s /usr/bin/passwd` do?**
- A) Sets the sticky bit on the file so only the owner can delete it
- B) Sets the SGID bit so the file runs with the group's permissions
- C) Sets the SUID bit so the file always runs with the file owner's effective permissions
- D) Makes the file executable only by the superuser
- **Ans: C**

**3. A directory has permissions `drwxrwx---`. A new file is created inside it by a member of the group. Which umask value would result in the new file having permissions `rw-r-----`?**
- A) `022`
- B) `027`
- C) `002`
- D) `026`
- **Ans: B**

**4. Which command changes the group ownership of `/var/app/logs` and all its contents recursively to the group `devops`?**
- A) `chown -R :devops /var/app/logs`
- B) `chgrp devops /var/app/logs`
- C) `chown devops /var/app/logs`
- D) `chmod -R g=devops /var/app/logs`
- **Ans: A**

**5. A directory has the sticky bit set (`drwxrwxrwt`). What is the practical effect of this on a shared directory like `/tmp`?**
- A) Only root can create files in the directory
- B) Files inside are immutable and cannot be modified by anyone
- C) Only the file owner (or root) can delete or rename their own files, even though others have write permission on the directory
- D) All files inherit the directory's owner on creation
- **Ans: C**

**6. You run `ls -l script.sh` and see `-rwsr-xr-x`. What does the `s` in the owner execute position indicate?**
- A) The script has syntax errors and cannot run
- B) The SUID bit is set; the script runs with the file owner's privileges
- C) The SGID bit is set; the script runs with the group's privileges
- D) The sticky bit is set; the script is protected from deletion
- **Ans: B**

**7. Which numeric `chmod` value grants the owner read/write/execute, the group read/execute, and others no permissions at all?**
- A) `750`
- B) `755`
- C) `744`
- D) `700`
- **Ans: A**

**8. A junior engineer wants to give all users write access to a file without changing any other permissions. Which symbolic `chmod` command is correct?**
- A) `chmod o=w file.txt`
- B) `chmod a+w file.txt`
- C) `chmod u+w file.txt`
- D) `chmod +w file.txt`
- **Ans: B**

**9. What is the effect of setting the SGID bit on a directory (e.g., `chmod g+s /shared`)?**
- A) All files created in the directory inherit the directory's group ownership
- B) All files created in the directory inherit the creating user's primary group
- C) Only the group owner can write to the directory
- D) The directory is hidden from users not in the group
- **Ans: A**

**10. A file has octal permissions `644`. A user who is neither the owner nor in the file's group tries to execute it. What happens?**
- A) The kernel allows execution because read permission is set for others
- B) Execution is denied because others have no execute bit
- C) The file runs with root privileges due to the SUID flag
- D) The system prompts for the owner's password before running
- **Ans: B**

---

## 🚀 Part 2: systemd, Process Management & Scheduling (Days 8–11)

**11. A service called `app-server` keeps failing silently. Which command shows only the most recent 50 log entries for that specific unit?**
- A) `journalctl -u app-server --lines=50`
- B) `journalctl -f app-server -n 50`
- C) `journalctl -u app-server -n 50`
- D) `systemctl logs app-server -n 50`
- **Ans: C**

**12. What is the difference between `systemctl stop nginx` and `systemctl disable nginx`?**
- A) `stop` removes the service permanently; `disable` only pauses it
- B) `stop` halts the service immediately; `disable` prevents it from starting automatically at boot
- C) `stop` prevents boot startup; `disable` halts the service immediately
- D) There is no functional difference; both commands do the same thing
- **Ans: B**

**13. A process with PID 1842 is consuming 100% CPU. Which command sends it a SIGTERM signal (graceful shutdown)?**
- A) `kill -9 1842`
- B) `kill 1842`
- C) `kill -KILL 1842`
- D) `pkill -9 1842`
- **Ans: B**

**14. You need a one-time job to run a database backup script at 11:30 PM tonight. Which tool and syntax is most appropriate?**
- A) `cron "23:30 /opt/backup.sh"`
- B) `at 23:30 <<< "/opt/backup.sh"`
- C) `schedule --once 23:30 /opt/backup.sh`
- D) `systemctl --at=23:30 start backup.sh`
- **Ans: B**

**15. In the `top` command output, what does the `NI` column represent?**
- A) The number of network I/O operations per second for the process
- B) The nice value, which influences the scheduling priority of the process
- C) The number of child processes spawned by this process
- D) The Node Index used by the kernel's memory allocator
- **Ans: B**

**16. A cron expression reads: `0 2 * * 1-5 /opt/scripts/backup.sh`. When does this job run?**
- A) Every 2 minutes on weekdays
- B) At 2:00 AM every day, Monday through Friday
- C) At 2:00 AM on the 1st through 5th day of every month
- D) Every hour from 1 AM to 5 AM on Mondays
- **Ans: B**

**17. Which command would you use to check whether the `sshd` service is currently active and view its last few log lines in one output?**
- A) `systemctl logs sshd`
- B) `service sshd check`
- C) `systemctl status sshd`
- D) `journalctl --status sshd`
- **Ans: C**

**18. You want to run a long-running process with a lower scheduling priority so it doesn't impact interactive users. Which command starts `compile.sh` with a nice value of 15?**
- A) `renice 15 compile.sh`
- B) `nice --15 ./compile.sh`
- C) `nice -n 15 ./compile.sh`
- D) `priority=15 ./compile.sh`
- **Ans: C**

**19. Which `ps` command shows a full process tree for all users in a human-readable format?**
- A) `ps -ef`
- B) `ps aux --forest`
- C) `ps -a --tree`
- D) `ps -u all`
- **Ans: B**

**20. A systemd service file has `Restart=on-failure`. After the process crashes, what does systemd do?**
- A) Sends an alert email to the root user and waits for manual intervention
- B) Marks the service as failed and stops it permanently until manually restarted
- C) Automatically attempts to restart the service after the configured delay
- D) Reboots the entire system to recover the service
- **Ans: C**

---

## 🔧 Part 3: User Management, FHS & Text Processing (Days 12–13)

**21. What is the correct command to create a new user `jenkins` with a home directory at `/opt/jenkins` and shell `/bin/bash`, without prompting for a password?**
- A) `adduser jenkins --home /opt/jenkins --shell /bin/bash`
- B) `useradd -m -d /opt/jenkins -s /bin/bash jenkins`
- C) `useradd jenkins -h /opt/jenkins -sh /bin/bash`
- D) `newuser -d /opt/jenkins -s /bin/bash jenkins`
- **Ans: B**

**22. Which file stores the hashed passwords for local user accounts on a Linux system, and what permissions should it have?**
- A) `/etc/passwd` with permissions `644`
- B) `/etc/shadow` with permissions `640` (readable only by root and shadow group)
- C) `/etc/security/passwords` with permissions `600`
- D) `/etc/shadow` with permissions `777` for PAM compatibility
- **Ans: B**

**23. An entry in `/etc/passwd` reads: `deploy:x:1005:1005:Deploy Bot:/home/deploy:/sbin/nologin`. What does `/sbin/nologin` indicate?**
- A) The account is locked and the user cannot authenticate at all
- B) The account exists but is prevented from opening an interactive shell session
- C) The user's home directory is set to `/sbin` for security
- D) The account has been disabled by the shadow password system
- **Ans: B**

**24. You need to add an existing user `alice` to the supplementary group `docker` without removing her from other groups. Which command is correct?**
- A) `usermod -G docker alice`
- B) `groupadd docker alice`
- C) `usermod -aG docker alice`
- D) `chgrp docker alice`
- **Ans: C**

**25. According to the Linux Filesystem Hierarchy Standard (FHS), where should third-party application binaries that are not part of the base OS be installed?**
- A) `/bin`
- B) `/opt` or `/usr/local/bin`
- C) `/etc`
- D) `/var/bin`
- **Ans: B**

**26. You need to extract the username and login shell fields from `/etc/passwd` for all users whose shell is NOT `/sbin/nologin`. Which `awk` one-liner is correct?**
- A) `awk -F: '$7 != "/sbin/nologin" {print $1, $7}' /etc/passwd`
- B) `awk '$7 !~ nologin {print $1}' /etc/passwd`
- C) `awk -F: 'NF==7 {print $1, $7}' /etc/passwd`
- D) `awk -F: '{grep -v nologin $7}' /etc/passwd`
- **Ans: A**

**27. A DevOps engineer wants to replace every occurrence of the string `http://old-server` with `https://new-server` in a file `config.conf`, modifying it in-place. Which `sed` command achieves this?**
- A) `sed 's/http:\/\/old-server/https:\/\/new-server/' config.conf`
- B) `sed -i 's|http://old-server|https://new-server|g' config.conf`
- C) `sed --replace 'http://old-server' 'https://new-server' config.conf`
- D) `sed -n 's/old-server/new-server/g' config.conf`
- **Ans: B**

**28. Which directory in the FHS is intended for variable data that changes during normal system operation, such as log files, spool files, and databases?**
- A) `/tmp`
- B) `/run`
- C) `/var`
- D) `/srv`
- **Ans: C**

**29. You want to find all lines in `access.log` that contain the string `POST` but do NOT contain `200`. Which `grep` command combination is correct?**
- A) `grep "POST" access.log | grep -v "200"`
- B) `grep -e "POST" -e "!200" access.log`
- C) `grep "POST && !200" access.log`
- D) `grep "POST" access.log --exclude "200"`
- **Ans: A**

**30. After running `usermod -L devuser`, what is the observable effect when `devuser` tries to log in with their password?**
- A) The account is deleted from the system
- B) The user's home directory becomes inaccessible
- C) The account is locked; password authentication fails, but key-based SSH may still work
- D) The user is downgraded to guest-level permissions
- **Ans: C**

---
*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 1: The Linux Gauntlet*
