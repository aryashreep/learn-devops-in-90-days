# 📊 Module 13: SRE & Observability

Welcome to **Module 13**! In this module, we master **Site Reliability Engineering and Observability** — the practice of making your systems visible, measurable, and self-healing. Using the **LGTM stack** (Loki, Grafana, Tempo, Mimir/Prometheus), we'll collect metrics, logs, and traces from every service, visualize them on dashboards, and get alerted the moment something goes wrong.

> *"You can't fix what you can't see. Observability is how you see everything."*

---

## 🎯 Module Overview
This 5-day module will take you from monitoring basics to a full-stack observability platform, covering metrics collection with Prometheus, dashboards with Grafana, log aggregation with Loki, tracing with OpenTelemetry, and intelligent alerting.

| Day | Topic | Key Focus |
|---|---|---|
| **Day 76** | [Introduction to Observability & Prometheus](./day-76/README.md) | Metrics, pull model, PromQL, TSDB, scrape configuration |
| **Day 77** | [Exporters & Grafana Dashboards](./day-77/README.md) | Node Exporter, cAdvisor, Grafana data sources & panels |
| **Day 78** | [Loki & Promtail Log Management](./day-78/README.md) | Log aggregation, labels, LogQL querying |
| **Day 79** | [OpenTelemetry & Alerting](./day-79/README.md) | Tracing, OTLP, Alert rules, Alertmanager receivers |
| **Day 80** | [Project: Full Stack Observability](./day-80/README.md) | End-to-end metrics + logs + alerts on one compose stack |

---

## 📚 Module Resources

| Resource | Link |
|---|---|
| 📊 **SRE & Observability Cheatsheet** | [Command Reference](./SRE_Observability_CHEATSHEET.md) |
| 📝 **Module 13 Mastery Exam** | [30 MCQs](./mastery-exam/README.md) |

---

## 🏆 Mastery Assessment
After completing all 5 days, validate your knowledge:
- 📝 [Module 13 Mastery Exam](./mastery-exam/README.md) (30 MCQs)

---

## 🔗 Cross-References

| Module | Link |
|---|---|
| Module 08 — CI/CD with GitHub Actions | [CI-CD with GitHub Actions](../Module%2008%20-%20CI-CD%20with%20GitHub%20Actions/README.md) (deploying monitoring stacks in pipelines) |
| Module 10 — Kubernetes | [Kubernetes](../Module%2010%20-%20Kubernetes/README.md) (Kubernetes Dashboard & metrics-server give cluster visibility) |
| Module 12 — Ansible [Config Mgmt] | [Ansible](../Module%2012%20-%20Ansible%20%5BConfig%20Mgmt%5D/README.md) (automate the deployment of your observability stack) |

*If Kubernetes runs your containers, observability tells you how healthy they really are. Metrics, logs, and traces are the SRE's eyes and ears! 📊*
