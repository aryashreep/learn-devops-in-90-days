# 🗓️ Day 78 — Loki & Promtail Log Management

Welcome to **Day 78**! Metrics tell you a server is broken — but only **logs** tell you exactly why. Today we build centralized log management with **Loki** (the log store) and **Promtail** (the log agent), then query logs like a pro with **LogQL**.

---

## 🎯 Today's Goal
Stand up a Loki + Promtail stack, ship application logs to it, and query them from Grafana using LogQL.

## 🧠 Key Learnings
- **Why Centralized Logs:** `ssh server && tail -f` doesn't scale.
- **Loki Architecture:** Logs are compressed, indexed by labels — "like Prometheus, but for logs".
- **Promtail:** The agent that discovers log files, adds labels, and pushes to Loki.
- **LogQL Basics:** Label selectors `{job="varlogs"}` and line filters `|= "ERROR"`.
- **Grafana Integration:** Adding Loki as a data source.

## 🧠 Pro Module
[🎓 Day 78 Pro Module: Loki & Promtail Log Management](./Day78_Loki_Promtail.html)

## 🧪 Hands-on Lab
👉 [Lab Session: Centralized Logs with Loki & Promtail](./lab-session/task.md)

---

## 📖 Key Concepts

### Why Loki?

| Feature | Loki | ELK (Elasticsearch) |
|---|---|---|
| Indexing | Labels only (cheap) | Full-text (expensive) |
| Storage | Object storage / local | Lucene indices |
| Language | LogQL | Lucene/ES DSL |
| Resource Use | Low | High |
| Best for | Kubernetes/DevOps | Full-text search |

### docker-compose snippet

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

### Promtail config

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

### LogQL examples

```logql
# All logs from the varlogs job
{job="varlogs"}

# Filter lines containing ERROR
{job="varlogs"} |= "ERROR"

# Logs from last hour, excluding DEBUG
{job="varlogs"} |~ "ERROR|WARN"

# Count log lines per 5 minutes
sum by (job) (count_over_time({job="varlogs"}[5m]))
```

---

## ❓ Mini Quiz

1. **Which tool ships logs to Loki?**
   - a) Grafana
   - b) Fluentd only
   - c) Prometheus
   - d) Promtail

2. **Loki stores logs indexed by:**
   - a) Full-text tokens
   - b) Timestamps only
   - c) Labels
   - d) Container IDs only

3. **Which LogQL filter finds lines containing "ERROR"?**
   - a) `{job="x"} |= "ERROR"`
   - b) `{job="x"} = "ERROR"`
   - c) `{job="x"} contains "ERROR"`
   - d) `grep "ERROR"`

**Answers:** 1-d | 2-c | 3-a

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 13: SRE & Observability*
