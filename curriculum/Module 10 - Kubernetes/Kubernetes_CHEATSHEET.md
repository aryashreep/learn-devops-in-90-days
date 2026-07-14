# ☸️ Kubernetes Command Cheatsheet

A compiled list of essential `kubectl` and `kind` commands to help you manage local development and administration.

---

## 🛠️ Kind (Kubernetes in Docker) Commands

```bash
# Create a local cluster from config
kind create cluster --config kind-config.yaml --name devops-k8s

# List active Kind clusters
kind get clusters

# Delete a specific cluster
kind delete cluster --name devops-k8s
```

---

## 🔍 Cluster Telemetry & Discovery

```bash
# Get cluster endpoints
kubectl cluster-info

# List all nodes
kubectl get nodes -o wide

# View detailed properties of a node
kubectl describe node <node-name>

# View resource utilization (requires Metrics Server)
kubectl top nodes
kubectl top pods
```

---

## 📦 Workload Management

```bash
# Get resources (pods, services, deployments, replicasets)
kubectl get pods
kubectl get deployments
kubectl get replicasets
kubectl get services

# View verbose resource description
kubectl describe pod <pod-name>
kubectl describe deployment <deployment-name>

# Watch resources in real-time
kubectl get pods -w

# Delete resources
kubectl delete pod <pod-name>
kubectl delete deployment <deployment-name>
```

---

## 🚀 Scaling & Updates

```bash
# Scale deployment count
kubectl scale deployment/<deployment-name> --replicas=5

# Set a new container image tag (rolling update)
kubectl set image deployment/<deployment-name> <container-name>=<new-image>:<tag>

# Check rollout status
kubectl rollout status deployment/<deployment-name>

# View rollout history
kubectl rollout history deployment/<deployment-name>

# Rollback to the previous deployment revision
kubectl rollout undo deployment/<deployment-name>

# Rollback to a specific revision
kubectl rollout undo deployment/<deployment-name> --to-revision=2
```

---

## 🌐 Services & Networking

```bash
# Expose a deployment as a Service (ClusterIP)
kubectl expose deployment <deployment-name> --port=80 --target-port=80 --name=<svc-name>

# List active endpoints
kubectl get endpoints <svc-name>

# Expose a resource via port forwarding
kubectl port-forward svc/<svc-name> 8080:80
kubectl port-forward pod/<pod-name> 8080:80
```

---

## 🔑 Configurations & Credentials

```bash
# Create ConfigMap from variables
kubectl create configmap app-config --from-literal=KEY=VALUE

# Create generic Secret
kubectl create secret generic app-secret --from-literal=password=my-password

# View values (base64 encoded for secrets)
kubectl get configmap app-config -o yaml
kubectl get secret app-secret -o yaml
```

---

## 🔧 Debugging & Execution

```bash
# View container output logs
kubectl logs <pod-name>

# Stream logs in real-time
kubectl logs -f <pod-name>

# Execute sh inside running container
kubectl exec -it <pod-name> -- sh

# Check API permissions
kubectl auth can-i create pods
```

---

## 🏷️ Helm CLI Commands

```bash
# Add a repository
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# Install a chart release
helm install my-release bitnami/nginx

# Upgrade a release with changes
helm upgrade my-release bitnami/nginx --set replicaCount=3

# Rollback a release
helm rollback my-release 1

# List installed releases
helm list

# Uninstall a release
helm uninstall my-release
```
