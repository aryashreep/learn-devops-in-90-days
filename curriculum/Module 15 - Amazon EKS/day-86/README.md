# 🏦 Day 86 — Project: Deploying AI-BankApp on EKS

**Golu:** "Jagu, this is the day! Let's deploy the academy's AI-BankApp to our EKS cluster like a real production platform!"
**Jagu:** "Beep Boop! Production means: namespaces, autoscaling (pods AND nodes), secrets from AWS, an ALB with TLS, and monitoring. Let's build the full stack, Golu — this is your capstone! 🏦"

---

## 🎯 Learning Objectives
- Design a **production deployment** architecture on EKS (ALB → Ingress → Services → Pods).
- Deploy AI-BankApp with **Deployment, Service, HPA** manifests.
- Scale with **HPA (pods)** + **Cluster Autoscaler (nodes)**.
- Inject secrets from **AWS Secrets Manager via IRSA/External Secrets**.
- Expose via **ALB Ingress with TLS (ACM certificate)**.
- Add **observability** with CloudWatch Container Insights / Prometheus.
- Perform a **zero-downtime rollout** with readiness probes + rolling updates.

---

## 📖 Read the Full Lesson
Open the interactive blackboard module: **[Day86_Project_AI_BankApp_EKS.html](./Day86_Project_AI_BankApp_EKS.html)**

---

## 🛠️ Lab Session
Complete the hands-on lab: **[task.md](./lab-session/task.md)** and upload proof in **[solution/](./lab-session/solution/)**

---

## ❓ Mini Quiz

1. **What scales the number of POD replicas automatically?**
   - a) HPA
   - b) Cluster Autoscaler
   - c) EBS
   - d) Ingress

2. **What scales the number of NODES automatically?**
   - a) HPA
   - b) VPC CNI
   - c) Cluster Autoscaler
   - d) ALB

3. **Which probe makes Kubernetes only send traffic to a ready pod?**
   - a) livenessProbe
   - b) readinessProbe
   - c) startupProbe
   - d) execProbe

**Answers:** 1-a | 2-c | 3-b

---

*#LearnDevOpsIn90Days • Day 86 • Phase 15: Amazon EKS • @AryashreePritikrishna*
