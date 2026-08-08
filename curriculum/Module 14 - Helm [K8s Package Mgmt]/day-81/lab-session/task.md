# 🧪 Lab Session: Day 81 — First Helm Release

**Jagu:** "Beep Boop! Golu, let's get Helm installed and deploy our first release — install, upgrade, rollback, the whole ride!"

## 🎯 Task Objectives
- Install the Helm client and verify it.
- Add the Bitnami repository.
- Deploy nginx as a release with `helm install`.
- Upgrade values, inspect history, and roll back.

## 🛠️ Hands-on Challenges

1. **Install Helm** (Linux/macOS):
   ```bash
   curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
   helm version
   ```
   *(Windows: `winget install Helm.Helm` or chocolatey — or use the WSL2 Ubuntu shell.)*

2. **Add a repository:**
   ```bash
   helm repo add bitnami https://charts.bitnami.com/bitnami
   helm repo update
   helm search repo nginx
   ```

3. **Make sure you have a cluster** (pick one):
   ```bash
   kubectl cluster-info
   # If empty: kind create cluster  OR  minikube start
   ```

4. **Install your first release:**
   ```bash
   helm install my-nginx bitnami/nginx
   helm list
   kubectl get all
   kubectl get svc my-nginx
   ```

5. **Upgrade with new values:**
   ```bash
   helm upgrade my-nginx bitnami/nginx --set service.type=NodePort
   helm history my-nginx
   ```

6. **Roll back:**
   ```bash
   helm rollback my-nginx 1
   helm history my-nginx
   ```

7. **Inspect & cleanup:**
   ```bash
   helm status my-nginx
   helm uninstall my-nginx
   helm list   # should be empty
   ```

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste `helm version` output.
3. Paste the output of `helm list` after install (release name, chart, status).
4. Paste `helm history my-nginx` showing at least 2 revisions.
5. Paste `kubectl get all` showing the deployed resources.
6. Commit and push!

---

*#LearnDevOpsIn90Days • Day 81 • Golu & Jagu Edition*
