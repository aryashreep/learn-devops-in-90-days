# 🏷️ Module 14: Helm [K8s Package Mgmt]

Welcome to **Module 14**! In this module, we master **Helm** — the Kubernetes package manager. Helm packages complex applications into reusable **charts**, so you can deploy, upgrade, and roll back production workloads with a single command instead of juggling hundreds of YAML files.

> *"Kubernetes YAML is the source of truth — Helm is how you stop repeating it 100 times."*

---

## 🎯 Module Overview
This 3-day module takes you from Helm basics to shipping environment-specific releases through CI/CD. You'll learn the chart anatomy, build a custom chart for the academy's **AI-BankApp**, and wire it into a multi-environment pipeline.

| Day | Topic | Key Focus |
|---|---|---|
| **Day 81** | [Introduction to Helm & Chart Basics](./day-81/README.md) | Architecture, chart structure, repos, install/upgrade/rollback |
| **Day 82** | [Custom Chart for AI-BankApp](./day-82/README.md) | helm create, templates, values, helpers, lint, package |
| **Day 83** | [Project: Multi-Env CI/CD](./day-83/README.md) | values per environment, helm in GitHub Actions, releases |

---

## 📚 Module Resources

| Resource | Link |
|---|---|
| 🏷️ **Helm Cheatsheet** | [Command Reference](./Helm_CHEATSHEET.md) |
| 📝 **Module 14 Mastery Exam** | [30 MCQs](./mastery-exam/README.md) |

---

## 🏆 Mastery Assessment
After completing all 3 days, validate your knowledge:
- 📝 [Module 14 Mastery Exam](./mastery-exam/README.md) (30 MCQs)

---

## 🔗 Cross-References

| Module | Link |
|---|---|
| Module 10 — Kubernetes | [Kubernetes](../Module%2010%20-%20Kubernetes/README.md) (Helm deploys the manifests you learned to write) |
| Module 11 — Terraform [IaC] | [Terraform](../Module%2011%20-%20Terraform%20[IaC]/README.md) (Terraform provisions the cluster, Helm fills it) |
| Module 15 — Amazon EKS | [EKS](../Module%2015%20-%20Amazon%20EKS/README.md) (Helm + EKS = production-grade platform) |

*If Kubernetes is the operating system of the cloud, Helm is its package manager — apt-get for your cluster! 🏷️*
