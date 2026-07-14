# 🧪 Day 08 Solution: Cloud Deployment & Nginx

**Jagu:** "Well done Golu! Tune local computer's boundary has been crossed. Now your website is live in the pure world! Here is your reference deployment report."

---

## 🛠️ Step-by-Step Command History

### 1. Connecting to the Cloud
```bash
# Golu connected to his AWS instance
$ ssh -i my-devops-key.pem ubuntu@3.144.20.12
Welcome to Ubuntu 22.04.2 LTS...
```

### 2. Installing the Web Engine
```bash
$ sudo apt update && sudo apt install nginx -y

# Verify service is running
$ systemctl status nginx
● nginx.service - A high performance web server
   Active: active (running)...
```

### 3. Log Extraction & SCP
```bash
# Capture last 20 visitors
$ tail -n 20 /var/log/nginx/access.log > ~/nginx-logs.txt

# On LOCAL terminal (download the proof)
$ scp -i my-devops-key.pem ubuntu@3.144.20.12:~/nginx-logs.txt ./solutions/
```

---

## 🔍 Deployment Checklist

| Step | Status | Evidence |
| :--- | :--- | :--- |
| **Instance Launch** | ✅ | AWS EC2 Dashboard screenshot. |
| **Nginx Status** | ✅ | `Active (running)` in terminal. |
| **Public Access** | ✅ | Browser opened `http://3.144.20.12`. |

---

## 💡 Jagu's Pro Tip:
"Golu, if the website is not accessible, first check **Security Group** in Cloud Console. It is necessary to open Port 80 (HTTP)!"

---
*#LearnDevOpsIn90Days • Day 08 • Golu & Jagu Edition*
