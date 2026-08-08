# 🧪 Lab Session: Day 84 — Create an EKS Cluster with Terraform

**Jagu:** "Beep Boop! Golu, no console-clicking today — we're provisioning a real EKS cluster with Terraform, exactly like production teams do. Let's build! 🏗️"

## 🎯 Task Objectives
- Verify AWS CLI, kubectl, eksctl and Terraform are installed.
- Create a VPC + EKS cluster using the Terraform EKS module.
- Configure `aws eks update-kubeconfig` and connect kubectl.
- Verify nodes and core pods are healthy.

## 🛠️ Hands-on Challenges

> ⚠️ **Cost alert:** Running an EKS cluster costs money. Delete it (`terraform destroy`) right after the lab — that's Challenge 6.

1. **Pre-reqs:**
   ```bash
   aws --version && kubectl version --client && terraform version && eksctl version
   ```
   *(If any are missing, install: AWS CLI via the installer, kubectl via `curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"`, Terraform via `tfenv` or the zip, eksctl via the GitHub release.)*

2. **Make a working directory:**
   ```bash
   mkdir -p ~/eks-lab && cd ~/eks-lab
   ```

3. **Create `main.tf`** with the VPC + EKS module (use the module from the lesson):
   ```hcl
   provider "aws" {
     region = "us-east-1"
   }

   module "vpc" {
     source  = "terraform-aws-modules/vpc/aws"
     version = "~> 5.0"

     name = "eks-lab-vpc"
     cidr = "10.0.0.0/16"

     azs             = ["us-east-1a", "us-east-1b"]
     private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
     public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

     enable_nat_gateway = true
   }

   module "eks" {
     source  = "terraform-aws-modules/eks/aws"
     version = "~> 20.0"

    cluster_name    = "ai-bank-cluster"
    cluster_version = "1.31"
     vpc_id          = module.vpc.vpc_id
     subnet_ids      = module.vpc.private_subnets

     eks_managed_node_groups = {
       workers = {
         desired_size   = 2
         min_size       = 1
         max_size       = 3
         instance_types = ["t3.medium"]
       }
     }
   }

   output "cluster_endpoint" { value = module.eks.cluster_endpoint }
   output "cluster_name"     { value = module.eks.cluster_name }
   ```

4. **Apply it:**
   ```bash
   terraform init
   terraform plan
   terraform apply -auto-approve    # ~15 minutes — grab a chai ☕
   ```

5. **Connect & verify:**
   ```bash
   aws eks update-kubeconfig --region us-east-1 --name ai-bank-cluster
   kubectl cluster-info
   kubectl get nodes -o wide
   kubectl get pods -A   # expect core-dns, kube-proxy, aws-node, coredns running
   ```

6. **Teardown (IMPORTANT — saves your wallet):**
   ```bash
   terraform destroy -auto-approve
   ```

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste the output of `kubectl get nodes -o wide` (names, roles, versions).
3. Paste `kubectl get pods -A` showing the core system pods Running.
4. Paste `terraform output` showing the cluster endpoint + name.
5. Note the date/time you created and destroyed the cluster.
6. Commit and push!

---

*#LearnDevOpsIn90Days • Day 84 • Golu & Jagu Edition*
