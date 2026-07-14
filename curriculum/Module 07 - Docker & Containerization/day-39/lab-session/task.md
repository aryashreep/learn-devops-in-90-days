# 🧪 Lab Session: Day 39 — Docker Revision and Cheat Sheet

**Jagu:** "Beep Boop! Golu, we learned how to ship microservices by creating an image. Today we will master final tools (Scout/Troubleshooting) and clean-up commands!"

## 🎯 Task Objectives
- Identify changes in container filesystem with docker diff.
- Scan images for security exploits using docker scout.
- Perform clean up on unused images/volumes/networks.

## 🛠️ Hands-on Challenges

1. **Challenge 1:** Run a container, make a modification, and run `docker diff` to inspect changes.
2. **Challenge 2:** Run `docker scout quickview` on an image (e.g. redis:6.0) to see security feedback.
3. **Challenge 3:** Reclaim system disk space using `docker system df` and perform a complete sweep with `docker system prune -a --volumes`.

---

### ✅ Proof of Work
**Jagu:** "Golu, apni reports ready karo!"

1. Create a file named **`docker-revision-log.md`** in the **`solution/`** folder.
2. Record your command outputs, configurations, and verification screenshots (if any).
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 39 • Golu & Jagu Edition*
