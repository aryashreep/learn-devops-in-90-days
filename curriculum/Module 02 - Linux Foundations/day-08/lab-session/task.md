# 🧪 Lab Session: Day 08 — Cloud Server Setup & Nginx

**Jagu:** "Beep Boop! Golu, now we will move from 'Ground' to 'Cloud'. Today we will make our first web server live on AWS/Utho!"

## 🎯 Task Objectives
- Launch and connect to a Cloud Instance via SSH.
- Install and configure Nginx web server.
- Manage Security Groups (Firewalls) for web access.
- Collect and analyze production logs.

## 🛠️ Hands-on Challenges

1.  **Launch & Connect:**
    - Launch an AWS EC2 (t2.micro) or Utho instance.
    - Connect using SSH: `ssh -i your-key.pem ubuntu@your-ip`.
2.  **Server Engine:**
    - Update system: `sudo apt update`.
    - Install Nginx: `sudo apt install nginx -y`.
    - Verify: `systemctl status nginx`.
3.  **Firewall Opening:**
    - Go to Cloud Console ➔ Security Groups.
    - Add an "Inbound Rule" for **Port 80 (HTTP)**.
    - Visit `http://your-ip` in your browser.
4.  **Log Extractor:**
    - Read access logs: `tail -n 20 /var/log/nginx/access.log`.
    - Save logs to your home folder: `cat /var/log/nginx/access.log > ~/nginx-logs.txt`.
5.  **Local Download:** Use `scp` from your LOCAL terminal to download the logs:
    - `scp -i your-key.pem ubuntu@your-ip:~/nginx-logs.txt .`

---

### ✅ Proof of Work
**Jagu:** "Golu, your website is live! Save the proof."

1. Create a file named **`day-08-cloud-deployment.md`** in the **`solution/`** folder.
2. Add screenshots of your **Nginx Welcome Page** and the **`nginx-logs.txt`** file.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 08 • Golu & Jagu Edition*
