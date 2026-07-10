# 🧪 Lab Session: Day 33 — Dockerfile: Build Your Own Images

**Jagu:** "Beep Boop! Golu, ab hum khud apna Docker image banayenge — ek custom recipe jisme sirf wahi hoga jo humein chahiye!"

## 🎯 Task Objectives
- Write a Dockerfile to containerize a simple application.
- Build an image from a Dockerfile.
- Run a container from your custom image.

## 🛠️ Hands-on Challenges

1.  **Create a Dockerfile:**
    - Create a folder: `mkdir my-app && cd my-app`
    - Create a simple Python app `app.py`:
    ```python
    print("Hello from my custom Docker image!")
    ```
    - Create a `Dockerfile` with:
    ```dockerfile
    FROM python:3.11-alpine
    WORKDIR /app
    COPY app.py .
    CMD ["python", "app.py"]
    ```

2.  **Build the Image:**
    - Build it: `docker build -t my-first-image .`
    - List images and find yours: `docker images`

3.  **Run and Verify:**
    - Run it: `docker run --rm my-first-image`
    - Tag and re-tag the image: `docker tag my-first-image my-first-image:v1`

---

### ✅ Proof of Work
**Jagu:** "Golu, apni recipe aur image ka proof save karo!"

1. Create a file named **`dockerfile-basics.md`** in the **`solution/`** folder.
2. Include your Dockerfile contents and `docker images` output.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 33 • Golu & Jagu Edition*
