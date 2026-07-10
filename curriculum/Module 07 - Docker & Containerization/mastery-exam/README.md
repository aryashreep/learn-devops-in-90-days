# 🏆 Module 06 Mastery Exam: Docker & Containerization

Welcome to the **Mastery Exam** for Module 06! Test your knowledge on containerization, CLI commands, custom building, volumes, network configurations, and orchestration.

---

### 📝 30 Multiple Choice Questions

#### 🐳 Day 1: Docker Fundamentals (1-15)

1. **In the Docker architecture, where are Docker images stored and managed primarily?**
   - A) Docker Client
   - B) Docker Daemon
   - C) Docker Registry
   - D) Docker Network
   - **Answer:** C

2. **What is the key difference between a Virtual Machine (VM) and a Docker Container?**
   - A) VMs run natively on Linux, Containers run on hypervisors
   - B) Containers share the host OS kernel and are lightweight, while VMs need a full guest OS
   - C) VMs are faster to start up than containers
   - D) Docker containers cannot run on Linux
   - **Answer:** B

3. **Which command is used to download an image from Docker Hub to your local machine without running it?**
   - A) `docker run`
   - B) `docker load`
   - C) `docker fetch`
   - D) `docker pull`
   - **Answer:** D

4. **Which command removes a Docker image from the local system?**
   - A) `docker rm`
   - B) `docker rmi`
   - C) `docker delete`
   - D) `docker prune`
   - **Answer:** B

5. **What does the `docker exec` command do?**
   - A) Creates a new container from an image
   - B) Attaches your terminal's standard I/O to a stopped container
   - C) Runs a command (process) inside an already running container
   - D) Executes the startup command defined in the Dockerfile
   - **Answer:** C

6. **What is the difference between ADD and COPY in a Dockerfile?**
   - A) COPY should generally be preferred for simple file copying
   - B) ADD can download files from a URL and extract archive files; COPY only copies from local filesystem
   - C) COPY is deprecated; ADD is modern
   - D) There is no difference; they are aliases
   - **Answer:** B

7. **What does the EXPOSE instruction in a Dockerfile do?**
   - A) Publishes the port to the host machine automatically
   - B) Serves as documentation to indicate which ports the application listens on
   - C) Locks the container to the specified port
   - D) Redirects traffic to port 80
   - **Answer:** B

8. **What specific type of virtualization does Docker perform?**
   - A) Hardware-level virtualization
   - B) Hypervisor virtualization
   - C) CPU-level virtualization
   - D) OS-level virtualization
   - **Answer:** D

9. **Which command allows you to search for images available in Docker Hub?**
   - A) `docker find`
   - B) `docker locate`
   - C) `docker search`
   - D) `docker get`
   - **Answer:** C

10. **Which of the following is true about Docker containers regarding resource allocation?**
    - A) They allocate a fixed amount of RAM to containers upon startup
    - B) They run natively on macOS without a VM helper
    - C) They cannot be scaled dynamically
    - D) No pre-allocation of RAM is required; they consume resource dynamically
    - **Answer:** D

11. **Which Docker command do you use to open an interactive terminal session inside a running container?**
    - A) `docker exec -it <container_name> bash`
    - B) `docker run -it <container_name> bash`
    - C) `docker logs -it <container_name>`
    - D) `docker ps -it <container_name>`
    - **Answer:** A

12. **Which instruction sets the author/metadata of the generated images (in older Dockerfiles)?**
    - A) AUTHOR
    - B) OWNER
    - C) MAINTAINER
    - D) CREATOR
    - **Answer:** C

13. **If you define both ENTRYPOINT and CMD in a Dockerfile, which one takes priority?**
    - A) ENTRYPOINT runs first, and CMD is appended as default arguments to it
    - B) CMD takes absolute priority; ENTRYPOINT is ignored
    - C) They run in parallel
    - D) ENTRYPOINT is ignored if CMD contains arguments
    - **Answer:** A

14. **What does `docker ps` (without any arguments) display?**
    - A) All images on the host
    - B) All containers (running and stopped)
    - C) Only currently running containers
    - D) Docker Engine memory metrics
    - **Answer:** C

15. **What is a private container registry used for?**
    - A) Downloading official open-source base images
    - B) Sharing images securely within an enterprise/organization
    - C) Storing local backups of containers
    - D) Running containers in host network mode
    - **Answer:** B

---

#### 🌐 Day 2: Docker Advanced (16-30)

16. **What does `docker diff` show?**
    - A) Gaps between Client and Daemon versions
    - B) Changes (Additions, Deletions, Modifications) made to a container's filesystem
    - C) Difference between CMD and ENTRYPOINT parameters
    - D) Network latency across multiple container interfaces
    - **Answer:** B

17. **What is the key difference between `docker attach` and `docker exec`?**
    - A) `attach` creates a new process; `exec` connects to an existing process
    - B) `attach` is for stopped containers; `exec` is for running containers
    - C) `attach` connects standard I/O to the container's main process; `exec` creates a new process in the container
    - D) There is no difference; they are interchangeable
    - **Answer:** C

18. **Which Docker network is the default if none is specified?**
    - A) None
    - B) Host
    - C) Overlay
    - D) Bridge
    - **Answer:** D

19. **What is the main purpose of Docker Compose?**
    - A) To build a single Docker image
    - B) To configure and run multi-container applications
    - C) To configure cloud load balancers
    - D) To host images in a private registry
    - **Answer:** B

20. **Which single command is used to start the application stack defined in `docker-compose.yml` file in the background?**
    - A) `docker-compose start`
    - B) `docker compose up -d`
    - C) `docker compose run`
    - D) `docker-compose boot`
    - **Answer:** B

21. **What is the purpose of the health-check instruction in Docker Compose?**
    - A) To check server internet ping latency
    - B) To monitor host CPU thermal limits
    - C) To determine if the service inside the container is ready and functioning
    - D) To scan package dependencies for vulnerabilities
    - **Answer:** C

22. **When using Docker Compose, are services typically connected by default?**
    - A) No, they are placed on the "None" isolated driver
    - B) They communicate using host network sharing
    - C) Yes, Compose automatically sets up a single default bridge network for the stack
    - D) They cannot communicate unless `--link` is specified at runtime
    - **Answer:** C

23. **What is the purpose of the `.dockerignore` file?**
    - A) To ignore script compiler warnings
    - B) To bypass execution runtime constraints
    - C) To prevent specific host files and directories from being sent to the daemon context, reducing build size
    - D) To ignore networking routing settings
    - **Answer:** C

24. **Which tool is used for finding vulnerabilities in a Docker image?**
    - A) Docker Scout
    - B) Docker Defender
    - C) Docker Sentinel
    - D) Docker Guard
    - **Answer:** A

25. **What is the "Overlay" network driver used for?**
    - A) Connecting containers on the same single host
    - B) Connecting containers across multiple Docker hosts (multi-host clustering)
    - C) Disabling container network connectivity
    - D) Mapping container ports to local interfaces
    - **Answer:** B

26. **Which command is used to authenticate with a registry?**
    - A) `docker login`
    - B) `docker connect`
    - C) `docker auth`
    - D) `docker signin`
    - **Answer:** A

27. **To push to a third-party registry like AWS ECR/GCR, what is typically required?**
    - A) Upgrading the Docker daemon to enterprise version
    - B) Authentication and tagging the image with the registry URL
    - C) Running containers in Host network mode
    - D) Disabling all internal container ports
    - **Answer:** B

28. **What happens if you "expose" a port in a Dockerfile but do not publish it with `-p` at runtime?**
    - A) The container fails to start
    - B) The service is accessible only from inside the container or by other linked containers
    - C) The port is mapped to a random host port automatically
    - D) The container network blocks outbound calls
    - **Answer:** B

29. **Which command is used to clean up unused local volumes?**
    - A) `docker volume rmi`
    - B) `docker volume clean`
    - C) `docker volume prune`
    - D) `docker volume remove-all`
    - **Answer:** C

30. **To limit CPU and memory of a container, which command category is used?**
    - A) Container Resource Management
    - B) Container Networking
    - C) Docker Volumes
    - D) Registry Management
    - **Answer:** A
