# 🧪 Day 76 — Solution: First Prometheus Scrape & PromQL

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 1. Prometheus Configuration (`prometheus.yml`)

```yaml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']
```

---

## ✅ 2. Validate with promtool

```bash
docker run --rm -v $PWD/prometheus.yml:/etc/prometheus/prometheus.yml \
  prom/prometheus promtool check config /etc/prometheus/prometheus.yml
```

**Expected Output:**
```
Checking /etc/prometheus/prometheus.yml
  SUCCESS: /etc/prometheus/prometheus.yml is valid prometheus config file syntax
```

---

## ✅ 3. Start Prometheus

```bash
docker run -d --name prometheus -p 9090:9090 \
  -v $PWD/prometheus.yml:/etc/prometheus/prometheus.yml \
  prom/prometheus
docker ps
```

**Expected Output:**
```
CONTAINER ID   IMAGE            COMMAND                  STATUS         PORTS                    NAMES
abc123def456   prom/prometheus  "/bin/prometheus --c…"   Up 2 minutes   0.0.0.0:9090->9090/tcp   prometheus
```

---

## ✅ 4. PromQL Queries (Graph page)

### `up`
```
up{instance="localhost:9090", job="prometheus"}   1
```
`1` means the target is healthy and being scraped.

### `prometheus_tsdb_head_series`
Shows the current number of in-memory time series (grows as metrics accumulate).

### `rate(prometheus_tsdb_head_samples_appended_total[5m])`
Samples per second ingested over the last 5 minutes.

---

## ✅ 5. Query the API directly

```bash
curl http://localhost:9090/api/v1/query?query=up
```

**Expected Output (JSON):**
```json
{
  "status": "success",
  "data": {
    "resultType": "vector",
    "result": [
      {
        "metric": { "__name__": "up", "instance": "localhost:9090", "job": "prometheus" },
        "value": [1720000000.0, "1"]
      }
    ]
  }
}
```

```bash
curl http://localhost:9090/metrics | head -20
```

**Expected Output (first lines):**
```
# HELP go_gc_duration_seconds A summary of the pause duration of garbage collection cycles.
# TYPE go_gc_duration_seconds summary
go_gc_duration_seconds{quantile="0"} 0.000123456
...
# HELP prometheus_tsdb_head_series Number of series in the head block.
# TYPE prometheus_tsdb_head_series gauge
prometheus_tsdb_head_series 412
```

---

## ✅ Lessons Learned

- Prometheus **pulls** metrics from HTTP `/metrics` endpoints on a schedule.
- `prometheus.yml` is the single source of truth for scrape targets.
- The `up` metric is the fastest health check for any target.
- `promtool check config` validates configs before they hit production.
- PromQL is the language of SRE — instant answers to "is it healthy?".

---

*#LearnDevOpsIn90Days • Day 76 • Golu & Jagu Edition*
