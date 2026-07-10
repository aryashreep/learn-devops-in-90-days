# 🐳 Docker & Containerization — Command Cheatsheet

> **Quick reference for Docker: images, containers, Dockerfiles, volumes, networks, Compose, and registry operations.**
>
> *Print-friendly — designed for Cmd+P / PDF export.*

---

## 🏗️ Docker Architecture

```text
┌─────────────────────────────────────────────────────────┐
│                     Docker Client                        │
│              (docker CLI / Docker Desktop)               │
└─────────────────────────┬───────────────────────────────┘
                          │  REST API
                          ▼
┌─────────────────────────────────────────────────────────┐
│                   Docker Daemon (dockerd)                 │
│                                                          │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐ │
│  │  Image   │  │Container │  │ Volume   │  │ Network  │ │
│  │  Store   │  │  (Runs)  │  │  (Data)  │  │ (Connect)│ │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘ │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│                  Container Registry                       │
│           (Docker Hub, ECR, GCR, GHCR)                   │
└─────────────────────────────────────────────────────────┘
```

### Key Concepts

| Term | Description |
|------|-------------|
| **Image** | Read-only template (blueprint) |
| **Container** | Runnable instance of an image (process) |
| **Dockerfile** | Recipe to build an image |
| **Volume** | Persistent data storage |
| **Network** | Connect containers securely |
| **Registry** | Image storage & distribution |

---

## 📦 Image Management

```bash
# Search & pull
docker search nginx               # Search Docker Hub
docker pull nginx:latest          # Pull image from registry
docker pull nginx:alpine          # Pull specific tag
docker pull alpine:3.19           # Minimal ~5MB image

# List images
docker images                     # List all local images
docker images --filter "dangling=true"  # Show untagged images

# Inspect & history
docker inspect nginx              # Detailed image metadata
docker history nginx              # Image layer history

# Remove images
docker rmi nginx:latest           # Remove specific image
docker rmi $(docker images -q)    # Remove all images
docker image prune                # Remove dangling images
docker image prune -a             # Remove all unused images

# Tag & push
docker tag my-app:latest golu/my-app:latest
docker push golu/my-app:latest

# Save & load (offline transfer)
docker save -o my-app.tar my-app:latest
docker load -i my-app.tar

# Build
docker build -t my-app:latest .           # Build from Dockerfile
docker build -t my-app:v2 -f Dockerfile.prod .  # Custom Dockerfile
```

---

## 🚢 Container Lifecycle

```bash
# Run containers
docker run nginx                              # Foreground (attached)
docker run -d nginx                           # Detached (background)
docker run --name web -d nginx               # Named container
docker run -p 8080:80 -d nginx               # Port mapping (host:container)
docker run -v /data:/app/data -d nginx        # Volume mount
docker run --rm nginx                         # Auto-remove when stopped
docker run -it ubuntu bash                    # Interactive shell
docker run -e DB_HOST=localhost nginx         # Environment variables
docker run --network my-net nginx             # Custom network
docker run --memory="256m" --cpus="0.5" nginx # Resource limits

# List containers
docker ps                                    # Running containers
docker ps -a                                 # All containers (including stopped)
docker ps -q                                 # Only container IDs

# Stop / Start / Restart
docker stop web                              # Graceful stop (SIGTERM)
docker kill web                              # Force stop (SIGKILL)
docker start web                             # Start stopped container
docker restart web                           # Restart container

# Pause / Unpause
docker pause web                            # Freeze processes
docker unpause web                          # Resume

# Remove
docker rm web                               # Remove stopped container
docker rm -f web                            # Force remove running container
docker container prune                      # Remove all stopped containers
docker rm $(docker ps -aq)                  # Remove ALL containers

# Execute commands inside running container
docker exec -it web bash                    # Interactive shell
docker exec web cat /var/log/nginx/access.log  # Run command
docker exec web ls -la /app

# Logs
docker logs web                             # View logs
docker logs -f web                          # Follow (tail -f)
docker logs --tail 100 web                  # Last 100 lines
docker logs -t web                          # With timestamps

# Stats
docker stats                                # Live resource usage (all containers)
docker stats web                            # Specific container
docker top web                              # Processes inside container
docker inspect web                          # Detailed container metadata
```

### Lifecycle States

```text
docker create ──▶ Created ──▶ docker start ──▶ Running ──▶ docker stop ──▶ Stopped
                    ▲                            │                           │
                    │                    docker pause                        │
                    │                            ▼                           │
                    │                        Paused                          │
                    │                                                         │
                    └─────────────────── docker rm ──────────────────────────┘
                                                      │
                                                      ▼
                                                   Deleted
```

---

## 🧪 Dockerfile Reference

### Dockerfile Instructions

| Instruction | Description | Example |
|-------------|-------------|---------|
| `FROM` | Base image | `FROM node:20-alpine` |
| `WORKDIR` | Working directory | `WORKDIR /app` |
| `COPY` | Copy files from host | `COPY package*.json ./` |
| `ADD` | Copy + auto-extract tar/URL | `ADD archive.tar.gz /tmp/` |
| `RUN` | Execute command during build | `RUN npm ci --only=production` |
| `ENV` | Set environment variable | `ENV NODE_ENV=production` |
| `EXPOSE` | Document port (metadata) | `EXPOSE 8080` |
| `CMD` | Default command (can be overridden) | `CMD ["node", "server.js"]` |
| `ENTRYPOINT` | Fixed command (always runs) | `ENTRYPOINT ["docker-entrypoint.sh"]` |
| `ARG` | Build-time variable | `ARG VERSION=latest` |
| `LABEL` | Metadata | `LABEL maintainer="golu@example.com"` |
| `USER` | Run as non-root user | `USER node` |
| `HEALTHCHECK` | Container health probe | `HEALTHCHECK CMD curl -f http://localhost/` |
| `VOLUME` | Declare mount point | `VOLUME /data` |

### Build Best Practices

```dockerfile
# ✅ Multi-stage build
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:20-alpine AS runner
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
EXPOSE 3000
CMD ["node", "dist/server.js"]

# ❌ Don't use latest tag
FROM node:20-alpine        # ✅ Specific version
FROM node:latest           # ❌ Unpredictable

# ✅ Use BuildKit cache mounts
RUN --mount=type=cache,target=/root/.npm \
    npm ci --only=production

# ✅ Run as non-root
RUN addgroup -S app && adduser -S app -G app
USER app
```

### .dockerignore

```text
node_modules/
.git/
.env
*.md
Dockerfile
.dockerignore
.gitignore
dist/
.cache/
```

---

## 💾 Volumes & Data Persistence

```bash
# Volume types
docker volume create my-data              # Named volume
docker run -v my-data:/data nginx         # Mount named volume
docker run -v /host/path:/container nginx # Bind mount
docker run --tmpfs /tmp nginx             # Temporary in-memory

# Volume management
docker volume ls                          # List volumes
docker volume inspect my-data             # Volume details
docker volume rm my-data                  # Remove volume
docker volume prune                       # Remove unused volumes

# Copy files between host and container
docker cp file.txt web:/app/              # Host → Container
docker cp web:/app/log.txt ./             # Container → Host

# Volume mounts vs Copy
# - COPY: embed files into image (build time)
# - Volume: attach files at runtime (no rebuild needed)
```

---

## 🌐 Networks

```bash
# Network types
docker network create my-net             # Bridge (default for apps)
docker network create --driver overlay my-net  # Swarm overlay
docker network ls                        # List networks
docker network inspect my-net            # Network details

# Connect containers
docker run --network my-net --name web -d nginx
docker network connect my-net db         # Connect running container

# Container discovery (built-in DNS)
# web → ping db →  resolves to container IP
# db  → ping web → resolves to container IP

# Port mapping
-p 8080:80          # Host:8080 → Container:80
-p 3000:3000        # Same port
-p 8080:80/udp      # UDP port mapping

# Expose (documentation only, no actual port mapping)
--expose 3000
```

---

## 🐙 Docker Compose

```yaml
# docker-compose.yml
version: "3.9"
services:
  web:
    build: .
    ports:
      - "8080:3000"
    environment:
      - DB_HOST=db
      - NODE_ENV=production
    volumes:
      - ./data:/app/data
    depends_on:
      - db
    restart: unless-stopped
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000/health"]
      interval: 30s
      timeout: 10s
      retries: 3

  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_PASSWORD_FILE: /run/secrets/db_password
    volumes:
      - pgdata:/var/lib/postgresql/data
    secrets:
      - db_password

volumes:
  pgdata:

secrets:
  db_password:
    file: ./secrets/db_password.txt
```

```bash
# Compose commands
docker compose up -d                    # Start services in background
docker compose down                     # Stop and remove containers
docker compose down -v                  # + remove volumes
docker compose logs -f                  # Follow logs
docker compose ps                       # List service containers
docker compose exec web bash            # Shell into service
docker compose build                    # Build (or rebuild) services
docker compose pull                     # Pull latest images
docker compose restart web              # Restart specific service
docker compose config                   # Validate compose file
```

---

## 📊 Useful Docker Commands

```bash
# System
docker version                    # Client + server versions
docker info                       # System-wide information
docker system df                  # Disk usage (images, containers, volumes)
docker system prune               # Clean everything unused
docker system prune -a --volumes  # Deep clean (⚠️ removes all unused)

# Container → Image
docker commit web my-web:snapshot     # Create image from container (not recommended)
docker export web > container.tar     # Export container filesystem
docker import container.tar my-image  # Import as image

# Platform & architecture
docker buildx build --platform linux/amd64,linux/arm64 -t my-app:latest .
docker run --platform linux/amd64 alpine
```

---

## 🔐 Docker Hub & Registries

```bash
# Login
docker login                    # Docker Hub
docker login ghcr.io            # GitHub Container Registry
docker login my-registry.com:5000  # Private registry

# Push/Pull
docker push golu/my-app:latest
docker pull alpine:3.19

# Tag for different registries
docker tag my-app:latest ghcr.io/golu/my-app:latest
docker push ghcr.io/golu/my-app:latest
```

---

> *🐳 Docker & Containerization Cheatsheet — #LearnDevOpsIn90Days • Module 07*
>
> *Maintainer: [Aryashree Pritikrishna](https://github.com/aryashreep)*
