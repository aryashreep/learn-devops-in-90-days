# 🧪 Lab Session: Day 07 — Networking Basics Lab

**Jagu:** "Golu, now we will talk 'Server to Server'. DevOps is incomplete without networking. Come on, let's check the packets!"

## 🎯 Task Objectives
- Identify network identity (IPs).
- Verify connectivity and trace packet routes.
- Inspect web response headers.

## 🛠️ Hands-on Challenges

1.  **Identity Check:** Find your Private IP using `ip addr` and your Public IP using `curl ifconfig.me`.
2.  **Ping Test:** Ping `google.com` 5 times. Record the average "Latency" (ms).
3.  **The Route Map:** Use `traceroute` (or `mtr`) to `google.com`. How many "Hops" (stations) did your packet cross?
4.  **Header Inspector:** Use `curl -I https://www.github.com`. Look for the "Server" and "Content-Type" headers.
5.  **Local Listeners:** Use `ss -tuln` to see which ports are currently "Listening" on your machine.

---

### ✅ Proof of Work
**Jagu:** "Network is clear Golu! By saving data."

1. Create `network-results.txt` in the **`solution/`** folder.
2. Paste your Public IP and the `traceroute` results.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 07 • Golu & Jagu Edition*
