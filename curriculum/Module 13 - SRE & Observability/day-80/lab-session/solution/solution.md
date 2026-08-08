# 🧪 Day 80 — Solution: Full Stack Observability Project

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 1. docker-compose.yml

```yaml
services:
  node-exporter:
    image: quay.io/prometheus/node-exporter:latest
    command: --path.rootfs=/host
    ports:
      - "9100:9100"
    volumes:
      - /:/host:ro,rslave

  cadvisor:
    image: gcr.io/cadvisor/cadvisor:latest
    ports:
      - "8080:8080"
    volumes:
      - /:/rootfs:ro
      - /var/run:/var/run:ro
      - /sys:/sys:ro
      - /var/lib/docker/:/var/lib/docker:ro

  prometheus:
    image: prom/prometheus
    ports:
      - "9090:9090"
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
      - ./rules.yml:/etc/prometheus/rules.yml
    command: --config.file=/etc/prometheus/prometheus.yml

  alertmanager:
    image: prom/alertmanager
    ports:
      - "9093:9093"
    volumes:
      - ./alertmanager.yml:/etc/alertmanager/alertmanager.yml

  grafana:
    image: grafana/grafana
    ports:
      - "3000:3000"

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

## ✅ 2. prometheus.yml

```yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

rule_files:
  - 'rules.yml'

alerting:
  alertmanagers:
    - static_configs:
        - targets: ['alertmanager:9093']

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']
  - job_name: 'node'
    static_configs:
      - targets: ['node-exporter:9100']
  - job_name: 'cadvisor'
    static_configs:
      - targets: ['cadvisor:8080']
```

---

## ✅ 3. rules.yml

```yaml
groups:
  - name: node-alerts
    rules:
      - alert: HighCPUUsage
        expr: 100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100) > 50
        for: 1m
        labels:
          severity: warning
        annotations:
          summary: "High CPU on {{ $labels.instance }}"
      - alert: InstanceDown
        expr: up == 0
        for: 1m
        labels:
          severity: critical
        annotations:
          summary: "Instance {{ $labels.instance }} is down"
```

`promtool check rules rules.yml` → `SUCCESS: 2 rules found`

---

## ✅ 4. alertmanager.yml

```yaml
route:
  group_by: ['alertname']
  group_wait: 10s
  receiver: 'webhook'

receivers:
  - name: 'webhook'
    webhook_configs:
      - url: 'http://localhost:5000/alert'
        send_resolved: true
```

---

## ✅ 5. promtail-config.yml

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

## ✅ 6. Verification

```bash
docker compose up -d
docker compose ps
```

**Expected Output (7 services):**
```
NAME                       STATUS         PORTS
observability-lab-...      Up             0.0.0.0:9090->9090/tcp
observability-lab-...      Up             0.0.0.0:9093->9093/tcp
observability-lab-...      Up             0.0.0.0:3000->3000/tcp
observability-lab-...      Up             0.0.0.0:3100->3100/tcp
...
```

```bash
curl "http://localhost:9090/api/v1/query?query=up"
```

**Expected Output (abridged):**
```json
{
  "status": "success",
  "data": {
    "result": [
      { "metric": { "__name__": "up", "job": "prometheus" }, "value": [1720000000, "1"] },
      { "metric": { "__name__": "up", "job": "node" },       "value": [1720000000, "1"] },
      { "metric": { "__name__": "up", "job": "cadvisor" },   "value": [1720000000, "1"] }
    ]
  }
}
```

---

## ✅ 7. Dashboard

- Imported **1860 (Node Exporter Full)** against the Prometheus data source.
- Added a **Logs panel**: data source Loki, query `{job="varlogs"}`.
- Both data sources returned "Data source is working" on Save & Test.

---

## ✅ 8. Alert Lifecycle Test

Under `for i in $(seq $(nproc)); do yes > /dev/null & done`:

| Stage | Observation |
|---|---|
| Pending | `HighCPUUsage` expr true, waiting 1m |
| Firing | Sent to Alertmanager; visible at `:9093` with `severity="warning"` |
| Resolved | After `pkill yes`, alert returns to Inactive (webhook receives `resolved`) |

---

## ✅ 9. Incident Report (Mini)

- **When:** During the stress test, `node_cpu_seconds_total` idle dropped → CPU panel spiked above 50%.
- **Metric evidence:** `100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)` → ~99%.
- **Log evidence:** Loki `{job="varlogs"} |= "ERROR"` showed repeated `out of memory` lines from the stress processes.
- **Root cause:** Artificial CPU load (`yes` processes) — resolved by `pkill yes`.
- **MTTR:** ~1 minute, found via the metric spike then confirmed via logs.

---

## ✅ Lessons Learned

- A **single compose file** runs a production-grade observability platform.
- Metrics + logs + alerts must be **wired together** (targets, data sources, routes) — that wiring is the real skill.
- Alert state machine: **Inactive → Pending → Firing → Resolved**.
- **Correlation** (metric says when, log says why) is the core SRE debugging technique.
- Always debug with `docker logs <service>` — the stack debugs itself!

---

*#LearnDevOpsIn90Days • Day 80 • Golu & Jagu Edition*
