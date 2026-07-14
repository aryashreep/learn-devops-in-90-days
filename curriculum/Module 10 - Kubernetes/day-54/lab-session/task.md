# 🧪 Lab 54: Creating Your First Pods

## 🎯 Lab Objectives
- Write a declarative Pod manifest named `my-web-pod.yaml`.
- Launch the Pod using an NGINX image.
- Test port-forwarding to verify communication.
- View container logs and inspect pod events.

## 🛠️ Step-by-Step Instructions

### Step 1: Write Pod Manifest
Create a file named `my-web-pod.yaml`:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-web-pod
  labels:
    app: frontend
spec:
  containers:
  - name: web-container
    image: nginx:alpine
    ports:
    - containerPort: 80
```

### Step 2: Apply Manifest
```powershell
kubectl apply -f my-web-pod.yaml
```

### Step 3: Check Status
```powershell
kubectl get pods
kubectl describe pod my-web-pod
```

### Step 4: Test Access & Logs
In one terminal, start port forwarding:
```powershell
kubectl port-forward my-web-pod 8080:80
```
Open a browser or run `curl http://localhost:8080` to see the Nginx welcome page.
Check logs to see request entries:
```powershell
kubectl logs my-web-pod
```

### Step 5: Clean Up
```powershell
kubectl delete -f my-web-pod.yaml
```

## 📝 Submission
1. Create a file named `my-web-pod.yaml` and save it to `curriculum/Module 10 - Kubernetes/day-54/lab-session/solution/`.
2. Add a screenshot or text log verifying curl output to a file named `verification.txt` in the same directory.
3. Commit and push: `git commit -m "day-54: first pod lab complete"`.
