# 🧪 Day 77 — Solution: Node Exporter + cAdvisor + Grafana

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 1. Node Exporter Running

```bash
docker run -d --name node_exporter -p 9100:9100 \
  --net="host" --pid="host" \
  -v "/:/host:ro,rslave" \
  quay.io/prometheus/node-exporter:latest \
  --path.rootfs=/host

curl localhost:9100/metrics | grep node_cpu_seconds_total | head -3
```

**Expected Output:**
```
# HELP node_cpu_seconds_total Seconds the cpus spent in each mode.
# TYPE node_cpu_seconds_total counter
node_cpu_seconds_total{cpu="0",mode="idle"} 18742.42
node_cpu_seconds_total{cpu="0",mode="iowait"} 12.05
node_cpu_seconds_total{cpu="0",mode="system"} 305.11
```

---

## ✅ 2. cAdvisor Running

```bash
curl localhost:8080/metrics | grep container_cpu_usage_seconds_total | head -3
```

**Expected Output:**
```
# HELP container_cpu_usage_seconds_total Cumulative time cpu consumed in seconds.
# TYPE container_cpu_usage_seconds_total counter
container_cpu_usage_seconds_total{container_label_...="...",id="/docker/abc123...",image="prom/prometheus",name="prometheus"} 12.83
```

---

## ✅ 3. Updated prometheus.yml

```yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']

  - job_name: 'node'
    static_configs:
      - targets: ['localhost:9100']

  - job_name: 'cadvisor'
    static_configs:
      - targets: ['localhost:8080']
```

```bash
docker kill -s HUP prometheus
```

**Targets page result:** `prometheus`, `node`, and `cadvisor` jobs all show **UP**.

---

## ✅ 4. Grafana Data Source

- Data Source: **Prometheus**
- URL: `http://localhost:9090`
- **Save & Test** → green banner: *"Data source is working"*

---

## ✅ 5. Imported Dashboard (ID 1860 — Node Exporter Full)

The dashboard loads with rows like:
- **CPU Usage** — per-core utilization
- **Memory Usage** — RAM totals + usage
- **Network Traffic** — RX/TX per interface
- **Disk I/O** — read/write throughput

Example query inside the dashboard:
```promql
100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[2m])) * 100)
```

---

## ✅ 6. Custom Panel — CPU Usage %

| Setting | Value |
|---|---|
| Panel title | CPU Usage % |
| Query | `100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)` |
| Visualization | Time series |
| Unit | Percent (0-100) |

**Expected behavior:** A line hovering between 0–100% that spikes when you run `stress` or compile code.

---

## ✅ Lessons Learned

- **Exporters** translate external stats into Prometheus `/metrics` format.
- Node Exporter = host OS; cAdvisor = containers.
- Prometheus config can be **hot-reloaded** with `SIGHUP`.
- Grafana panels run PromQL — a custom query gives you full control.
- Community dashboards (like 1860) are a huge head start.

---

*#LearnDevOpsIn90Days • Day 77 • Golu & Jagu Edition*
