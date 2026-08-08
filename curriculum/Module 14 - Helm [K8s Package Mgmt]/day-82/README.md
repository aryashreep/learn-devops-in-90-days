# 🗓️ Day 82 — Custom Chart for AI-BankApp

Welcome to **Day 82**! Today we build our own Helm chart for the academy's flagship **AI-BankApp** — from `helm create` to custom templates, values, helpers, and a validated package you can ship.

---

## 🎯 Today's Goal
Scaffold a chart with `helm create`, parameterize templates with values, write helpers, validate with `helm lint`, render with `helm template`, and package it.

## 🧠 Key Learnings
- **helm create:** The official chart scaffold.
- **Templates & Templating:** `{{ .Values.key }}`, conditionals, loops, and built-in objects.
- **_helpers.tpl:** Reusable name/label snippets with `include`.
- **values.yaml Design:** Sensible defaults, resources, probes.
- **Validation:** `helm lint` and `helm template` (no cluster needed).
- **Packaging:** `helm package` produces the distributable `.tgz`.

## 🧠 Pro Module
[🎓 Day 82 Pro Module: Custom Chart for AI-BankApp](./Day82_Custom_Helm_Chart.html)

## 🧪 Hands-on Lab
👉 [Lab Session: Build the AI-BankApp Chart](./lab-session/task.md)

---

## 📖 Key Concepts

### Scaffold & structure

```bash
helm create ai-bankapp
cd ai-bankapp
tree
```

```
ai-bankapp/
├── Chart.yaml
├── values.yaml
├── charts/
├── crds/
├── templates/
│   ├── NOTES.txt
│   ├── _helpers.tpl
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── serviceaccount.yaml
│   ├── ingress.yaml
│   └── hpa.yaml
└── .helmignore
```

### Core templating

```gotemplate
# templates/deployment.yaml (key lines)
replicas: {{ .Values.replicaCount }}
image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
{{- if .Values.autoscaling.enabled }}
  resources: {{- toYaml .Values.resources | nindent 10 }}
{{- end }}
labels:
  {{- include "ai-bankapp.labels" . | nindent 4 }}
```

### Validate & package

```bash
helm lint ./ai-bankapp          # → 1 chart(s) linted, 0 chart(s) failed
helm template ai-bankapp ./ai-bankapp   # render without a cluster
helm package ./ai-bankapp       # → ai-bankapp-0.1.0.tgz
```

---

## ❓ Mini Quiz

1. **Which command scaffolds a new chart?**
   - a) helm init
   - b) helm new
   - c) helm create
   - d) helm scaffold

2. **What does `helm template` do?**
   - a) Installs the chart into the cluster
   - b) Renders manifests locally without installing
   - c) Packages the chart into a .tgz
   - d) Deletes old releases

3. **Which built-in object holds the release name in templates?**
   - a) `.Chart`
   - b) `.Values`
   - c) `.Release`
   - d) `.Files`

**Answers:** 1-c | 2-b | 3-c

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 14: Helm [K8s Package Mgmt]*
