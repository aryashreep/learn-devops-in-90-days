# 🏗️ Module 15: Amazon EKS

Welcome to **Module 15**! In this module, we run **production-grade Kubernetes on AWS** using **Amazon EKS (Elastic Kubernetes Service)**. You'll provision a real cluster with Terraform, master the AWS-native networking and storage stack, and deploy the academy's **AI-BankApp** with autoscaling, ingress, and monitoring.

> *"You already know Kubernetes. Now let's make it someone else's problem to keep the control plane alive — and make YOUR cluster cloud-native."*

---

## 🎯 Module Overview
This 3-day module takes you from zero to a production-style EKS platform. You'll build the cluster with **Terraform** (no console clicking), then layer on AWS-native networking (VPC CNI, ALB) and storage (EBS/EFS CSI), and finish by deploying a real application with autoscaling and monitoring.

| Day | Topic | Key Focus |
|---|---|---|
| **Day 84** | [EKS Setup with Terraform](./day-84/README.md) | EKS architecture, IAM & OIDC, eksctl vs Terraform, `aws eks update-kubeconfig` |
| **Day 85** | [EKS Networking & Storage](./day-85/README.md) | VPC CNI, Service types, ALB Ingress, EBS & EFS CSI, StorageClasses |
| **Day 86** | [Project: Deploying AI-BankApp](./day-86/README.md) | Production deploy, HPA + Cluster Autoscaler, secrets, ingress, monitoring |

---

## 📚 Module Resources

| Resource | Link |
|---|---|
| 🏗️ **EKS Cheatsheet** | [Command Reference](./EKS_CHEATSHEET.md) |
| 📝 **Module 15 Mastery Exam** | [30 MCQs](./mastery-exam/README.md) |

---

## 🏆 Mastery Assessment
After completing all 3 days, validate your knowledge:
- 📝 [Module 15 Mastery Exam](./mastery-exam/README.md) (30 MCQs)

---

## 🔗 Cross-References

| Module | Link |
|---|---|
| Module 10 — Kubernetes | [Kubernetes](../Module%2010%20-%20Kubernetes/README.md) (the concepts you deploy to EKS) |
| Module 11 — Terraform [IaC] | [Terraform](../Module%2011%20-%20Terraform%20[IaC]/README.md) (the IaC that provisions EKS) |
| Module 14 — Helm [K8s Package Mgmt] | [Helm](../Module%2014%20-%20Helm%20%5BK8s%20Package%20Mgmt%5D/README.md) (package your EKS workloads) |
| Module 16 — GitOps & ArgoCD | 🚧 Coming soon (Days 87–89) — ArgoCD deploys to your EKS clusters |

*Kubernetes is the operating system of the cloud — EKS is how AWS runs it for you, at scale. 🏗️*
