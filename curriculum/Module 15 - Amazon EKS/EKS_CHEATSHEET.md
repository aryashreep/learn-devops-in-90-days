# 🏗️ Amazon EKS Cheatsheet

## 🚀 Cluster Creation & Access

```bash
# Prereqs
aws --version; kubectl version --client; terraform version
eksctl version

# Quick cluster (eksctl)
eksctl create cluster -f cluster.yaml --without-nodegroup
eksctl create cluster --name demo --region us-east-1 --nodegroup-name workers \
  --node-type t3.medium --nodes 2 --managed

# Get kubeconfig for an existing cluster
aws eks update-kubeconfig --region us-east-1 --name demo-cluster

# Verify
kubectl cluster-info
kubectl get nodes -o wide
kubectl get pods -A

# List/delete clusters
eksctl get cluster
eksctl delete cluster --name demo --region us-east-1
```

## 📦 Terraform EKS Module (Day 84)

```hcl
provider "aws" { region = var.region }

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "demo-cluster"
  cluster_version = "1.31"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  eks_managed_node_groups = {
    workers = {
      desired_size = 2
      min_size     = 1
      max_size     = 5
      instance_types = ["t3.medium"]
    }
  }
}

output "cluster_endpoint" { value = module.eks.cluster_endpoint }
output "cluster_name"     { value = module.eks.cluster_name }
```

Then: `terraform init && terraform plan && terraform apply -auto-approve`

## 🔐 IAM & IRSA (OIDC)

```bash
# Enable OIDC provider
eksctl utils associate-iam-oidc-provider --cluster demo --approve

# Create a service account with an IAM role
eksctl create iamserviceaccount \
  --cluster demo --namespace kube-system --name aws-load-balancer-controller \
  --attach-policy-arn arn:aws:iam::aws:policy/... --approve
```

## 🌐 Networking (Day 85)

```bash
# Service types
kubectl expose deploy nginx --port 80 --type=LoadBalancer   # NLB (L4)
kubectl expose deploy nginx --port 80 --type=NodePort

# AWS Load Balancer Controller (ALB for Ingress)
# 1. Attach the AWSLoadBalancerControllerIAMPolicy via IRSA (see Day 85),
#    then install with that service account:
helm repo add eks https://aws.github.io/eks-charts
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=demo \
  --set serviceAccount.name=aws-load-balancer-controller

# Ingress example
kubectl apply -f - <<'EOF'
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ai-bankapp
  annotations:
    kubernetes.io/ingress.class: alb
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/listen-ports: '[{"HTTP": 80}]'
spec:
  rules:
    - http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: ai-bankapp
                port: { number: 80 }
EOF
```

## 💾 Storage (Day 85)

```bash
# EBS CSI driver (gp3 by default)
helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver/
helm install aws-ebs-csi-driver aws-ebs-csi-driver/aws-ebs-csi-driver -n kube-system

kubectl get sc                     # gp2/gp3/efs classes
kubectl apply -f pvc.yaml          # then reference in a pod/deployment
```

- **EBS** = block storage, single-AZ, for databases (mongo, postgres).
- **EFS** = shared file storage, multi-AZ, for shared volumes.

## 📈 Scaling (Day 86)

```yaml
# Horizontal Pod Autoscaler
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata: { name: ai-bankapp-hpa }
spec:
  scaleTargetRef: { apiVersion: apps/v1, kind: Deployment, name: ai-bankapp }
  minReplicas: 2
  maxReplicas: 10
  metrics:
    - type: Resource
      resource: { name: cpu, target: { type: Utilization, averageUtilization: 60 } }
```

```bash
# Cluster Autoscaler (scale NODES)
helm install cluster-autoscaler autoscaler/cluster-autoscaler \
  --namespace kube-system --set autoDiscovery.clusterName=demo \
  --set awsRegion=us-east-1
```

## 🔍 Troubleshooting

```bash
kubectl describe pod <pod>                 # events
kubectl logs -f deploy/<app> --all-containers
kubectl get events --sort-by=.lastTimestamp
eksctl get nodegroup --cluster demo        # node group health
aws eks describe-cluster --name demo       # control plane status
```

## 🧠 Key Facts

- EKS control plane is **fully managed & HA** (3 AZs) — you never see the masters.
- Pods use the **VPC CNI** — each pod gets a real VPC IP (fast, no NAT).
- **IRSA** (IAM Roles for Service Accounts) via OIDC = fine-grained pod permissions.
- Use **eksctl** for fast demos, **Terraform** for production/Infrastructure-as-Code.
- EKS supports **EKS Auto Mode / Fargate** for serverless pods.
- ALB = Layer 7 (HTTP/HTTPS paths, host rules); NLB = Layer 4 (TCP/UDP, raw IPs).
- Always pin the **EKS add-on versions** and keep `aws-iam-authenticator` updated.
