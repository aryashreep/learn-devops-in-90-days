# 🧪 Lab Session: Day 77 — Node Exporter + cAdvisor + Grafana

**Jagu:** "Beep Boop! Golu, time to give Prometheus some real food — your host and container metrics!"

## 🎯 Task Objectives
- Deploy Node Exporter and cAdvisor as Docker containers.
- Add both to the Prometheus scrape config.
- Install Grafana and connect it to Prometheus.
- Import a dashboard and build one custom panel.

## 🛠️ Hands-on Challenges

1. **Start Node Exporter:**
   ```bash
   docker run -d --name node_exporter -p 9100:9100 \
     --net="host" --pid="host" \
     -v "/:/host:ro,rslave" \
     quay.io/prometheus/node-exporter:latest \
     --path.rootfs=/host
   curl localhost:9100/metrics | grep node_cpu_seconds_total | head -3
   ```

2. **Start cAdvisor:**
   ```bash
   docker run -d --name cadvisor -p 8080:8080 \
     --volume=/:/rootfs:ro \
     --volume=/var/run:/var/run:ro \
     --volume=/sys:/sys:ro \
     --volume=/var/lib/docker/:/var/lib/docker:ro \
     gcr.io/cadvisor/cadvisor:latest
   curl localhost:8080/metrics | grep container_cpu_usage_seconds_total | head -3
   ```

3. **Update `prometheus.yml`** to add the two jobs, then reload:
   ```yaml
   scrape_configs:
     - job_name: 'node'
       static_configs:
         - targets: ['localhost:9100']
     - job_name: 'cadvisor'
       static_configs:
         - targets: ['localhost:8080']
   ```
   ```bash
   docker kill -s HUP prometheus
   # Verify in the UI: Status → Targets → both should show UP
   ```

4. **Start Grafana:**
   ```bash
   docker run -d --name grafana -p 3000:3000 grafana/grafana
   ```
   - Open `http://localhost:3000`, login `admin` / `admin`
   - **Configuration → Data Sources → Add → Prometheus** → URL `http://localhost:9090` → **Save & Test**

5. **Import a dashboard:** Dashboards → Import → ID `1860` (Node Exporter Full) → select your data source → Import.

6. **Build a custom panel:**
   - New Dashboard → Add Panel
   - Query: `100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)`
   - Title: `CPU Usage %` → Apply → Save

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste your updated `prometheus.yml`.
3. Paste output of `curl localhost:9100/metrics | grep node_cpu_seconds_total | head -3`.
4. Paste a screenshot or text description of:
   - The **Targets** page showing node + cadvisor as UP
   - Your imported **1860 dashboard** (any row)
   - Your custom **CPU Usage %** panel with the query
5. Commit and push!

---

*#LearnDevOpsIn90Days • Day 77 • Golu & Jagu Edition*
