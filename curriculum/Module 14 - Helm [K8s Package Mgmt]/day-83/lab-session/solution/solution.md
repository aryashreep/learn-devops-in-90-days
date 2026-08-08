# 🧪 Day 83 — Solution: Multi-Env Helm Pipeline

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 1. Environment Values

**values-dev.yaml**
```yaml
replicaCount: 1
image:
  tag: "latest"
ingress:
  enabled: false
```

**values-prod.yaml**
```yaml
replicaCount: 6
image:
  tag: "1.0.0"
  pullPolicy: Always
ingress:
  enabled: true
  host: bank.aryashree.in
resources:
  requests:
    cpu: 500m
    memory: 512Mi
```

---

## ✅ 2. Rendered Comparison

```bash
helm template ai-bankapp ./ai-bankapp -f ai-bankapp/values-dev.yaml | grep -E "replicas:|image:"
```
```
replicas: 1
image: "ghcr.io/aryashreep/ai-bankapp:latest"
```

```bash
helm template ai-bankapp ./ai-bankapp -f ai-bankapp/values-prod.yaml | grep -E "replicas:|image:"
```
```
replicas: 6
image: "ghcr.io/aryashreep/ai-bankapp:1.0.0"
```

---

## ✅ 3. Precedence

```bash
helm template ai-bankapp ./ai-bankapp -f ai-bankapp/values-prod.yaml --set replicaCount=10 | grep "replicas:"
```
```
replicas: 10
```
`--set` (10) overrides the prod file (6). ✅

---

## ✅ 4. Multi-Namespace Deploy

```bash
helm upgrade --install ai-bankapp ./ai-bankapp -f ai-bankapp/values-dev.yaml -n dev --create-namespace
helm upgrade --install ai-bankapp ./ai-bankapp -f ai-bankapp/values-prod.yaml -n prod --create-namespace
helm list -A
```

**Expected Output:**
```
NAME        NAMESPACE  REVISION  UPDATED   STATUS    CHART            APP VERSION
ai-bankapp  dev        1         ...       deployed  ai-bankapp-0.1.0 1.16.0
ai-bankapp  prod       1         ...       deployed  ai-bankapp-0.1.0 1.16.0
```

```bash
helm history ai-bankapp -n prod
# REVISION 1 ... deployed ... Install complete
```

---

## ✅ 5. Atomic Upgrade

```bash
helm upgrade --install ai-bankapp ./ai-bankapp -f ai-bankapp/values-prod.yaml -n prod --atomic
```
On failure, Helm automatically rolls back to the last working revision. On success → new revision `2`.

---

## ✅ 6. GitHub Actions Workflow (.github/workflows/helm-deploy.yml)

```yaml
name: Deploy AI-BankApp

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: azure/setup-helm@v4
        with:
          version: v3.15.0

      - name: Lint chart
        run: helm lint ./ai-bankapp

      - name: Render prod templates
        run: helm template ai-bankapp ./ai-bankapp -f ai-bankapp/values-prod.yaml

      - name: Package chart
        run: helm package ./ai-bankapp -d ./dist

      - name: Push to OCI registry
        env:
          TOKEN: ${{ secrets.GITHUB_TOKEN }}
        run: |
          helm registry login ghcr.io -u $GITHUB_ACTOR -p $TOKEN
          helm push ./dist/ai-bankapp-*.tgz oci://ghcr.io/aryashreep

      - name: Configure kubeconfig (cluster auth)
        env:
          KUBECONFIG_B64: ${{ secrets.KUBECONFIG_B64 }}
        run: |
          mkdir -p $HOME/.kube
          echo "$KUBECONFIG_B64" | base64 -d > $HOME/.kube/config

      - name: Deploy to prod
        run: helm upgrade --install ai-bankapp ./ai-bankapp \
               -f ai-bankapp/values-prod.yaml -n prod --create-namespace --atomic
```

---

## ✅ Lessons Learned

- One chart + per-env values files = full environment control.
- Precedence: `values.yaml` < `-f file` < `--set`.
- `helm upgrade --install` is idempotent; `--atomic` auto-rolls-back failures.
- Namespaces isolate environments; `helm list -A` gives the full picture.
- CI/CD makes deploys repeatable: lint → template → package → push → deploy.
- Helm is now YOUR tool — one command, every environment! 🏷️

---

*#LearnDevOpsIn90Days • Day 83 • Golu & Jagu Edition*
