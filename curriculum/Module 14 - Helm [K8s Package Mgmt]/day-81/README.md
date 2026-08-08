# 🗓️ Day 81 — Introduction to Helm & Chart Basics

Welcome to **Day 81**! Today we begin the module **Helm [K8s Package Mgmt]**. We'll understand why Helm exists, how its v3 architecture works, and get our first chart running — install, upgrade, and rollback in minutes.

---

## 🎯 Today's Goal
Understand the problem Helm solves, install the Helm client, add a chart repository, and deploy your first release with install/upgrade/rollback.

## 🧠 Key Learnings
- **The YAML Sprawl Problem:** Why raw Kubernetes manifests don't scale.
- **Helm v3 Architecture:** Client-only — no Tiller, uses a release secret in-cluster.
- **Chart Anatomy:** `Chart.yaml`, `values.yaml`, `templates/`, `charts/`, `crds/`.
- **Repositories:** Bitnami, Artifact Hub, and OCI registries.
- **Release Lifecycle:** `install`, `upgrade`, `rollback`, `list`, `uninstall`.

## 🧠 Pro Module
[🎓 Day 81 Pro Module: Introduction to Helm & Chart Basics](./Day81_Helm_Intro.html)

## 🧪 Hands-on Lab
👉 [Lab Session: First Helm Release](./lab-session/task.md)

---

## 📖 Key Concepts

### The Problem

A microservice needs Deployment + Service + ConfigMap + Ingress + HPA — each with 30+ lines of YAML. Multiply by 50 services and 3 environments. Helm packages all of it into one **chart** and one command.

### Helm v3 (no Tiller)

```
┌──────────────┐  helm install   ┌─────────────────┐
│ Helm Client  │ ──────────────→ │ K8s API Server  │
│  (your CLI)  │                 │  → renders chart │
└──────────────┘                 │  → creates release│
                                 │  → stores release │
                                 │    secret         │
                                 └─────────────────┘
```

No server-side component needed — Helm talks directly to the Kubernetes API.

### Install Helm & First Chart

```bash
# Install (Linux)
curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Verify
helm version

# Add a repository
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# Deploy nginx as a release
helm install my-nginx bitnami/nginx

# Check it
helm list
kubectl get all
```

### Upgrade & Rollback

```bash
# Change values and upgrade
helm upgrade my-nginx bitnami/nginx --set service.type=NodePort

# History → rollback
helm history my-nginx
helm rollback my-nginx 1

# Cleanup
helm uninstall my-nginx
```

---

## ❓ Mini Quiz

1. **In Helm v3, where does the release state live?**
   - a) In a central Tiller server
   - b) In a Kubernetes Secret in the release's namespace
   - c) On the local filesystem only
   - d) In etcd directly

2. **Which file holds a chart's default configuration values?**
   - a) Chart.yaml
   - b) values.yaml
   - c) NOTES.txt
   - d) _helpers.tpl

3. **Which command reverts a release to a previous revision?**
   - a) helm undo
   - b) helm revert
   - c) helm rollback
   - d) helm restore

**Answers:** 1-b | 2-b | 3-c

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 14: Helm [K8s Package Mgmt]*
