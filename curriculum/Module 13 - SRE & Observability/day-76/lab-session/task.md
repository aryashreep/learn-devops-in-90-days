# 🧪 Lab Session: Day 76 — First Prometheus Scrape & PromQL

**Jagu:** "Beep Boop! Golu, let's stand up your first Prometheus server and make it watch itself!"

## 🎯 Task Objectives
- Install and start Prometheus (Docker recommended).
- Write a `prometheus.yml` with a working scrape config.
- Validate the config with `promtool`.
- Explore the Targets page and run PromQL queries.

## 🛠️ Hands-on Challenges

1. **Create a project folder and config:**
   ```bash
   mkdir -p ~/prom && cd ~/prom
   cat > prometheus.yml <<'EOF'
   global:
     scrape_interval: 15s
   scrape_configs:
     - job_name: 'prometheus'
       static_configs:
         - targets: ['localhost:9090']
   EOF
   ```

2. **Validate the config** using `promtool` from the Prometheus image:
   ```bash
   docker run --rm -v $PWD/prometheus.yml:/etc/prometheus/prometheus.yml \
     prom/prometheus promtool check config /etc/prometheus/prometheus.yml
   ```

3. **Start Prometheus:**
   ```bash
   docker run -d --name prometheus -p 9090:9090 \
     -v $PWD/prometheus.yml:/etc/prometheus/prometheus.yml \
     prom/prometheus
   docker ps   # confirm the container is running
   ```

4. **Explore the UI** at `http://localhost:9090`:
   - Open **Status → Targets** and confirm the `prometheus` job shows `UP`.
   - Open **Graph** and run these queries:
     - `up`
     - `prometheus_tsdb_head_series`
     - `rate(prometheus_tsdb_head_samples_appended_total[5m])`

5. **Query the API directly:**
   ```bash
   curl http://localhost:9090/api/v1/query?query=up
   curl http://localhost:9090/metrics | head -20
   ```

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste your `prometheus.yml` content.
3. Paste the output of:
   - `docker ps` (showing the prometheus container)
   - `curl http://localhost:9090/api/v1/query?query=up`
   - `curl http://localhost:9090/metrics | head -20`
4. Screenshot the **Graph** page with the `up` query result (paste the URL/output in your solution).
5. Commit and push!

---

*#LearnDevOpsIn90Days • Day 76 • Golu & Jagu Edition*
