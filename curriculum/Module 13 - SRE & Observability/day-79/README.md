# 🗓️ Day 79 — OpenTelemetry & Alerting

Welcome to **Day 79**! Today we add the third pillar — **traces** with OpenTelemetry — and make the whole stack proactive with **alerting**. Your systems will stop telling you "I broke" after the fact; instead they'll page you *before* users notice.

---

## 🎯 Today's Goal
Understand distributed tracing with OpenTelemetry, then configure Prometheus alert rules and Alertmanager to notify you via webhook/email when things go wrong.

## 🧠 Key Learnings
- **OpenTelemetry (OTel):** The vendor-neutral standard for traces, metrics, and logs.
- **Traces & Spans:** How one request flows across services.
- **OTLP:** The OpenTelemetry Protocol for exporting telemetry.
- **Alert Rules:** `expr`, `for`, `labels`, `annotations` in `rules.yml`.
- **Alertmanager:** Grouping, routing, receivers (webhook/email/slack), silences.

## 🧠 Pro Module
[🎓 Day 79 Pro Module: OpenTelemetry & Alerting](./Day79_OpenTelemetry_Alerting.html)

## 🧪 Hands-on Lab
👉 [Lab Session: Traces + Alert Rules + Alertmanager](./lab-session/task.md)

---

## 📖 Key Concepts

### Distributed Tracing

A **trace** is the journey of one request through many services. Each unit of work is a **span**:

```
Browser → API Gateway (span) → Auth Service (span)
                              → Payment Service (span) ← 1200ms! ← bottleneck
                              → DB Query (span)
```

OpenTelemetry gives you: **Traces + Metrics + Logs** from ONE instrumentation SDK, exported via **OTLP** to any backend (Tempo, Jaeger, Datadog, etc.).

### Alert Flow

```
Prometheus → evaluates rules.yml every 15s
   └── alert fires (after `for: 5m` sustained)
        → Alertmanager :9093
             ├── groups related alerts
             ├── routes to receiver
             └── notifies: webhook / email / Slack
```

### rules.yml (on Prometheus)

```yaml
groups:
  - name: node-alerts
    rules:
      - alert: HighCPUUsage
        expr: 100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100) > 80
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "High CPU on {{ $labels.instance }}"
          runbook: "https://wiki.example.com/cpu"
```

### alertmanager.yml

```yaml
route:
  group_by: ['alertname']
  group_wait: 30s
  receiver: 'webhook'

receivers:
  - name: 'webhook'
    webhook_configs:
      - url: 'http://localhost:5000/alert'
```

---

## ❓ Mini Quiz

1. **What is a span in tracing?**
   - a) A log line
   - b) A metric type
   - c) One unit of work inside a trace
   - d) A dashboard panel

2. **Which keyword in an alert rule requires the condition to hold for a duration before firing?**
   - a) `duration`
   - b) `hold`
   - c) `wait`
   - d) `for`

3. **Which tool delivers alerts to channels like Slack/email?**
   - a) Alertmanager
   - b) Prometheus alone
   - c) Grafana
   - d) Loki

**Answers:** 1-c | 2-d | 3-a

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 13: SRE & Observability*
