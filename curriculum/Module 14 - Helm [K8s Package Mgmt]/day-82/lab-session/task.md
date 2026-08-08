# 🧪 Lab Session: Day 82 — Build the AI-BankApp Chart

**Jagu:** "Beep Boop! Golu, time to write YOUR first chart from scratch — the AI-BankApp chart!"

## 🎯 Task Objectives
- Scaffold the chart with `helm create ai-bankapp`.
- Customize `values.yaml` for the AI-BankApp (image, replicas, service, resources).
- Edit `templates/deployment.yaml` and `templates/service.yaml`.
- Validate with `helm lint`, preview with `helm template`.
- Package the chart with `helm package`.

## 🛠️ Hands-on Challenges

1. **Scaffold:**
   ```bash
   mkdir -p ~/helm-lab && cd ~/helm-lab
   helm create ai-bankapp
   cd ai-bankapp
   ```

2. **Customize `values.yaml`** — replace the defaults with:
   ```yaml
   replicaCount: 2
   image:
     repository: ghcr.io/aryashreep/ai-bankapp
     pullPolicy: IfNotPresent
     tag: "1.0.0"
   service:
     type: ClusterIP
     port: 80
   ingress:
     enabled: false
     host: bank.local
   resources:
     limits:
       cpu: 500m
       memory: 512Mi
     requests:
       cpu: 250m
       memory: 256Mi
   autoscaling:
     enabled: false
     minReplicas: 1
     maxReplicas: 5
     targetCPUUtilizationPercentage: 80
   ```

3. **Edit `templates/deployment.yaml`:**
   - Container port `80`
   - Liveness probe: `httpGet` on `/healthz` port 80
   - Readiness probe: `httpGet` on `/readyz` port 80
   - Make sure `resources` come from `.Values.resources` via `toYaml | nindent 10`
   - Keep the label block using `include "ai-bankapp.labels" .`

4. **Edit `templates/service.yaml`:** port `{{ .Values.service.port }}`, targetPort `http`.

5. **Validate & preview:**
   ```bash
   helm lint ./ai-bankapp
   helm template ai-bankapp ./ai-bankapp
   helm template ai-bankapp ./ai-bankapp --set replicaCount=5 | grep -c "replicas:"
   ```

6. **Package:**
   ```bash
   helm package ./ai-bankapp
   ls -la *.tgz
   ```

7. **Bonus — dry-run install (if you have a cluster):**
   ```bash
   helm install ai-bankapp ./ai-bankapp --dry-run --debug | head -40
   ```

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste your `values.yaml` (or the key changed sections).
3. Paste your edited `templates/deployment.yaml` probe + resource sections.
4. Paste `helm lint` output (should say `0 chart(s) failed`).
5. Paste a snippet of `helm template ai-bankapp ./ai-bankapp` showing the rendered Deployment.
6. Paste `ls -la *.tgz` output.
7. Commit and push!

---

*#LearnDevOpsIn90Days • Day 82 • Golu & Jagu Edition*
