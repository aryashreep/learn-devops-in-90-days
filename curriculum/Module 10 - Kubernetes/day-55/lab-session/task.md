# 🧪 Lab 55: Deployments, Scaling, and Rollbacks

## 🎯 Lab Objectives
- Create a namespace named `staging`.
- Deploy an NGINX application with 3 replicas.
- Scale the deployment to 5 replicas.
- Perform an image update and roll back the change.

## 🛠️ Step-by-Step Instructions

### Step 1: Create Namespace
```powershell
kubectl create namespace staging
```

### Step 2: Write Deployment Manifest
Create a file named `web-deploy.yaml`:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-deploy
  namespace: staging
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: nginx
        image: nginx:1.25-alpine
        ports:
        - containerPort: 80
```

### Step 3: Apply and Inspect
```powershell
kubectl apply -f web-deploy.yaml
kubectl get deployments -n staging
kubectl get pods -n staging
```

### Step 4: Scale the workload
```powershell
kubectl scale deployment/web-deploy --replicas=5 -n staging
kubectl get pods -n staging
```

### Step 5: Perform Update & Rollback
Trigger an update to a non-existent tag to simulate failure:
```powershell
kubectl set image deployment/web-deploy nginx=nginx:broken-tag -n staging
```
Check status. You will see pods stuck in `ErrImagePull` or `ImagePullBackOff`.
```powershell
kubectl get pods -n staging
```
Undo the change:
```powershell
kubectl rollout undo deployment/web-deploy -n staging
kubectl get pods -n staging
```

### Step 6: Clean Up
```powershell
kubectl delete namespace staging
```

## 📝 Submission
1. Save `web-deploy.yaml` to `curriculum/Module 10 - Kubernetes/day-55/lab-session/solution/`.
2. Include the output logs of `kubectl rollout history deployment/web-deploy -n staging` in a file named `rollout-history.txt`.
3. Commit and push: `git commit -m "day-55: deployments and rollback lab complete"`.
