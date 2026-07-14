# 🧪 Lab 61: Scaling & Node Isolation

## 🎯 Lab Objectives
- Apply a taint to one of your Kind worker nodes.
- Deploy an app and verify it only schedules on the untainted node.
- Write a deployment with tolerations to verify it bypasses the taint.
- Set up a Horizontal Pod Autoscaler (HPA) manifest.

## 🛠️ Step-by-Step Instructions

### Step 1: Inspect Kind Nodes
Identify your worker nodes:
```powershell
kubectl get nodes
# Let's say workers are devops-k8s-worker and devops-k8s-worker2
```

### Step 2: Apply Taint to Node
Taint worker node 1:
```powershell
kubectl taint nodes devops-k8s-worker key=dedicated:NoSchedule
```

### Step 3: Deploy Workload Without Tolerations
Create `taint-test-deploy.yaml`:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: test-deploy
spec:
  replicas: 4
  selector:
    matchLabels:
      app: test
  template:
    metadata:
      labels:
        app: test
    spec:
      containers:
      - name: nginx
        image: nginx:alpine
```
Apply:
```powershell
kubectl apply -f taint-test-deploy.yaml
```
Verify pod placements. Run `kubectl get pods -o wide`. You will notice that ALL pods scheduled on `devops-k8s-worker2` (untainted node) and none went to `devops-k8s-worker` (tainted node).

### Step 4: Write Deployment with Toleration
Delete the old deployment:
```powershell
kubectl delete -f taint-test-deploy.yaml
```
Update `taint-test-deploy.yaml` to include toleration:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: test-deploy
spec:
  replicas: 4
  selector:
    matchLabels:
      app: test
  template:
    metadata:
      labels:
        app: test
    spec:
      containers:
      - name: nginx
        image: nginx:alpine
      tolerations:
      - key: "dedicated"
        operator: "Equal"
        value: "dedicated"
        effect: "NoSchedule"
```
Apply:
```powershell
kubectl apply -f taint-test-deploy.yaml
```
Verify pod placements. Now, pods should be distributed across both `devops-k8s-worker` and `devops-k8s-worker2`!

### Step 5: Write HPA Manifest
Create `app-hpa.yaml`:
```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: test-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: test-deploy
  minReplicas: 1
  maxReplicas: 5
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 50
```
Apply:
```powershell
kubectl apply -f app-hpa.yaml
```

### Step 6: Clean Up Node Taint & Workloads
Remove the taint:
```powershell
kubectl taint nodes devops-k8s-worker key=dedicated:NoSchedule-
kubectl delete -f taint-test-deploy.yaml
kubectl delete -f app-hpa.yaml
```

## 📝 Submission
1. Save `taint-test-deploy.yaml` and `app-hpa.yaml` to `curriculum/Module 10 - Kubernetes/day-61/lab-session/solution/`.
2. Commit and push: `git commit -m "day-61: autoscaling and scheduling lab complete"`.
