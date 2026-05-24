# 🧪 Lab Session: Day 08 — Firewall & Port Security

**Jagu:** "Bhai Golu, server ko 'khula' nahi chhod sakte! Aaj hum 'Security Guard' bankar ports ko lock karenge."

## 🎯 Task Objectives
- Master port identification.
- Configure basic firewall rules.
- Perform a local security scan.

## 🛠️ Hands-on Challenges

1.  **Port Scan:** Use `netstat -ant` or `ss -at` to list all active TCP connections.
2.  **Firewall Setup:** Use `ufw` (on Ubuntu) or `iptables`:
    - Allow SSH (Port 22).
    - Allow HTTP (Port 80).
    - Enable the firewall.
3.  **The Block Test:** Try to block a specific IP address from reaching your machine.
4.  **Nmap Discovery:** Install `nmap`. Scan your own machine (`localhost`) and see which ports are reported as "Open".
5.  **Config Backup:** List all your active firewall rules and save them to a file.

---

### ✅ Proof of Work
**Jagu:** "Server secure hai! Rules list share kar do."

1. Save your `ufw status numbered` output or your firewall rules in a file in the **`solution/`** folder.
2. Commit and push!

---
*#LearnDevOpsIn90Days • Day 08 • Golu & Jagu Edition*
