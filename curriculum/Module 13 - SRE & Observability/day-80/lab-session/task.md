# 🧪 Lab Session: Day 80 — Full Stack Observability Project

**Jagu:** "Beep Boop! Golu, this is the moment — build the ENTIRE observability platform and prove it works end-to-end!"

## 🎯 Task Objectives
- Deploy the 7-service observability stack with docker-compose.
- Verify all Prometheus targets are UP.
- Build a unified Grafana dashboard (metrics + logs).
- Trigger a real CPU alert and watch it travel to Alertmanager.

## 🛠️ Hands-on Challenges

1. **Create the project:**
   ```bash
   mkdir -p ~/observability-lab && cd ~/observability-lab
   ```

2. **docker-compose.yml** — include all 7 services:
   - `node-exporter` (port 9100, `--path.rootfs=/host`)
   - `cadvisor` (port 8080, rootfs/var/run/sys/docker volumes)
   - `prometheus` (port 9090, mounts `prometheus.yml` + `rules.yml`)
   - `alertmanager` (port 9093, mounts `alertmanager.yml`)
   - `grafana` (port 3000)
   - `loki` (port 3100, `-config.file=/etc/loki/local-config.yaml`)
   - `promtail` (mounts `promtail-config.yml` + `/var/log`)

3. **prometheus.yml** — scrape prometheus, node-exporter, and cadvisor; load `rules.yml`; point `alerting` at alertmanager:9093.

4. **rules.yml** — `HighCPUUsage` (CPU > 50% for 1m) and `InstanceDown` (`up == 0` for 1m). Validate with `promtool check rules`.

5. **alertmanager.yml** — route to a `webhook` receiver (`http://localhost:5000/alert`).

6. **promtail-config.yml** — tail `/var/log/*.log` with `job: varlogs`, push to `http://loki:3100/loki/api/v1/push`.

7. **Launch & verify:**
   ```bash
   docker compose up -d
   docker compose ps                     # 7 services running
   curl http://localhost:9090/api/v1/query?query=up
   ```
   All targets should return `1`. If any are `0`, debug with `docker logs <service>`.

8. **Grafana setup:**
   - Login `admin/admin` → add **Prometheus** (:9090) and **Loki** (:3100) data sources.
   - Import dashboard **1860** (Node Exporter Full).
   - Add a **log panel** to the dashboard: Loki data source, query `{job="varlogs"}`, visualize as "Logs".

9. **End-to-end alert test:**
   ```bash
   for i in $(seq $(nproc)); do yes > /dev/null & done
   # Prometheus Alerts: HighCPUUsage → Pending → Firing (after 1m)
   # Alertmanager :9093 → alert visible
   pkill yes
   ```

10. **Write an incident report** (in your solution) describing the spike you found, using both the metric and the logs.

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste all 5 config files.
3. Paste `docker compose ps` output + the `query?query=up` JSON.
4. Paste text/screenshots of:
   - The **1860 dashboard** with your Loki log panel
   - The alert going **Pending → Firing** and appearing in **Alertmanager**
   - Your **incident report** (what happened, metric + log evidence)
5. Commit and push!

---

*#LearnDevOpsIn90Days • Day 80 • Golu & Jagu Edition*
