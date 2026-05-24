# 🧪 Lab Session: Day 09 — DNS & Load Balancing Lab

**Jagu:** "Beep Boop! Golu, kabhi socha hai browser ko kaise pata chalta hai ki `github.com` kahan hai? Aaj hum DNS ke raste pe chalenge!"

## 🎯 Task Objectives
- Perform deep DNS lookups.
- Understand local name resolution.
- Visualize simple Load Balancing concepts.

## 🛠️ Hands-on Challenges

1.  **The Dig Site:** Use `dig google.com` to find the IP address. Identify the "ANSWER SECTION".
2.  **Mail Master:** Use `dig MX yahoo.com` to find their mail servers.
3.  **Local Hack:** Edit your `/etc/hosts` file. Add a line: `127.0.0.1 golu.dev`. Now try to `ping golu.dev`. What happens?
4.  **TTL Watch:** Run `dig` again on a domain and notice the "TTL" number decreasing.
5.  **Concept Task:** Draw a simple diagram (or write a flow) of how a Load Balancer would distribute traffic between 3 servers.

---

### ✅ Proof of Work
**Jagu:** "DNS Master Golu! Apne lookup results save karo."

1. Create `dns-lab.md` in the **`solution/`** folder.
2. Paste the output of your `dig` commands and the result of your `/etc/hosts` hack.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 09 • Golu & Jagu Edition*
