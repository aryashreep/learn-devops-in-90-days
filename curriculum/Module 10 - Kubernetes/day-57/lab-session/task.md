# 🧪 Lab 57: Injecting Configs & Credentials

## 🎯 Lab Objectives
- Create a ConfigMap with application settings.
- Create a Secret holding database login details.
- Write a Pod manifest that imports these environment configurations.
- Verify environment variables inside the running container.

## 🛠️ Step-by-Step Instructions

### Step 1: Create ConfigMap
Create `app-configmap.yaml`:
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-configmap
data:
  APP_ENV: "staging"
  APP_PORT: "8080"
```
Apply:
```powershell
kubectl apply -f app-configmap.yaml
```

### Step 2: Create Secret
Encode the value `mysqlpwd` to base64:
On Windows PowerShell:
```powershell
[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes("mysqlpwd"))
# Output is: bXlzcWxwd2Q=
```
Create `db-secret.yaml`:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: db-secret
type: Opaque
data:
  DB_PASSWORD: bXlzcWxwd2Q=
```
Apply:
```powershell
kubectl apply -f db-secret.yaml
```

### Step 3: Deploy Pod with Configurations
Create `configured-pod.yaml`:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: configured-pod
spec:
  containers:
  - name: alpine-test
    image: alpine
    command: ["sh", "-c", "env && sleep 3600"]
    env:
    - name: ENV_STAGE
      valueFrom:
        configMapKeyRef:
          name: app-configmap
          key: APP_ENV
    - name: DB_PASSWORD
      valueFrom:
        secretKeyRef:
          name: db-secret
          key: DB_PASSWORD
```
Apply:
```powershell
kubectl apply -f configured-pod.yaml
```

### Step 4: Verify Environment Variables
Check logs to verify the values printed:
```powershell
kubectl logs configured-pod
```
Verify that `ENV_STAGE=staging` and `DB_PASSWORD=mysqlpwd` are printed inside the logs.

### Step 5: Clean Up
```powershell
kubectl delete -f configured-pod.yaml
kubectl delete -f app-configmap.yaml
kubectl delete -f db-secret.yaml
```

## 📝 Submission
1. Save `app-configmap.yaml`, `db-secret.yaml`, and `configured-pod.yaml` to `curriculum/Module 10 - Kubernetes/day-57/lab-session/solution/`.
2. Commit and push: `git commit -m "day-57: configs and secrets complete"`.
