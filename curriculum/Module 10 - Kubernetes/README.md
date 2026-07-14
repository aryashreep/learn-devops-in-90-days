# ☸️ Module 10: Kubernetes [CKA]

Welcome to **Module 10**! In this module, we transition from containerizing individual applications to orchestrating and managing large-scale container deployments using **Kubernetes (K8s)**. Kubernetes is the industry-standard container orchestration platform originally developed by Google. This module covers core Kubernetes concepts, architecture, workloads, configuration, storage, networking, scheduling, package management with Helm, and a real-world Capstone project.

---

## 🎯 Module Overview
This 11-day module is designed to take you from a Kubernetes beginner to a professional who can configure, scale, and secure production-ready Kubernetes applications.

| Day | Topic | Key Focus |
|---|---|---|
| **Day 53** | [Kubernetes Architecture & Cluster Setup](./day-53/README.md) | Control Plane, Worker Nodes, and setting up a local cluster using **Kind**. |
| **Day 54** | [Kubernetes Manifests & Your First Pods](./day-54/README.md) | Declaring desired state using YAML, running and managing Pods. |
| **Day 55** | [Namespaces, ReplicaSets & Deployments](./day-55/README.md) | Managing stateless applications, scaling, rolling updates, and rollbacks. |
| **Day 56** | [Kubernetes Services & Gateway API](./day-56/README.md) | Stable networking with ClusterIP, NodePort, LoadBalancer, and routing via Gateway API. |
| **Day 57** | [ConfigMaps & Secrets](./day-57/README.md) | Decoupling application configuration and sensitive credentials. |
| **Day 58** | [Volumes, PV, PVC & Storage Classes](./day-58/README.md) | Persistent storage configuration, static and dynamic provisioning. |
| **Day 59** | [StatefulSets & DaemonSets](./day-59/README.md) | Running stateful database clusters and per-node infrastructure agents. |
| **Day 60** | [Resource Limits, QoS & Probes](./day-60/README.md) | Allocating resources, Quality of Service classes, and health checks (Liveness, Readiness, Startup). |
| **Day 61** | [HPA & Advanced Scheduling](./day-61/README.md) | Horizontal Pod Autoscaling and node scheduling (Affinity, Anti-Affinity, Taints & Tolerations). |
| **Day 62** | [Helm Package Manager](./day-62/README.md) | Packaging applications, configuring values.yaml, and managing releases. |
| **Day 63** | [Capstone: WordPress + MySQL on K8s](./day-63/README.md) | E2E Project: Deploying a multi-tier stateful application on Kubernetes. |

---

## 📚 Module Resources

| Resource | Link |
|---|---|
| ☸️ **Kubernetes Cheatsheet** | [Command Reference](./Kubernetes_CHEATSHEET.md) |
| 📝 **Module 10 Mastery Exam** | [30 MCQs](./mastery-exam/README.md) |

---

## 🏆 Mastery Assessment
After completing all 11 days, validate your knowledge:
- 📝 [Module 10 Mastery Exam](./mastery-exam/README.md) (30 MCQs)

---

## 🔗 Cross-References

| Module | Link |
|---|---|
| Module 07 — Docker & Containerization | [Docker & Containerization](../Module%2007%20-%20Docker%20&%20Containerization/README.md) (Pre-requisite — images, container lifecycles, and docker compose) |
| Module 08 — CI/CD with GitHub Actions | [CI-CD with GitHub Actions](../Module%2008%20-%20CI-CD%20with%20GitHub%20Actions/README.md) (Pre-requisite — automating builds and deployment scripts) |
| Module 09 — DevSecOps | [DevSecOps](../Module%2009%20-%20DevSecOps/README.md) (Pre-requisite — securing container images) |

*If containerization was about building the blocks, Kubernetes is about building the castle. Let's get started! ☸️*
