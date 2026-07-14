# 🧪 Lab 60: Probes & Resource Management

## 🎯 Lab Objectives
- Create a Pod with explicit CPU/Memory requests and limits.
- Set up a Readiness Probe checking a web endpoint.
- Set up a Liveness Probe checking local file status.
- Simulate application deadlock to trigger container self-healing.

## 🛠️ Step-by-Step Instructions

### Step 1: Write Pod Manifest with Probes
Create `probes-pod.yaml`:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: probes-pod
spec:
  containers:
  - name: server-container
    image: nginx:alpine
    resources:
      requests:
        memory: "50Mi"
        cpu: "100m"
      limits:
        memory: "100Mi"
        cpu: "200m"
    readinessProbe:
      httpGet:
        path: /
        port: 80
      initialDelaySeconds: 3
      periodSeconds: 5
    livenessProbe:
      exec:
        command:
        - cat
        - /tmp/healthy
      initialDelaySeconds: 5
      periodSeconds: 5
```
Apply the configuration:
```powershell
kubectl apply -f probes-pod.yaml
```

### Step 2: Check Pod Status
Wait and run:
```powershell
kubectl get pods
```
Notice that the pod is running, but restarts are triggering, or it shows `0/1 Ready` and restarts soon. Why?
Because the liveness probe checks for a file `/tmp/healthy` which does not exist in the container!
Let's verify by describing events:
```powershell
kubectl describe pod probes-pod
```
You will see `Liveness probe failed: cat: can't open '/tmp/healthy': No such file or directory`.

### Step 3: Solve Liveness Probe Failure
Write the file inside the container:
```powershell
kubectl exec probes-pod -- touch /tmp/healthy
```
Wait a few seconds. The pod should now become ready (`1/1` status) and stop restarting!
```powershell
kubectl get pods
```

### Step 4: Clean Up
```powershell
kubectl delete -f probes-pod.yaml
```

## 📝 Submission
1. Save `probes-pod.yaml` to `curriculum/Module 10 - Kubernetes/day-60/lab-session/solution/`.
2. Commit and push: `git commit -m "day-60: resource limits and probes complete"`.
