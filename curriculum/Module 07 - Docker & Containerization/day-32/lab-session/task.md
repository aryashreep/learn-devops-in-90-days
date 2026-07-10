# 🧪 Lab Session: Day 32 — Docker Images & Container Lifecycle

**Jagu:** "Beep Boop! Golu, container ek lightweight VM jaisa hai — lekin isme koi OS nahi, bas app aur dependencies! Aaj hum containers ko birth se death tak dekhenge."

## 🎯 Task Objectives
- Pull Docker images from Docker Hub.
- Run containers in interactive and detached modes.
- Inspect, stop, and clean up containers.

## 🛠️ Hands-on Challenges

1.  **Pull an Image:**
    - Pull the official Nginx image: `docker pull nginx:alpine`
    - List images: `docker images`

2.  **Run Containers:**
    - Run in foreground: `docker run -it --name test-box alpine sh`
    - Inside the container, try: `echo "Hello from container!" && exit`
    - Run in detached mode: `docker run -d --name web-server -p 8080:80 nginx:alpine`

3.  **Container Lifecycle:**
    - List running containers: `docker ps`
    - View logs: `docker logs web-server`
    - Stop a container: `docker stop web-server`
    - List all containers (including stopped): `docker ps -a`
    - Start it again: `docker start web-server`
    - Remove the container: `docker rm -f web-server`

---

### ✅ Proof of Work
**Jagu:** "Golu, apna container life-cycle record kar lo!"

1. Create a file named **`container-lifecycle.md`** in the **`solution/`** folder.
2. Record your command outputs and observations.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 32 • Golu & Jagu Edition*
