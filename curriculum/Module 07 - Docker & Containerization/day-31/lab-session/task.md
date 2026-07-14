# 🧪 Lab Session: Day 31 — Introduction to Docker

**Jagu:** "Beep Boop! Golu, today we are entering the world of Docker. This is the magic that has solved the problem of 'my machine is not working'!"

## 🎯 Task Objectives
- Understand Docker's architecture: Daemon, CLI, Images, Containers, Registry.
- Run your first container.
- List and inspect Docker images and containers.

## 🛠️ Hands-on Challenges

1.  **Verify Docker Installation:**
    - Check Docker version: \`docker --version\`
    - Check Docker daemon status: \`docker info\`

2.  **Run Your First Container:**
    - Run the classic hello-world: \`docker run hello-world\`
    - Observe the output - notice how Docker pulled the image automatically.

3.  **Explore Images:**
    - List downloaded images: \`docker images\`
    - Pull an Nginx image: \`docker pull nginx:alpine\`
    - Search for images: \`docker search nginx\`

4.  **Run an Interactive Container:**
    - Run an Alpine Linux shell: \`docker run -it alpine sh\`
    - Inside the container, try: \`echo "Hello from inside Docker!"\`
    - Type \`exit\` to leave the container.

5.  **Container Management:**
    - List running containers: \`docker ps\`
    - List all containers (including stopped): \`docker ps -a\`
    - Remove a stopped container: \`docker rm <container-id>\`
    - Remove all unused containers: \`docker container prune\`

---

### ✅ Proof of Work
**Jagu:** "Golu, apna first Docker experience record karo!"

1. Create a file named **\`docker-intro.md\`** in the **\`solution/\`** folder.
2. Include:
   - The output of \`docker run hello-world\`
   - The output of \`docker images\`
   - A screenshot or text log of your Alpine container session
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 31 • Golu & Jagu Edition*
