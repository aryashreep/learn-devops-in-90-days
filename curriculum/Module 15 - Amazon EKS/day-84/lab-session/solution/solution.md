# 🏗️ Day 84 — Solution: EKS Cluster with Terraform

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 1. Prerequisites Verified

```bash
aws --version
kubectl version --client
terraform version
eksctl version
```

**Expected Output (partial):**
```
aws-cli/2.17.x Python/3.11.x ...
Client Version: v1.31.x
Terraform v1.8.x
eksctl version 0.18x.x
```

---

## ✅ 2. Terraform Plan (drift-free, review before apply)

```bash
terraform init
terraform plan
```

**Expected Output (partial):**
```
Plan: 58 to add, 0 to change, 0 to destroy.
```

---

## ✅ 3. Apply Created the Cluster

```bash
terraform apply -auto-approve
```

**Expected Output (tail):**
```
Apply complete! Resources: 58 added, 0 changed, 0 destroyed.

Outputs:
cluster_endpoint = "https://ABC123.gr7.us-east-1.eks.amazonaws.com"
cluster_name = "ai-bank-cluster"
```

---

## ✅ 4. Nodes Connected

```bash
aws eks update-kubeconfig --region us-east-1 --name ai-bank-cluster
kubectl get nodes -o wide
```

**Expected Output:**
```
NAME                          STATUS   ROLES    AGE   VERSION    INTERNAL-IP    ...
ip-10-0-1-12.ec2.internal     Ready    <none>   8m    v1.31.2    10.0.1.12      ...
ip-10-0-2-45.ec2.internal     Ready    <none>   8m    v1.31.2    10.0.2.45      ...
```

*(2 nodes — one per private subnet/AZ.)*

---

## ✅ 5. Core System Pods Healthy

```bash
kubectl get pods -A
```

**Expected Output (partial):**
```
NAMESPACE     NAME                       READY   STATUS    RESTARTS   AGE
kube-system   aws-node-xxxxx             1/1     Running   0          7m
kube-system   coredns-xxxxxxxxxx-xxxxx   1/1     Running   0          7m
kube-system   kube-proxy-xxxxx           1/1     Running   0          7m
```

---

## ✅ 6. Cleanup Completed

```bash
terraform destroy -auto-approve
# Destroy complete! Resources: 58 destroyed.
```

> 💸 Cluster existed for ~1 hour, then destroyed. No surprise AWS bill!

---

## ✅ Lessons Learned

- EKS gives you a **managed control plane** — no masters to patch or babysit.
- **Terraform** (not the console) is how production EKS platforms are built.
- `aws eks update-kubeconfig` is the bridge between your CLI and the cluster.
- Managed node groups make scaling & upgrades (Day 85–86) straightforward.
- Always **destroy** lab clusters — control plane + nodes are paid resources.
- Next: EKS networking (ALB) and storage (EBS/EFS)! 🏗️

---

*#LearnDevOpsIn90Days • Day 84 • Golu & Jagu Edition*
