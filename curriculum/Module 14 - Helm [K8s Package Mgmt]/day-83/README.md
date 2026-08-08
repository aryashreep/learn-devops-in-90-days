# 🗓️ Day 83 — Project: Multi-Env CI/CD

Welcome to **Day 83**! This is the capstone of the Helm module. You'll wire your AI-BankApp chart into a real **multi-environment CI/CD pipeline** — dev/staging/prod values, automated lint + render + package in GitHub Actions, and release management with `helm upgrade --install`.

---

## 🎯 Today's Goal
Make your chart environment-aware, then automate its validation, packaging, and deployment through CI/CD.

## 🧠 Key Learnings
- **Values per Environment:** `values-dev.yaml` / `values-prod.yaml` layering.
- **Precedence:** values.yaml → `-f` files → `--set` flags.
- **Idempotent Deploys:** `helm upgrade --install` with `--atomic`.
- **Releases & Namespaces:** Isolating environments.
- **CI/CD with Helm:** GitHub Actions lint → template → package → push → deploy.

## 🧠 Pro Module
[🎓 Day 83 Pro Module: Multi-Env CI/CD Project](./Day83_Multi_Env_CI_CD.html)

## 🧪 Hands-on Lab
👉 [Lab Session: Multi-Env Helm Pipeline](./lab-session/task.md)

---

## 📖 Key Concepts

### Environment values

```bash
# values-prod.yaml
replicaCount: 6
image:
  tag: "1.2.0"
ingress:
  enabled: true
  host: bank.aryashree.in
resources:
  requests:
    cpu: 500m
    memory: 512Mi
```

### Precedence (low → high)

```
values.yaml  <  -f values-prod.yaml  <  --set image.tag=1.3.0
```

### Deploy per environment

```bash
helm upgrade --install ai-bankapp ./ai-bankapp \
  -f values-prod.yaml -n prod --create-namespace --atomic

helm upgrade --install ai-bankapp ./ai-bankapp \
  -f values-staging.yaml -n staging --create-namespace
```

### CI/CD workflow (GitHub Actions)

```yaml
jobs:
  deploy:
    steps:
      - uses: actions/checkout@v4
      - uses: azure/setup-helm@v4
      - run: helm lint ./ai-bankapp
      - run: helm template ai-bankapp ./ai-bankapp -f values-prod.yaml
      - run: helm package ./ai-bankapp -d ./dist
      - run: helm push ./dist/*.tgz oci://ghcr.io/aryashreep
```

---

## ❓ Mini Quiz

1. **Which has the HIGHEST values precedence?**
   - a) values.yaml
   - b) -f values-prod.yaml
   - c) --set image.tag=1.3.0
   - d) Chart.yaml

2. **Which command deploys idempotently?**
   - a) helm install
   - b) helm upgrade --install
   - c) helm apply
   - d) helm deploy

3. **What does `--atomic` do on an upgrade?**
   - a) Speeds up the install
   - b) Rolls back automatically if the install fails
   - c) Skips linting
   - d) Deletes the release after install

**Answers:** 1-c | 2-b | 3-b

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 14: Helm [K8s Package Mgmt]*
