# 🧪 Lab Session: Day 69 — Provisioning Production-Grade AWS EKS

**Jagu:** "Beep Boop! Golu, let's provision our infrastructure as code! Today we will verify our setups and launch environments."

## 🎯 Task Objectives
- Configure EKS-friendly VPC subnets with mandatory ELB tagging.
- Provision AWS EKS cluster and managed compute nodes via registry module.
- Update client kubeconfig and verify node status.

## 🛠️ Hands-on Challenges
1. **Design VPC:** Declare a VPC module with public and private subnets, enabling NAT Gateway. Tag private subnets with `kubernetes.io/role/internal-elb = 1`.
2. **Declare EKS:** Call EKS registry module using `t3.medium` instances for managed node group.
3. **Apply:** Deploy the cluster (note: this might take 10-15 minutes on AWS).
4. **Connect:** Update client credentials: `aws eks update-kubeconfig --name my-eks-cluster` and run `kubectl get nodes`.

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste the terminal logs of your `kubectl get nodes` command and the EKS module block config.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 69 • Golu & Jagu Edition*
