# 🧪 Lab 58: Persistent Storage

## 🎯 Lab Objectives
- Define a Persistent Volume (PV) using `hostPath` storage.
- Create a Persistent Volume Claim (PVC) to bind to that storage.
- Mount the PVC inside an Apache HTTPD web server Pod.
- Write a file to the volume, delete the Pod, and verify data persists inside a replacement Pod.

## 🛠️ Step-by-Step Instructions

### Step 1: Write Persistent Volume Manifest
Create `local-pv.yaml`:
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: local-pv
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  hostPath:
    path: "/mnt/data-lab"
```
Apply:
```powershell
kubectl apply -f local-pv.yaml
```

### Step 2: Write PVC Manifest
Create `local-pvc.yaml`:
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: local-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 500Mi
```
Apply:
```powershell
kubectl apply -f local-pvc.yaml
```
Verify that the PVC successfully binds to your PV:
```powershell
kubectl get pvc
```
Status should change to `Bound`.

### Step 3: Mount Storage in a Pod
Create `web-storage-pod.yaml`:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: web-storage-pod
spec:
  containers:
  - name: web-container
    image: httpd:alpine
    ports:
    - containerPort: 80
    volumeMounts:
    - name: htdocs-volume
      mountPath: /usr/local/apache2/htdocs
  volumes:
  - name: htdocs-volume
    persistentVolumeClaim:
      claimName: local-pvc
```
Apply:
```powershell
kubectl apply -f web-storage-pod.yaml
```

### Step 4: Write Data & Verify Persistence
Write a test page into the web folder inside the container:
```powershell
kubectl exec web-storage-pod -- sh -c "echo 'Hello from Persistent Storage!' > /usr/local/apache2/htdocs/index.html"
```
Verify page runs locally:
```powershell
kubectl port-forward web-storage-pod 8080:80
```
Run `curl http://localhost:8080` in another terminal.
Now delete the Pod:
```powershell
kubectl delete pod web-storage-pod
```
Re-apply the exact same Pod:
```powershell
kubectl apply -f web-storage-pod.yaml
```
Verify the welcome page still exists inside the new Pod:
```powershell
kubectl exec web-storage-pod -- cat /usr/local/apache2/htdocs/index.html
```

### Step 5: Clean Up
```powershell
kubectl delete -f web-storage-pod.yaml
kubectl delete -f local-pvc.yaml
kubectl delete -f local-pv.yaml
```

## 📝 Submission
1. Save `local-pv.yaml`, `local-pvc.yaml`, and `web-storage-pod.yaml` to `curriculum/Module 10 - Kubernetes/day-58/lab-session/solution/`.
2. Commit and push: `git commit -m "day-58: persistent storage lab complete"`.
