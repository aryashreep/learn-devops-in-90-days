# 🧪 Day 78 — Solution: Centralized Logs with Loki & Promtail

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 1. docker-compose.yml

```yaml
services:
  loki:
    image: grafana/loki:3.0.0
    ports:
      - "3100:3100"
    command: -config.file=/etc/loki/local-config.yaml
  promtail:
    image: grafana/promtail:3.0.0
    volumes:
      - ./promtail-config.yml:/etc/promtail/config.yml
      - /var/log:/var/log
    command: -config.file=/etc/promtail/config.yml
```

---

## ✅ 2. promtail-config.yml

```yaml
server:
  http_listen_port: 9080
  grpc_listen_port: 0
positions:
  filename: /tmp/positions.yaml
clients:
  - url: http://loki:3100/loki/api/v1/push
scrape_configs:
  - job_name: system
    static_configs:
      - targets:
          - localhost
        labels:
          job: varlogs
          __path__: /var/log/*.log
```

---

## ✅ 3. Stack Up & Ready

```bash
docker compose up -d
docker ps
```

**Expected Output:**
```
CONTAINER ID   IMAGE                COMMAND                  STATUS         PORTS                    NAMES
a1b2c3d4e5f6   grafana/promtail:3.0.0  "/usr/bin/promtail -c…"  Up 1 minute   9080/tcp                 loki-lab-promtail-1
f6e5d4c3b2a1   grafana/loki:3.0.0      "/usr/bin/loki -confi…"  Up 1 minute   0.0.0.0:3100->3100/tcp   loki-lab-loki-1
```

```bash
curl http://localhost:3100/ready
```
**Output:** `ready`

---

## ✅ 4. Generated Logs

```bash
echo "ERROR: db connection refused on payment service" | sudo tee -a /var/log/app.log
echo "INFO: healthcheck passed" | sudo tee -a /var/log/app.log
echo "WARN: memory usage at 85%" | sudo tee -a /var/log/app.log
```

Promtail tails `/var/log/app.log` (matches `/var/log/*.log`) and pushes lines to Loki within seconds.

---

## ✅ 5. Grafana Explore Results

| Query | Result |
|---|---|
| `{job="varlogs"}` | All 3 lines visible with `job="varlogs"` label |
| `{job="varlogs"} |= "ERROR"` | Only `ERROR: db connection refused on payment service` |
| `sum by (job) (count_over_time({job="varlogs"}[5m]))` | `{job="varlogs"} → 3` (or however many lines you wrote) |

**Sample rendered line:**
```
ERROR: db connection refused on payment service
job="varlogs"
```

---

## ✅ Lessons Learned

- **Loki** stores compressed logs indexed only by labels — cheap at scale.
- **Promtail** discovers files via `__path__` and pushes to Loki's `/loki/api/v1/push`.
- The **positions file** lets Promtail resume after restarts without losing logs.
- LogQL starts with a **label selector** `{...}`, then uses filters like `|=`.
- Grafana **Explore** gives you a single search box for all logs.

---

*#LearnDevOpsIn90Days • Day 78 • Golu & Jagu Edition*
