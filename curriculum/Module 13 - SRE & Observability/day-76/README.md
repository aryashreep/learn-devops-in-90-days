# 🗓️ Day 76 — Introduction to Observability and Prometheus Setup

Welcome to **Day 76**! Today we begin the module **SRE & Observability**. We'll understand what observability really means (and how it differs from classic monitoring), install **Prometheus** — the CNCF-graduated metrics system — and scrape our first metrics.

---

## 🎯 Today's Goal
Understand the three pillars of observability, install Prometheus, configure your first scrape targets, and run basic PromQL queries.

## 🧠 Key Learnings
- **Observability vs Monitoring:** The difference between asking "is it down?" and "why is it broken?"
- **Three Pillars:** Metrics, Logs, and Traces.
- **Pull Architecture:** Why Prometheus scrapes rather than receiving pushes.
- **Metric Types:** Counter, Gauge, Histogram, and Summary.
- **PromQL Basics:** `up`, `rate()`, and gauge queries against live metrics.
- **prometheus.yml:** Global settings and scrape configurations.

## 🧠 Pro Module
[🎓 Day 76 Pro Module: Introduction to Observability & Prometheus](./Day76_Prometheus_Setup.html)

## 🧪 Hands-on Lab
👉 [Lab Session: First Prometheus Scrape & PromQL](./lab-session/task.md)

---

## 📖 Key Concepts

### Observability vs Monitoring

Monitoring answers **"is something wrong?"** — fixed dashboards, threshold checks. Observability answers **"why is it wrong?"** — the freedom to ask any new question about your system using its telemetry data.

```
Monitoring:  Known unknowns (pre-built dashboards)
Observability: Unknown unknowns (explore with metrics, logs, traces)
```

### The Three Pillars

| Pillar | Question | Example Tool |
|---|---|---|
| Metrics | "Is it slow, down, or full?" | Prometheus |
| Logs | "What exactly happened?" | Loki |
| Traces | "Which path caused it?" | OpenTelemetry / Tempo |

### Why Prometheus PULLs (not PUSH)

- Each exporter exposes a `/metrics` HTTP endpoint.
- Prometheus scrapes it on a schedule (`scrape_interval`).
- Pull model = easy health checks, no agent installation, works behind load balancers.

```
┌────────────┐   scrape    ┌──────────────┐
│ Prometheus │ ──────────→ │ App /metrics │
│  (TSDB)    │   :9090     │ Node Exporter│
└────────────┘             └──────────────┘
```

### Installing Prometheus with Docker

```bash
# Run Prometheus with a bind-mounted config
mkdir -p ~/prom && cd ~/prom
cat > prometheus.yml <<'EOF'
global:
  scrape_interval: 15s
scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']
EOF

docker run -d --name prometheus -p 9090:9090 \
  -v $PWD/prometheus.yml:/etc/prometheus/prometheus.yml \
  prom/prometheus
```

### First PromQL Queries

```promql
# Is each target healthy? (1 = up, 0 = down)
up

# How much memory does Prometheus use?
process_resident_memory_bytes

# Prometheus samples ingested per second
rate(prometheus_tsdb_head_samples_appended_total[5m])
```

---

## ❓ Mini Quiz

1. **Which is NOT one of the three pillars of observability?**
   - a) Metrics
   - b) Logs
   - c) Traces
   - d) Backups

2. **How does Prometheus collect metrics?**
   - a) Agents push data to it
   - b) It pulls (scrapes) metrics over HTTP
   - c) It reads systemd journal only
   - d) It uses SNMP traps

3. **Which metric type can only increase (and resets on restart)?**
   - a) Gauge
   - b) Counter
   - c) Histogram
   - d) Summary

**Answers:** 1-d | 2-b | 3-b

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 13: SRE & Observability*
