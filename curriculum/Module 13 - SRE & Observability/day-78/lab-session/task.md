# 🧪 Lab Session: Day 78 — Centralized Logs with Loki & Promtail

**Jagu:** "Beep Boop! Golu, let's collect every log on this machine into one searchable place!"

## 🎯 Task Objectives
- Run Loki and Promtail with docker-compose.
- Configure Promtail to tail `/var/log/*.log`.
- Generate sample logs and confirm they land in Loki.
- Query logs with LogQL from Grafana Explore.

## 🛠️ Hands-on Challenges

1. **Create a project folder with docker-compose.yml:**
   ```bash
   mkdir -p ~/loki-lab && cd ~/loki-lab
   ```

2. **docker-compose.yml:**
   ```yaml
   services:
     loki:
       image: grafana/loki:3.0.0
       ports:
         - "3100:3100"
       command: -config.file=/etc/loki/local-config.yaml
     promtail:
       image: grafana/promtail:3.0.0
       volumes:
         - ./promtail-config.yml:/etc/promtail/config.yml
         - /var/log:/var/log
       command: -config.file=/etc/promtail/config.yml
   ```

3. **promtail-config.yml:**
   ```yaml
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

4. **Start the stack:**
   ```bash
   docker compose up -d
   docker ps   # both containers running
   curl http://localhost:3100/ready   # should return "ready"
   ```

5. **Generate some logs:**
   ```bash
   echo "ERROR: db connection refused on payment service" | sudo tee -a /var/log/app.log
   echo "INFO: healthcheck passed" | sudo tee -a /var/log/app.log
   echo "WARN: memory usage at 85%" | sudo tee -a /var/log/app.log
   ```

6. **Add Loki data source in Grafana:** Configuration → Data Sources → **Loki** → URL `http://localhost:3100` → Save & Test.

7. **Query in Explore** (compass icon → Loki):
   - `{job="varlogs"}`
   - `{job="varlogs"} |= "ERROR"`
   - `sum by (job) (count_over_time({job="varlogs"}[5m]))`

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste your `docker-compose.yml` and `promtail-config.yml`.
3. Paste output of `curl http://localhost:3100/ready` and `docker ps`.
4. Paste a text/screenshot summary of the Explore query results for `{job="varlogs"} |= "ERROR"`.
5. Commit and push!

---

*#LearnDevOpsIn90Days • Day 78 • Golu & Jagu Edition*
