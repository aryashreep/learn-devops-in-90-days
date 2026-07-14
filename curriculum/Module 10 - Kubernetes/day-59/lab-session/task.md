# 🧪 Lab 59: Stateful & Batch Workloads

## 🎯 Lab Objectives
- Create a Headless Service for a stateful app.
- Deploy a 2-replica MongoDB StatefulSet and verify their ordinal names.
- Create a simple CronJob that logs system details every minute.

## 🛠️ Step-by-Step Instructions

### Step 1: Write Headless Service
Create `mongo-service.yaml`:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: mongo-svc
spec:
  clusterIP: None
  selector:
    app: mongo
  ports:
  - port: 27017
    targetPort: 27017
```
Apply:
```powershell
kubectl apply -f mongo-service.yaml
```

### Step 2: Write StatefulSet Manifest
Create `mongo-statefulset.yaml`:
```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: mongo-db
spec:
  serviceName: "mongo-svc"
  replicas: 2
  selector:
    matchLabels:
      app: mongo
  template:
    metadata:
      labels:
        app: mongo
    spec:
      containers:
      - name: mongodb
        image: mongo:latest
        ports:
        - containerPort: 27017
```
Apply:
```powershell
kubectl apply -f mongo-statefulset.yaml
```
Verify the pods boot sequentially (`mongo-db-0` starts and goes to running before `mongo-db-1` initializes):
```powershell
kubectl get pods -w
```

### Step 3: Write a CronJob
Create a cron job that outputs "Backup task finished" every minute. Create `backup-cronjob.yaml`:
```yaml
apiVersion: batch/v1
kind: CronJob
metadata:
  name: backup-cron
spec:
  schedule: "*/1 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
          - name: cron-worker
            image: alpine
            command: ["sh", "-c", "echo 'Backup task completed at $(date)'"]
          restartPolicy: OnFailure
```
Apply:
```powershell
kubectl apply -f backup-cronjob.yaml
```
Wait a couple of minutes and verify the execution pods and logs:
```powershell
kubectl get jobs
kubectl get pods
# Replace with your job pod name
kubectl logs -l job-name=backup-cron-xxxx
```

### Step 4: Clean Up
```powershell
kubectl delete -f backup-cronjob.yaml
kubectl delete -f mongo-statefulset.yaml
kubectl delete -f mongo-service.yaml
```

## 📝 Submission
1. Save `mongo-service.yaml`, `mongo-statefulset.yaml`, and `backup-cronjob.yaml` to `curriculum/Module 10 - Kubernetes/day-59/lab-session/solution/`.
2. Commit and push: `git commit -m "day-59: stateful and batch workloads complete"`.
