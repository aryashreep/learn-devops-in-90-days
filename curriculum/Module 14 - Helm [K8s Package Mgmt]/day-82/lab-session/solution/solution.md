# 🧪 Day 82 — Solution: Build the AI-BankApp Chart

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 1. Chart Scaffolded

```bash
helm create ai-bankapp
```

Generated files: `Chart.yaml`, `values.yaml`, `.helmignore`, `templates/` (deployment, service, serviceaccount, ingress, hpa, NOTES.txt, _helpers.tpl), `charts/`, `crds/`.

---

## ✅ 2. values.yaml (customized)

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

---

## ✅ 3. templates/deployment.yaml (key sections)

```yaml
containers:
  - name: {{ .Chart.Name }}
    image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
    imagePullPolicy: {{ .Values.image.pullPolicy }}
    ports:
      - name: http
        containerPort: 80
        protocol: TCP
    livenessProbe:
      httpGet:
        path: /healthz
        port: http
    readinessProbe:
      httpGet:
        path: /readyz
        port: http
    resources:
      {{- toYaml .Values.resources | nindent 6 }}
```

```yaml
# templates/service.yaml
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "ai-bankapp.selectorLabels" . | nindent 4 }}
```

---

## ✅ 4. helm lint

```bash
helm lint ./ai-bankapp
```

**Expected Output:**
```
==> Linting ./ai-bankapp
[INFO] Chart.yaml: icon is recommended

1 chart(s) linted, 0 chart(s) failed
```

---

## ✅ 5. helm template (rendered Deployment)

```bash
helm template ai-bankapp ./ai-bankapp
```

**Expected Output (excerpt):**
```yaml
---
# Source: ai-bankapp/templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ai-bankapp
  labels:
    helm.sh/chart: ai-bankapp-0.1.0
    app.kubernetes.io/name: ai-bankapp
    app.kubernetes.io/instance: ai-bankapp
    app.kubernetes.io/managed-by: Helm
spec:
  replicas: 2
  ...
```

```bash
helm template ai-bankapp ./ai-bankapp --set replicaCount=5 | grep "replicas:"
# replicas: 5
```

---

## ✅ 6. Package

```bash
helm package ./ai-bankapp
ls -la *.tgz
```

**Expected Output:**
```
Successfully packaged chart and saved it to: .../ai-bankapp-0.1.0.tgz
-rw-r--r-- 1 user user 2894 ... ai-bankapp-0.1.0.tgz
```

---

## ✅ 7. Dry-run Install (bonus)

```bash
helm install ai-bankapp ./ai-bankapp --dry-run --debug | head -40
```

Shows the exact resources Helm WOULD create, including `STATUS: pending-install` and the rendered manifests.

---

## ✅ Lessons Learned

- `helm create` gives a solid skeleton — you own the customization.
- Values drive everything; templates just apply them.
- Probes on `/healthz` and `/readyz` make rollouts safe.
- `helm lint` + `helm template` catch 90% of mistakes before any cluster.
- `helm package` produces the shareable chart artifact.
- Next: environments + CI/CD for this very chart! 🏷️

---

*#LearnDevOpsIn90Days • Day 82 • Golu & Jagu Edition*
