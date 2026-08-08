# 📊 SRE & Observability Cheatsheet

## 🚀 Essential Prometheus Commands

| Command | Description |
|---|---|
| `prometheus --config.file=prometheus.yml` | Start Prometheus with a config file |
| `curl http://localhost:9090/metrics` | Scrape the Prometheus metrics endpoint directly |
| `curl http://localhost:9090/api/v1/targets` | List all scrape targets and their health |
| `curl "http://localhost:9090/api/v1/query?query=up"` | Run an instant PromQL query via API |
| `promtool check config prometheus.yml` | Validate the Prometheus config file |
| `promtool check rules rules.yml` | Validate Prometheus alert/recording rules |
| `docker run -p 9090:9090 -v $PWD/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus` | Run Prometheus in Docker |

## 📈 PromQL (Prometheus Query Language) Basics

```promql
# All targets that are up (returns 1 for healthy)
up

# CPU usage as a percentage
100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

# Memory used in bytes
node_memory_MemTotal_bytes - node_memory_MemFree_bytes - node_memory_Buffers_bytes - node_memory_Cached_bytes

# Requests per second (counter rate)
rate(http_requests_total[5m])

# HTTP error rate percentage
sum(rate(http_requests_total{status=~"5.."}[5m])) / sum(rate(http_requests_total[5m])) * 100

# Top 5 processes by memory
topk(5, process_resident_memory_bytes)

# Container CPU usage via cAdvisor
rate(container_cpu_usage_seconds_total[5m])
```

## 🔍 Metric Types

| Type | Description | Example |
|---|---|---|
| **Counter** | Only increases (restarts reset) | `http_requests_total` |
| **Gauge** | Can go up and down | `node_memory_MemFree_bytes` |
| **Histogram** | Distribution of values + count/sum | `http_request_duration_seconds` |
| **Summary** | Pre-computed quantiles | `rpc_duration_seconds` |

## 🔧 Exporters

| Exporter | Port | Metrics Exposed |
|---|---|---|
| Node Exporter | `9100` | Host metrics: CPU, RAM, disk, network |
| cAdvisor | `8080` | Container metrics: CPU, memory, network per container |
| MySQL Exporter | `9104` | MySQL server metrics |
| Blackbox Exporter | `9115` | HTTP/HTTPS/TCP endpoint probing |
| PostgreSQL Exporter | `9187` | PostgreSQL metrics |
| process-exporter | `9256` | Process-level metrics |

## ⚙️ prometheus.yml Scrape Config

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

## 📊 Grafana Essentials

| Command / Concept | Description |
|---|---|
| `docker run -p 3000:3000 grafana/grafana` | Run Grafana (default login `admin` / `admin`) |
| Data Source | Add Prometheus at `http://prometheus:9090` (URL: `http://localhost:9090`) |
| Dashboard Import | Dashboards → Import → Paste dashboard ID (Node Exporter Full: `1860`, cAdvisor: `14282`) |
| Panel | Visualization of a PromQL query (Graph, Stat, Table, Gauge) |
| Variables | Reusable dropdowns in dashboards, e.g. `$instance` |
| Annotations | Events overlaid on graphs (e.g., deployments) |

## 🪵 Loki & Promtail

```yaml
# promtail-config.yml (agent)
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

```logql
# All logs from a job
{job="varlogs"}

# Logs with a label filter (regex)
{job="varlogs"} |= "ERROR"

# Count logs per level over 5m
sum by (level) (count_over_time({job="nginx"} | json | unwrap level [5m]))

# First log line of each stream
{job="nginx"} | line_format "{{.message}}"
```

## 🚨 Alerting with Alertmanager

```yaml
# rules.yml
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
```

```yaml
# alertmanager.yml
route:
  group_by: ['alertname']
  group_wait: 30s
  receiver: 'webhook'

receivers:
  - name: 'webhook'
    webhook_configs:
      - url: 'http://localhost:5000/alert'
```

| Alertmanager Command | Description |
|---|---|
| `docker run -p 9093:9093 -v $PWD/alertmanager.yml:/etc/alertmanager/alertmanager.yml prom/alertmanager` | Run Alertmanager |
| `curl -X POST -d '[{"labels":{"alertname":"Test"}}]' http://localhost:9093/api/v1/alerts` | Send a test alert |
| `amtool check-config alertmanager.yml` | Validate alertmanager config |

## 🧬 OpenTelemetry (OTel)

| Concept | Description |
|---|---|
| **Trace** | The journey of a single request through services |
| **Span** | One unit of work inside a trace (has duration, name, attributes) |
| **OTLP** | OpenTelemetry Protocol — how telemetry data is exported |
| **Collector** | Optional agent that receives, processes, and exports telemetry |
| Signals | Traces, Metrics, Logs (the "three pillars") |
| `otel-cli span --name "my span" --kind client` | Generate a span from the CLI |

## 🧠 Three Pillars of Observability

| Pillar | Question Answered | Tool |
|---|---|---|
| **Metrics** | "Is it slow / down / full?" | Prometheus |
| **Logs** | "What exactly happened?" | Loki |
| **Traces** | "Which request path caused it?" | OpenTelemetry / Tempo |

## 🎯 SLO / SLI / Error Budget

| Term | Meaning |
|---|---|
| **SLI** (Service Level Indicator) | A measurable signal — e.g., "99.9% of requests return in < 300ms" |
| **SLO** (Service Level Objective) | The reliability target you commit to — e.g., "99.9% availability this quarter" |
| **Error Budget** | The allowed failure budget: `100% − SLO` (0.1% ≈ ~43 min/month of downtime) |
| **Burn Rate** | How fast the error budget is being consumed — drives paging urgency |

## Best Practices

- Start with the **USE method** (Utilization, Saturation, Errors) for host monitoring and the **RED method** (Rate, Errors, Duration) for services.
- Always define a `for:` duration on alerts to avoid flapping.
- Use **recording rules** for expensive PromQL queries.
- Keep label cardinality low — every unique label value adds a time series.
- Alert on **symptoms, not causes** (e.g., "errors are up", not "server X restarted").
- Ship logs with **structured labels** (service, env, level) for fast filtering.
- Set retention policies for metrics and logs to control storage cost.
- Use `promtool` to lint configs and rules before deploying.
- Instrument with OpenTelemetry once, export anywhere (OTLP).
- Document runbooks for every alert — an alert without a runbook is just noise.
