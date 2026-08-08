# 🗓️ Day 77 — Exporters & Grafana Dashboards

Welcome to **Day 77**! Today we make Prometheus actually useful. We'll deploy **Node Exporter** (host metrics) and **cAdvisor** (container metrics), then build beautiful, real-time **Grafana dashboards** on top of the data.

---

## 🎯 Today's Goal
Deploy exporters, scrape them with Prometheus, connect Grafana to Prometheus as a data source, and build/import dashboards.

## 🧠 Key Learnings
- **Node Exporter:** Host-level metrics (CPU, RAM, disk, network) on port `9100`.
- **cAdvisor:** Per-container metrics (CPU, memory, network) on port `8080`.
- **Scrape Jobs:** Adding exporter targets to `prometheus.yml`.
- **Grafana Basics:** Data sources, dashboards, panels, and variables.
- **Dashboard Import:** Using community dashboards (e.g., Node Exporter Full `1860`).
- **Custom Panels:** Writing PromQL-driven visualizations.

## 🧠 Pro Module
[🎓 Day 77 Pro Module: Exporters & Grafana Dashboards](./Day77_Exporters_Grafana.html)

## 🧪 Hands-on Lab
👉 [Lab Session: Node Exporter + cAdvisor + Grafana](./lab-session/task.md)

---

## 📖 Key Concepts

### Node Exporter

```bash
# Run Node Exporter (host metrics)
docker run -d --name node_exporter -p 9100:9100 \
  --net="host" --pid="host" \
  -v "/:/host:ro,rslave" \
  quay.io/prometheus/node-exporter:latest \
  --path.rootfs=/host
```

### cAdvisor (container metrics)

```bash
docker run -d --name cadvisor -p 8080:8080 \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  gcr.io/cadvisor/cadvisor:latest
```

### Scrape both in prometheus.yml

```yaml
scrape_configs:
  - job_name: 'node'
    static_configs:
      - targets: ['localhost:9100']
  - job_name: 'cadvisor'
    static_configs:
      - targets: ['localhost:8080']
```

### Grafana

```bash
docker run -d --name grafana -p 3000:3000 grafana/grafana
# Login: admin / admin  (change on first login)
# Add data source: Prometheus → http://localhost:9090
# Import dashboard 1860 (Node Exporter Full)
```

### Useful PromQL for dashboards

```promql
# CPU usage % per instance
100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

# Memory used bytes
node_memory_MemTotal_bytes - node_memory_MemFree_bytes - node_memory_Buffers_bytes - node_memory_Cached_bytes

# Container CPU
rate(container_cpu_usage_seconds_total{name!=""}[5m]) * 100
```

---

## ❓ Mini Quiz

1. **Which port does Node Exporter listen on by default?**
   - a) 8080
   - b) 9100
   - c) 9090
   - d) 3000

2. **Which exporter provides per-container metrics?**
   - a) Node Exporter
   - b) Blackbox Exporter
   - c) cAdvisor
   - d) MySQL Exporter

3. **What is the default Grafana login?**
   - a) root / root
   - b) admin / admin
   - c) grafana / grafana
   - d) user / password

**Answers:** 1-b | 2-c | 3-b

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 13: SRE & Observability*
