# 🧪 Lab Session: Day 21 — Web Architecture Lab

**Jagu:** "Beep Boop! Golu, today we will understand 'Phonebook' and 'Doors' of internet. Cloud automation is impossible without DNS and Ports. Come on, let's see how the wires move!"

## 🎯 Task Objectives
- Perform deep DNS lookups.
- Understand local name resolution.
- Map services to their standard ports.

## 🛠️ Hands-on Challenges

1.  **The DNS Detective:** Use `dig` on a popular domain. Identify the **A Record** and the **TTL** value.
2.  **The Local Hack:** Edit your `/etc/hosts` file. Map `golu.local` to `127.0.0.1`. Try to `ping golu.local`.
3.  **Port Hunter:** Use `ss -tuln`. Identify which services are using ports 22, 80, or 443 on your machine.
4.  **The 'Whois' Game:** Use the `whois` command (install if missing) to find the registrar of `github.com`.
5.  **CIDR Logic:** If a subnet is `192.168.1.0/24`, how many usable IP addresses does it have? Write the answer.

---

### ✅ Proof of Work
**Jagu:** "Networking setup clear hai! Results save karo."

1. Create a file named `web-arch-results.md` in the **`solution/`** folder.
2. Paste your `dig` output and the answer to the CIDR logic question.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 21 • Golu & Jagu Edition*
