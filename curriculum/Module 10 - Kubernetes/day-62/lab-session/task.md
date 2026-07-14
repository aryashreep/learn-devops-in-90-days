# 🧪 Lab 62: Packaging with Helm

## 🎯 Lab Objectives
- Install the Helm CLI.
- Add an official repository and install a Nginx web server.
- Edit values on the command line using `--set`.
- Perform a release upgrade and roll back.

## 🛠️ Step-by-Step Instructions

### Step 1: Install Helm CLI
On Windows:
```powershell
winget install Helm.Helm
```

### Step 2: Add Bitnami Chart Repository
```powershell
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

### Step 3: Install Nginx server using Helm
Install a release named `lab-web` into the default namespace:
```powershell
helm install lab-web bitnami/nginx --set replicaCount=2
```
Verify the installation:
```powershell
helm list
kubectl get deployments
kubectl get pods
```

### Step 4: Upgrade the Release
Change the replica count from 2 to 3:
```powershell
helm upgrade lab-web bitnami/nginx --set replicaCount=3
```
Verify pods scale:
```powershell
kubectl get pods
```

### Step 5: Rollback the Release
View release history:
```powershell
helm history lab-web
```
Rollback to revision 1:
```powershell
helm rollback lab-web 1
```
Verify the replica count returns to 2:
```powershell
kubectl get deployments
```

### Step 6: Clean Up
Uninstall Nginx:
```powershell
helm uninstall lab-web
```

## 📝 Submission
1. Create a file named `helm-info.txt` in `curriculum/Module 10 - Kubernetes/day-62/lab-session/solution/`.
2. Write the output of `helm list` inside it during the lab.
3. Commit and push: `git commit -m "day-62: helm lab complete"`.
