# 🧪 Lab Session: Day 83 — Multi-Env Helm Pipeline

**Jagu:** "Beep Boop! Golu, the grand finale — environment-aware Helm deployments AND a CI/CD pipeline!"

## 🎯 Task Objectives
- Create `values-dev.yaml` and `values-prod.yaml` overrides.
- Render and deploy the chart to multiple namespaces.
- Verify values precedence with `--set`.
- Add a GitHub Actions workflow that lints, packages, and deploys.

## 🛠️ Hands-on Challenges

1. **Create environment values** next to your chart from Day 82:
   ```bash
   cd ~/helm-lab
   cat > ai-bankapp/values-dev.yaml <<'EOF'
   replicaCount: 1
   image:
     tag: "latest"
   ingress:
     enabled: false
   EOF
   cat > ai-bankapp/values-prod.yaml <<'EOF'
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
   EOF
   ```

2. **Render and compare environments:**
   ```bash
   helm template ai-bankapp ./ai-bankapp -f ai-bankapp/values-dev.yaml | grep -E "replicas:|image:"
   helm template ai-bankapp ./ai-bankapp -f ai-bankapp/values-prod.yaml | grep -E "replicas:|image:"
   ```

3. **Test precedence:**
   ```bash
   helm template ai-bankapp ./ai-bankapp -f ai-bankapp/values-prod.yaml --set replicaCount=10 | grep "replicas:"
   # expect: replicas: 10
   ```

4. **Deploy to two namespaces (needs kind/minikube):**
   ```bash
   helm upgrade --install ai-bankapp ./ai-bankapp \
     -f ai-bankapp/values-dev.yaml -n dev --create-namespace
   helm upgrade --install ai-bankapp ./ai-bankapp \
     -f ai-bankapp/values-prod.yaml -n prod --create-namespace
   helm list -A
   helm history ai-bankapp -n prod
   ```

5. **Safe upgrade with --atomic:**
   ```bash
   helm upgrade --install ai-bankapp ./ai-bankapp \
     -f ai-bankapp/values-prod.yaml -n prod --atomic
   ```

6. **Create the GitHub Actions workflow** `.github/workflows/helm-deploy.yml`:
   - Trigger: `push` on `main`
   - Steps: checkout → `azure/setup-helm@v4` → `helm lint` → `helm template -f values-prod.yaml` → `helm package -d ./dist` → `helm push oci://ghcr.io/aryashreep`
   - **Cluster auth:** add a step that writes `${{ secrets.KUBECONFIG_B64 }}` (base64) to `$HOME/.kube/config` so `helm` can reach the cluster
   - Final step: `helm upgrade --install ... -f values-prod.yaml -n prod --create-namespace --atomic`

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste `values-dev.yaml` and `values-prod.yaml`.
3. Paste the rendered `replicas:`/`image:` lines for dev vs prod (and the `--set replicaCount=10` output).
4. Paste `helm list -A` output showing dev + prod releases.
5. Paste your `helm-deploy.yml` workflow file.
6. Commit and push!

---

*#LearnDevOpsIn90Days • Day 83 • Golu & Jagu Edition*
