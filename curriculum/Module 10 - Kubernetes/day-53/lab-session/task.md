# 🧪 Lab 53: Cluster Setup with Kind

## 🎯 Lab Objectives
- Install the `kind` tool and create a multi-node configuration.
- Boot a multi-node cluster named `devops-k8s`.
- Configure `kubectl` client to interact with the Kind cluster.
- Retrieve node state and cluster info.

## 🛠️ Step-by-Step Instructions

### Step 1: Install Kind and kubectl
Verify that docker is running, then install Kind (via Go, winget, or direct binary download) and `kubectl`.
On Windows:
```powershell
# Install kind using winget
winget install Kubernetes.Kind

# Install kubectl
winget install Kubernetes.kubectl
```

### Step 2: Write Kind Multi-Node Configuration
Create a file named `kind-config.yaml` with the following configuration:
```yaml
apiVersion: kind.x-k8s.io/v1alpha4
kind: Cluster
nodes:
- role: control-plane
- role: worker
- role: worker
```

### Step 3: Create the Cluster
```powershell
kind create cluster --config kind-config.yaml --name devops-k8s
```

### Step 4: Verify the Cluster
```powershell
kubectl cluster-info
kubectl get nodes -o wide
```

## 📝 Submission
1. Create a markdown file named `kind-setup.md` inside `curriculum/Module 10 - Kubernetes/day-53/lab-session/solution/`.
2. Include the output of `kubectl get nodes` in your file.
3. Commit and push: `git commit -m "day-53: kind cluster setup complete"`.
