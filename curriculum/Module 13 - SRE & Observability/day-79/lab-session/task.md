# 🧪 Lab Session: Day 79 — Traces + Alert Rules + Alertmanager

**Jagu:** "Beep Boop! Golu, let's make your stack proactive — traces for debugging and alerts that page you first!"

## 🎯 Task Objectives
- Understand the OTel tracing pipeline (SDK → Collector → backend).
- Write Prometheus alert rules and validate them.
- Deploy Alertmanager with a webhook receiver.
- Trigger a real CPU alert and silence it.

## 🛠️ Hands-on Challenges

1. **Write alert rules** in `~/prom/rules.yml`:
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
   Validate:
   ```bash
   promtool check rules rules.yml
   ```

2. **Point Prometheus at the rules + Alertmanager** (update `prometheus.yml`):
   ```yaml
   rule_files:
     - 'rules.yml'
   alerting:
     alertmanagers:
       - static_configs:
           - targets: ['localhost:9093']
   ```
   Reload: `docker kill -s HUP prometheus`

3. **Deploy Alertmanager:**
   ```bash
   mkdir -p ~/prom && cd ~/prom
   cat > alertmanager.yml <<'EOF'
   route:
     group_by: ['alertname']
     group_wait: 10s
     receiver: 'webhook'
   receivers:
     - name: 'webhook'
       webhook_configs:
         - url: 'http://localhost:5000/alert'
           send_resolved: true
   EOF
   docker run -d --name alertmanager -p 9093:9093 \
     -v $PWD/alertmanager.yml:/etc/alertmanager/alertmanager.yml \
     prom/alertmanager
   ```

4. **Trigger the alert:** create CPU load and watch the status change.
   ```bash
   # Stress CPU (Linux): use yes
   for i in $(seq $(nproc)); do yes > /dev/null & done
   # Prometheus UI → Alerts: HighCPUUsage should go Pending → Firing
   ```

5. **Test Alertmanager manually:**
   ```bash
   curl -X POST -d '[{"labels":{"alertname":"TestAlert"}}]' \
     http://localhost:9093/api/v1/alerts
   ```
   Open `http://localhost:9093` → Alerts → find `TestAlert`. Create a **Silence** for 10 minutes.

6. **Stop the CPU load:** `kill %1 %2 ...` or `pkill yes`.

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste `rules.yml` and `alertmanager.yml`.
3. Paste `promtool check rules` output.
4. Paste a text/screenshot showing:
   - The alert going **Pending → Firing** in the Prometheus Alerts page
   - `curl` POST response + the alert visible in Alertmanager UI
   - Your created Silence
5. Commit and push!

---

*#LearnDevOpsIn90Days • Day 79 • Golu & Jagu Edition*
