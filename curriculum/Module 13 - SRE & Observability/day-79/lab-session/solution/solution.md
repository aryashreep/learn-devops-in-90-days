# 🧪 Day 79 — Solution: Traces + Alert Rules + Alertmanager

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 1. rules.yml

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

**Validation:**
```bash
promtool check rules rules.yml
```
**Output:**
```
Checking rules/rules.yml
  SUCCESS: 2 rules found
```

---

## ✅ 2. prometheus.yml additions

```yaml
rule_files:
  - 'rules.yml'

alerting:
  alertmanagers:
    - static_configs:
        - targets: ['localhost:9093']
```

Reload: `docker kill -s HUP prometheus`

---

## ✅ 3. alertmanager.yml

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

## ✅ 4. Alert Lifecycle (CPU stress)

While running `for i in $(seq $(nproc)); do yes > /dev/null & done`:

| State | Meaning |
|---|---|
| **Inactive** | expr evaluates false (CPU < 50%) |
| **Pending** | expr true but `for: 1m` not yet elapsed |
| **Firing** | condition sustained 1m → sent to Alertmanager |

Prometheus UI → **Alerts** showed:
```
HighCPUUsage  [1 active]  severity="warning"
  firing → Instance: localhost:9100, CPU > 50% for 1m
```

---

## ✅ 5. Manual Test Alert

```bash
curl -X POST -d '[{"labels":{"alertname":"TestAlert"}}]' http://localhost:9093/api/v1/alerts
```

**Output:** `{"status":"success"}`

Alertmanager UI at `http://localhost:9093` → **Alerts** → `TestAlert` listed. A **Silence** was created for 10 minutes with matcher `alertname=TestAlert`.

---

## ✅ 6. Cleanup

```bash
pkill yes   # stop CPU load → alert returns to Inactive
```

---

## ✅ Lessons Learned

- A **trace** follows one request across services; spans mark each step.
- **OTel** gives one SDK for traces + metrics + logs, exported via OTLP.
- Alert rules need `expr` + `for` — the `for` duration prevents flapping.
- **Alertmanager** (not Prometheus) handles grouping, routing, and notifications.
- Alerts go **Inactive → Pending → Firing**; silences suppress them during maintenance.
- Alert on symptoms (error rate, latency), not causes (process restarts).

---

*#LearnDevOpsIn90Days • Day 79 • Golu & Jagu Edition*
