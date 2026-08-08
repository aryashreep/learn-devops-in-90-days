# 🌐 Day 85 — EKS Networking & Persistent Storage

**Golu:** "Jagu, my pods are running... but users can't reach them, and my data vanishes on every restart!"
**Jagu:** "Beep Boop! Two missing pieces, Golu: **networking** — Services, ALB Ingress and the VPC CNI — and **storage** — EBS for databases and EFS for shared files. Both are first-class citizens on EKS! 🌐"

---

## 🎯 Learning Objectives
- Explain how the **VPC CNI** gives every pod a real VPC IP.
- Use Service types: **ClusterIP, NodePort, LoadBalancer**.
- Install the **AWS Load Balancer Controller** and expose apps via **ALB Ingress**.
- Provision storage with the **EBS CSI driver** (block, single-AZ) and **EFS CSI driver** (shared, multi-AZ).
- Use **StorageClasses, PersistentVolumes and PVCs** the EKS way.

---

## 📖 Read the Full Lesson
Open the interactive blackboard module: **[Day85_EKS_Networking_Storage.html](./Day85_EKS_Networking_Storage.html)**

---

## 🛠️ Lab Session
Complete the hands-on lab: **[task.md](./lab-session/task.md)** and upload proof in **[solution/](./lab-session/solution/)**

---

## ❓ Mini Quiz

1. **What gives every pod a real IP inside the VPC?**
   - a) Calico
   - b) VPC CNI
   - c) Flannel
   - d) Weave

2. **Which Service type exposes pods on every node's IP:port?**
   - a) ClusterIP
   - b) LoadBalancer
   - c) NodePort
   - d) ExternalName

3. **Which controller provisions ALBs for Ingress on EKS?**
   - a) AWS Load Balancer Controller
   - b) nginx-ingress
   - c) Traefik
   - d) HAProxy

**Answers:** 1-b | 2-c | 3-a

---

*#LearnDevOpsIn90Days • Day 85 • Phase 15: Amazon EKS • @AryashreePritikrishna*
