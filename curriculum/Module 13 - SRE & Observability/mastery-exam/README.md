# 🏆 Module 13 Mastery Exam: SRE & Observability

Welcome to the **SRE & Observability Mastery Exam**! This assessment tests your knowledge of observability fundamentals, Prometheus metrics and PromQL, exporters, Grafana dashboards, Loki log management, OpenTelemetry tracing, alerting, and Alertmanager.

---

## 📝 Part 1: Observability Fundamentals

**1. What are the three pillars of observability?**
- A) Metrics, Logs, Backups
- B) CPU, Memory, Disk
- C) Metrics, Logs, Traces
- D) Dashboards, Alerts, Runbooks
- **Ans: C**

**2. What is the key difference between monitoring and observability?**
- A) Monitoring asks known questions; observability lets you explore unknown ones
- B) They are the same thing
- C) Monitoring is paid, observability is free
- D) Observability uses more dashboards
- **Ans: A**

**3. Which acronym describes Grafana Labs' full stack (Loki, Grafana, Tempo, Mimir)?**
- A) MEAN
- B) LGTM
- C) ELK
- D) CALMS
- **Ans: B**

**4. In the USE method for host monitoring, "U" stands for:**
- A) Uptime
- B) Updates
- C) Users
- D) Utilization
- **Ans: D**

**5. In the RED method for services, "D" stands for:**
- A) Duration (latency)
- B) Data
- C) Deployments
- D) Debugging
- **Ans: A**

**6. What is an SLO?**
- A) A Slack organization
- B) A single log entry
- C) A service level objective — a target for reliability (e.g., 99.9% availability)
- D) A type of exporter
- **Ans: C**

---

## 📝 Part 2: Prometheus & PromQL

**7. How does Prometheus collect metrics?**
- A) It pulls (scrapes) metrics over HTTP
- B) Agents push metrics to it via UDP
- C) It reads systemd journals
- D) It receives syslog streams
- **Ans: A**

**8. Which metric type can only increase and resets on restart?**
- A) Gauge
- B) Histogram
- C) Summary
- D) Counter
- **Ans: D**

**9. Which metric type is best for a value that goes up and down, like memory usage?**
- A) Counter
- B) Gauge
- C) Label
- D) Tag
- **Ans: B**

**10. What does the PromQL query `up` return for a healthy target?**
- A) 100
- B) 0
- C) 1
- D) true
- **Ans: C**

**11. Which function converts a counter into a per-second rate?**
- A) `sum()`
- B) `delta()`
- C) `increase()`
- D) `rate()`
- **Ans: D**

**12. Which file defines Prometheus scrape targets?**
- A) `scrape.yaml`
- B) `targets.conf`
- C) `prometheus.yml`
- D) `tsdb.json`
- **Ans: C**

**13. How do you reload Prometheus config without restarting?**
- A) `kill -9`
- B) `systemctl reload`
- C) It cannot be reloaded
- D) Send a SIGHUP signal
- **Ans: D**

**14. What does the `for` field in an alert rule do?**
- A) Requires the condition to hold for a duration before firing
- B) Names the alert
- C) Sets the scrape interval
- D) Chooses the receiver
- **Ans: A**

**15. Which metric type is used to measure request latency distributions?**
- A) Counter
- B) Gauge
- C) Histogram
- D) Set
- **Ans: C**

---

## 📝 Part 3: Exporters & Grafana

**16. Which exporter exposes host-level metrics on port 9100?**
- A) MySQL Exporter
- B) Node Exporter
- C) Blackbox Exporter
- D) cAdvisor
- **Ans: B**

**17. Which tool provides per-container metrics (CPU, memory, network)?**
- A) Promtail
- B) Loki
- C) cAdvisor
- D) Node Exporter
- **Ans: C**

**18. What is the default Grafana login?**
- A) admin / password
- B) root / root
- C) grafana / grafana
- D) admin / admin
- **Ans: D**

**19. Which Grafana dashboard ID is the famous "Node Exporter Full"?**
- A) 1860
- B) 1000
- C) 9090
- D) 3000
- **Ans: A**

**20. To visualize Prometheus data in Grafana, you must first:**
- A) Export data to CSV
- B) Restart Grafana
- C) Add Prometheus as a data source
- D) Install a plugin
- **Ans: C**

**21. Which metric name tracks per-container CPU usage in cAdvisor?**
- A) `docker_cpu_usage`
- B) `node_cpu_seconds_total`
- C) `container_cpu_usage_seconds_total`
- D) `cadvisor_cpu_total`
- **Ans: C**

---

## 📝 Part 4: Loki & Log Management

**22. Which component ships logs to Loki?**
- A) Prometheus
- B) Grafana Agent only
- C) Node Exporter
- D) Promtail
- **Ans: D**

**23. Loki indexes logs by:**
- A) File hashes
- B) Labels
- C) Full-text tokens
- D) IP addresses
- **Ans: B**

**24. Which LogQL query finds log lines containing "ERROR"?**
- A) `{job="x"} contains "ERROR"`
- B) `{job="x"} = "ERROR"`
- C) `grep {job="x"} "ERROR"`
- D) `{job="x"} |= "ERROR"`
- **Ans: D**

**25. What is the purpose of the Promtail `positions` file?**
- A) Remember where tailing left off so restarts don't lose logs
- B) Store log content
- C) Cache dashboard queries
- D) Store alert rules
- **Ans: A**

**26. Which LogQL function counts log lines over a time range?**
- A) `sum_over_time()`
- B) `rate()`
- C) `count_over_time()`
- D) `lines_total()`
- **Ans: C**

---

## 📝 Part 5: OpenTelemetry & Alerting

**27. What is a span in distributed tracing?**
- A) A log entry
- B) A dashboard panel
- C) One unit of work inside a trace
- D) A PromQL keyword
- **Ans: C**

**28. Which protocol does OpenTelemetry use to export telemetry data?**
- A) SNMP
- B) SSH
- C) FTP
- D) OTLP
- **Ans: D**

**29. Which component delivers alerts to webhooks, email, or Slack?**
- A) Prometheus
- B) Grafana
- C) Loki
- D) Alertmanager
- **Ans: D**

**30. Which is the BEST practice for writing alerts?**
- A) Fire an alert on every config change
- B) Alert on symptoms (e.g., "5xx error rate > 1% for 5m") with a runbook
- C) Use as many alerts as possible
- D) Alert on causes (e.g., "nginx restarted")
- **Ans: B**

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 13: SRE & Observability*
