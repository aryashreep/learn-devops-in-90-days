# 🏗️ Day 84 — EKS Setup with Terraform

**Golu:** "Jagu, I can run Kubernetes locally with kind... but how does a REAL company run it in AWS?"
**Jagu:** "Beep Boop! They use **Amazon EKS** — AWS runs the control plane for you, and you manage the worker nodes (or let Fargate do it). Best part? We provision the whole thing with **Terraform**, so the cluster is reproducible and versioned! 🏗️"

---

## 🎯 Learning Objectives
- Explain what **Amazon EKS** is and what AWS manages for you.
- Describe the EKS building blocks: control plane, node groups, Fargate, VPC.
- Compare **eksctl** (quick demos) vs **Terraform** (production IaC).
- Understand **IAM roles & OIDC (IRSA)** for pod-level permissions.
- Provision a cluster and connect with `aws eks update-kubeconfig`.

---

## 📖 Read the Full Lesson
Open the interactive blackboard module: **[Day84_EKS_Setup_Terraform.html](./Day84_EKS_Setup_Terraform.html)**

---

## 🛠️ Lab Session
Complete the hands-on lab: **[task.md](./lab-session/task.md)** and upload proof in **[solution/](./lab-session/solution/)**

---

## ❓ Mini Quiz

1. **Who manages the Kubernetes control plane in EKS?**
   - a) You
   - b) Your cloud team
   - c) AWS
   - d) HashiCorp

2. **What does `aws eks update-kubeconfig` do?**
   - a) Deletes the cluster
   - b) Merges cluster access into your kubeconfig
   - c) Resizes the node group
   - d) Creates an IAM role

3. **Which tool provisions EKS declaratively as Infrastructure-as-Code?**
   - a) Terraform
   - b) kubectl
   - c) Docker
   - d) Helm

**Answers:** 1-c | 2-b | 3-a

---

*#LearnDevOpsIn90Days • Day 84 • Phase 15: Amazon EKS • @AryashreePritikrishna*
