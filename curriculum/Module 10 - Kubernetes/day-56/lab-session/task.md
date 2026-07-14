# 🧪 Lab 56: Services & Routing

## 🎯 Lab Objectives
- Expose a deployment internally using a ClusterIP Service.
- Expose the application to the host machine using a NodePort Service.
- Install Gateway API Custom Resource Definitions (CRDs).
- Set up a basic HTTPRoute mapping.

## 🛠️ Step-by-Step Instructions

### Step 1: Deploy Web Workload
Create `app-workload.yaml`:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-workload
spec:
  replicas: 2
  selector:
    matchLabels:
      app: app-web
  template:
    metadata:
      labels:
        app: app-web
    spec:
      containers:
      - name: nginx
        image: nginx:alpine
        ports:
        - containerPort: 80
```
Apply:
```powershell
kubectl apply -f app-workload.yaml
```

### Step 2: Create ClusterIP Service
Expose the app internally:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: app-clusterip
spec:
  type: ClusterIP
  selector:
    app: app-web
  ports:
  - port: 80
    targetPort: 80
```
Apply and check endpoints:
```powershell
kubectl apply -f clusterip-svc.yaml
kubectl get service app-clusterip
kubectl get endpoints app-clusterip
```

### Step 3: Create NodePort Service
Expose to local machine:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: app-nodeport
spec:
  type: NodePort
  selector:
    app: app-web
  ports:
  - port: 80
    targetPort: 80
    nodePort: 32000
```
Apply:
```powershell
kubectl apply -f nodeport-svc.yaml
```
Verify port mapping. If running Kind, you must port-forward or use local docker container IP to access port `32000`.
```powershell
kubectl port-forward svc/app-nodeport 8080:80
```

### Step 4: Install Gateway API CRDs
Install the standard Gateway API CRDs to learn manifest validation:
```powershell
kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/standard-install.yaml
```
Check installed API resources:
```powershell
kubectl api-resources | grep gateway
```

## 📝 Submission
1. Save `app-workload.yaml`, `clusterip-svc.yaml`, and `nodeport-svc.yaml` to `curriculum/Module 10 - Kubernetes/day-56/lab-session/solution/`.
2. Commit and push: `git commit -m "day-56: services and routing complete"`.
