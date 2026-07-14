# 🧪 Lab 63: WordPress + MySQL Capstone Project

## 🎯 Lab Objectives
- Create a secrets file for database passwords.
- Create Persistent Volume Claims (PVC) for MySQL database and WordPress uploads.
- Deploy a MySQL deployment and expose it via a Service.
- Deploy a WordPress deployment linking to the MySQL Service.
- Expose WordPress and perform complete installation in local browser.

## 🛠️ Step-by-Step Instructions

### Step 1: Create Secrets
Encode `dbpassword` in base64: `ZGJwYXNzd29yZA==`.
Create `secret.yaml`:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mysql-pass-secret
type: Opaque
data:
  password: ZGJwYXNzd29yZA==
```
Apply:
```powershell
kubectl apply -f secret.yaml
```

### Step 2: Create Storage Claims
Create `wordpress-pvc.yaml` containing claims for both WordPress and MySQL:
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mysql-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: wp-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```
Apply:
```powershell
kubectl apply -f wordpress-pvc.yaml
```

### Step 3: Deploy MySQL
Create `mysql-deployment.yaml`:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: wordpress-mysql
spec:
  selector:
    matchLabels:
      app: wordpress
      tier: mysql
  template:
    metadata:
      labels:
        app: wordpress
        tier: mysql
    spec:
      containers:
      - name: mysql
        image: mysql:5.7
        env:
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-pass-secret
              key: password
        ports:
        - containerPort: 3306
          name: mysql
        volumeMounts:
        - name: mysql-persistent-storage
          mountPath: /var/lib/mysql
      volumes:
      - name: mysql-persistent-storage
        persistentVolumeClaim:
          claimName: mysql-pvc
```
Create `mysql-service.yaml` to expose MySQL:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: wordpress-mysql
spec:
  ports:
  - port: 3306
  selector:
    app: wordpress
    tier: mysql
```
Apply:
```powershell
kubectl apply -f mysql-deployment.yaml
kubectl apply -f mysql-service.yaml
```

### Step 4: Deploy WordPress
Create `wordpress-deployment.yaml`:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: wordpress
spec:
  selector:
    matchLabels:
      app: wordpress
      tier: frontend
  template:
    metadata:
      labels:
        app: wordpress
        tier: frontend
    spec:
      containers:
      - name: wordpress
        image: wordpress:latest
        env:
        - name: WORDPRESS_DB_HOST
          value: wordpress-mysql:3306
        - name: WORDPRESS_DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-pass-secret
              key: password
        ports:
        - containerPort: 80
          name: wordpress
        volumeMounts:
        - name: wordpress-persistent-storage
          mountPath: /var/www/html
      volumes:
      - name: wordpress-persistent-storage
        persistentVolumeClaim:
          claimName: wp-pvc
```
Create `wordpress-service.yaml` to expose WordPress:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: wordpress
spec:
  ports:
  - port: 80
  selector:
    app: wordpress
    tier: frontend
  type: NodePort
```
Apply:
```powershell
kubectl apply -f wordpress-deployment.yaml
kubectl apply -f wordpress-service.yaml
```

### Step 5: Test & Install
Check status of all components. Wait until all pods are `Running`:
```powershell
kubectl get pods
```
Start port-forwarding to access the installation wizard:
```powershell
kubectl port-forward svc/wordpress 8080:80
```
Open a browser and navigate to `http://localhost:8080`. Perform the WordPress installation!

### Step 6: Clean Up
```powershell
kubectl delete -f wordpress-service.yaml
kubectl delete -f wordpress-deployment.yaml
kubectl delete -f mysql-service.yaml
kubectl delete -f mysql-deployment.yaml
kubectl delete -f wordpress-pvc.yaml
kubectl delete -f secret.yaml
```

## 📝 Submission
1. Save all YAML files (`secret.yaml`, `wordpress-pvc.yaml`, `mysql-deployment.yaml`, `mysql-service.yaml`, `wordpress-deployment.yaml`, `wordpress-service.yaml`) to `curriculum/Module 10 - Kubernetes/day-63/lab-session/solution/`.
2. Include a screenshot or text verification log showing successful setup in the same folder as `screenshot.txt`.
3. Commit and push: `git commit -m "day-63: capstone project complete"`.
