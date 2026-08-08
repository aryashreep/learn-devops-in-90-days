# 🗓️ Day 80 — Project: Full Stack Observability

Welcome to **Day 80**! This is the capstone of the SRE & Observability module. You'll bring **everything together** — Prometheus + Node Exporter + cAdvisor + Grafana + Loki + Promtail + Alertmanager — into one docker-compose stack that monitors metrics, collects logs, and pages you on problems.

---

## 🎯 Today's Goal
Deploy a complete observability platform in one compose file, wire up a unified dashboard, and prove the alerting path works end-to-end.

## 🧠 Key Learnings
- **One-Stop Stack:** Composing exporters, Prometheus, Grafana, Loki, Promtail, and Alertmanager.
- **Unified Visibility:** Correlate a metric spike with its logs.
- **Proactive Alerting:** CPU alert that fires and notifies via webhook.
- **Troubleshooting Practice:** Debugging the stack using the very tools you built.

## 🧠 Pro Module
[🎓 Day 80 Pro Module: Full Stack Observability Project](./Day80_Full_Stack_Observability.html)

## 🧪 Hands-on Lab
👉 [Lab Session: Full Stack Observability Project](./lab-session/task.md)

---

## 📖 Key Concepts

### The Stack

```
┌─ Node Exporter :9100 ─┐
├─ cAdvisor      :8080  ├──→ Prometheus :9090 ──→ Grafana :3000
└─ Promtail      :9080  ─┘      │                    │
                      Loki :3100 ◄───── queries ─────┘
                      Alertmanager :9093 ◄── alert rules
```

| Service | Port | Role |
|---|---|---|
| Node Exporter | 9100 | Host metrics |
| cAdvisor | 8080 | Container metrics |
| Prometheus | 9090 | Metrics store + alert rules |
| Alertmanager | 9093 | Alert delivery |
| Grafana | 3000 | Dashboards |
| Loki | 3100 | Log store |
| Promtail | 9080 | Log shipping agent |

### Unified Dashboard Query

```promql
# Panel 1 — CPU % (from node exporter)
100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

# Panel 2 — Container CPU (from cAdvisor)
sum(rate(container_cpu_usage_seconds_total{name!=""}[5m])) by (name) * 100

# Panel 3 — Log volume (from Loki, as a log panel)
{job="varlogs"}
```

### Pro Tip — Correlate

When the CPU panel spikes, open **Explore → Loki** and query `{job="varlogs"} |= "ERROR"` for the same time range. The metric says "when", the log says "why".

---

## ❓ Mini Quiz

1. **Which service ships container metrics in the full stack?**
   - a) Promtail
   - b) Node Exporter
   - c) cAdvisor
   - d) Loki

2. **Which port does Grafana listen on?**
   - a) 9093
   - b) 3000
   - c) 9090
   - d) 3100

3. **Where does Promtail push logs?**
   - a) Grafana
   - b) Alertmanager
   - c) Prometheus
   - d) Loki

**Answers:** 1-c | 2-b | 3-d

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 13: SRE & Observability*
