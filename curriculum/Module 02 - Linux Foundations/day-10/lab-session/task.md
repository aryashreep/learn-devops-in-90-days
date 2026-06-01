# 🧪 Lab Session: Day 10 — SSH Key Mastery Lab

**Jagu:** "Golu, passwords are old-school and dangerous. Aaj hum 'Keys' use karke servers ke taale kholenge. Ye DevOps ka 'Front Door' mastery hai!"

## 🎯 Task Objectives
- Generate and manage SSH Key pairs.
- Implement "Password-less" server access.
- Master the SSH Config file for speed.

## 🛠️ Hands-on Challenges

1.  **Key Gen:** Run `ssh-keygen -t ed25519`. (Do NOT use a passphrase for this lab to keep it simple).
2.  **Key Anatomy:** Locate your `id_ed25519` (Private) and `id_ed25519.pub` (Public) files. **Jagu says:** "Private key ko kabhi share mat karna!"
3.  **The Speed Dial:** Create/Edit `~/.ssh/config`. Add a fake host entry:
    ```text
    Host myserver
        HostName 127.0.0.1
        User golu
    ```
4.  **Key Copy:** (Optional if you have a second VM/Server) Use `ssh-copy-id` to send your public key to a remote machine.
5.  **Tunnel Vision:** Research and run a command to forward your local port 8080 to a remote port 80.

---

### ✅ Proof of Work
**Jagu:** "Keys are safe! Final submission ready karo."

1. Save a **sanitized** version of your `~/.ssh/config` and the **Public** key content in the **`solution/`** folder.
2. Commit and push!

---
*#LearnDevOpsIn90Days • Day 10 • Golu & Jagu Edition*
