# 🏷️ Helm CLI Cheatsheet

## 🚀 Essential Commands

| Command | Description |
|---|---|
| `helm version` | Show client version |
| `helm repo add <name> <url>` | Add a chart repository |
| `helm repo update` | Update local repo cache |
| `helm repo list` | List configured repositories |
| `helm search repo <keyword>` | Search charts in your repos |
| `helm search hub <keyword>` | Search Artifact Hub (all public repos) |
| `helm install <release> <chart>` | Install a chart as a release |
| `helm install <release> <chart> --namespace <ns> --create-namespace` | Install into a specific namespace |
| `helm upgrade <release> <chart>` | Upgrade a release to a newer chart/values |
| `helm upgrade --install <release> <chart>` | Install or upgrade (idempotent) |
| `helm rollback <release> <revision>` | Roll back to a previous revision |
| `helm uninstall <release>` | Delete a release |
| `helm list` | List releases in current namespace |
| `helm list -A` | List releases in ALL namespaces |
| `helm history <release>` | Show release revision history |
| `helm status <release>` | Show release status and notes |
| `helm get values <release>` | Show the values used by a release |
| `helm get manifest <release>` | Show the rendered Kubernetes manifests |
| `helm create <chart-name>` | Scaffold a new chart |
| `helm lint <chart-dir>` | Validate chart structure and templates |
| `helm template <chart>` | Render templates locally (no cluster needed) |
| `helm package <chart-dir>` | Package a chart into a `.tgz` |
| `helm push <chart.tgz> <repo>` | Push a chart to a registry/repo (OCI) |
| `helm pull <repo/chart>` | Download a chart |
| `helm plugin install <url>` | Install a Helm plugin |
| `helm dependency update` | Fetch subchart dependencies |

## 🏗️ Chart Anatomy

```
mychart/
├── Chart.yaml          # Metadata: name, version, apiVersion
├── values.yaml         # Default configuration values
├── charts/             # Subcharts (dependencies)
├── crds/               # Custom Resource Definitions
├── templates/
│   ├── NOTES.txt       # Post-install instructions
│   ├── _helpers.tpl    # Reusable template helpers
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   ├── serviceaccount.yaml
│   └── hpa.yaml        # (created by helm create)
└── .helmignore         # Files to exclude when packaging
```

## 📦 Chart.yaml Example

```yaml
apiVersion: v2
name: ai-bankapp
description: A Helm chart for the AI-BankApp microservices
type: application
version: 0.1.0
appVersion: "1.16.0"
dependencies:
  - name: postgresql
    version: 12.x.x
    repository: https://charts.bitnami.com/bitnami
```

## 🧩 Values & Templating

```yaml
# values.yaml
replicaCount: 2
image:
  repository: nginx
  tag: "1.25.3"
  pullPolicy: IfNotPresent
service:
  type: ClusterIP
  port: 80
resources:
  limits:
    cpu: 500m
    memory: 512Mi
```

```gotemplate
# templates/deployment.yaml (excerpt)
replicas: {{ .Values.replicaCount }}
image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default "latest" }}"
{{- with .Values.service }}
port: {{ .port }}
{{- end }}
labels:
  app: {{ include "mychart.name" . }}
```

### Common Template Functions

| Expression | Purpose |
|---|---|
| `{{ .Values.replicaCount }}` | Access a value |
| `{{ .Release.Name }}` | Release name |
| `{{ .Chart.Name }}` / `{{ .Chart.Version }}` | Chart metadata |
| `{{ .Values.x | default "fallback" }}` | Default fallback |
| `{{ .Values.x | quote }}` | Quote a string |
| `{{ .Values.x | upper }}` | Uppercase |
| `{{ include "chart.helpers" . }}` | Include a helper |
| `{{- if ... }} ... {{- end }}` | Conditionals |
| `{{- range .Values.items }} ... {{- end }}` | Loops |
| `{{ nindent 6 ... }}` | Indent multi-line output |
| `{{ toYaml .Values.resources | nindent 10 }}` | Render a map as YAML |

## 🌍 Multi-Environment Values

```bash
# Base defaults
helm template ai-bankapp ./ai-bankapp -f values.yaml

# Environment overrides
helm template ai-bankapp ./ai-bankapp -f values-prod.yaml
helm upgrade --install ai-bankapp ./ai-bankapp \
  -f values-prod.yaml -n prod --create-namespace

# Inline overrides (highest precedence)
helm upgrade --install ai-bankapp ./ai-bankapp \
  --set image.tag=1.2.0,replicaCount=5
```

### Values Precedence (low → high)

1. `values.yaml` (chart defaults)
2. Parent chart's `values.yaml` (for subcharts)
3. `-f values-prod.yaml` (user-supplied files)
4. `--set key=value` (inline flags — highest)

## 🤖 Helm in CI/CD (GitHub Actions)

```yaml
- name: Lint chart
  run: helm lint ./ai-bankapp

- name: Render templates
  run: helm template ai-bankapp ./ai-bankapp -f values-prod.yaml

- name: Package chart
  run: helm package ./ai-bankapp -d ./dist

- name: Push to OCI registry
  env:
    REGISTRY: ghcr.io/aryashreep
    TOKEN: ${{ secrets.GITHUB_TOKEN }}
  run: |
    helm registry login ghcr.io -u $GITHUB_ACTOR -p $TOKEN
    helm push ./dist/ai-bankapp-*.tgz oci://ghcr.io/aryashreep
```

## 🧪 Check & Debug

| Command | Description |
|---|---|
| `helm lint ./mychart` | Validate chart syntax and conventions |
| `helm template ./mychart` | Render manifests without installing |
| `helm template ./mychart --debug` | Show rendered manifests + computed values |
| `helm get manifest <release>` | See what's actually deployed |
| `helm history <release>` | See revision timeline |
| `helm diff upgrade <release> <chart>` | (helm-diff plugin) show changes before applying |
| `kubectl get all -n <ns>` | Confirm resources created by the release |

## Best Practices

- Always pin `chart.version` and `appVersion` in `Chart.yaml`.
- Keep secrets OUT of `values.yaml` — use `--set`/Secrets or external secrets.
- Use `_helpers.tpl` for labels that must be consistent (name, selector, labels).
- Prefer `helm upgrade --install` for idempotent deployments.
- Store per-environment values files (`values-dev.yaml`, `values-prod.yaml`).
- Run `helm template` in CI to catch rendering errors before deploy.
- Use `helm lint` and `helm package` in pipelines; push charts to an OCI registry.
- Set resource limits in values to avoid noisy-neighbor pods.
- Never commit `charts/*.tgz` — use `.helmignore` and fetch dependencies in CI.
- Use `--atomic` on upgrades for automatic rollback on failure.
