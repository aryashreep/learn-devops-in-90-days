# ☁️ DevOps, Cloud & SRE — Command & Concept Cheatsheet

> **Quick reference for DevOps culture, cloud computing models, SRE principles, and essential tools.**
>
> *Print-friendly — designed for Cmd+P / PDF export.*

---

## 📋 What is DevOps?

| Concept | Description |
|---------|-------------|
| **DevOps** | Cultural & technical movement to break down silos between Dev and Ops teams |
| **CALMS** | Culture, Automation, Lean, Measurement, Sharing — the 5 pillars |
| **Continuous Integration** | Merge code frequently, build + test automatically on every push |
| **Continuous Delivery** | Code is always in a deployable state; deploy to staging automatically |
| **Continuous Deployment** | Every change that passes all stages goes to production automatically |
| **Infrastructure as Code** | Manage servers/configs via code (Terraform, Ansible, CloudFormation) |
| **Monitoring & Observability** | Collect metrics, logs, and traces to understand system behavior |

### DevOps Feedback Loop

```text
PLAN ──▶ CODE ──▶ BUILD ──▶ TEST ──▶ RELEASE ──▶ DEPLOY ──▶ OPERATE ──▶ MONITOR
  ▲                                                                           │
  └─────────────────────────────── FEEDBACK ──────────────────────────────────┘
```

---

## ☁️ Cloud Computing Models

### Service Models

| Model | What You Manage | Examples |
|-------|----------------|----------|
| **IaaS** | Apps, data, runtime, middleware, OS | AWS EC2, GCP Compute, Azure VM |
| **PaaS** | Just your apps and data | Heroku, AWS Elastic Beanstalk, Vercel |
| **SaaS** | Just your data in the app | Gmail, Slack, GitHub, Jira |
| **FaaS** | Just your functions (serverless) | AWS Lambda, GCP Cloud Functions |

### Deployment Models

| Model | Description |
|-------|-------------|
| **Public Cloud** | Shared infrastructure over the internet (AWS, Azure, GCP) |
| **Private Cloud** | Dedicated infrastructure for one organization |
| **Hybrid Cloud** | Mix of public + private with orchestration between them |
| **Multi-Cloud** | Using multiple public cloud providers simultaneously |

### Major Cloud Providers

| Provider | Compute | Containers | Serverless | Storage |
|----------|---------|------------|------------|---------|
| **AWS** | EC2 | ECS / EKS | Lambda | S3 |
| **Azure** | VM | AKS | Functions | Blob |
| **GCP** | Compute Engine | GKE | Cloud Functions | Cloud Storage |

### Cloud Key Concepts

```text
# Compute
EC2 / VM          → Virtual machines in the cloud
Auto Scaling      → Automatically adjust capacity based on demand
Load Balancer     → Distribute traffic across multiple instances

# Storage
Object Storage    → S3 / Blob / Cloud Storage (unlimited, cheap)
Block Storage     → EBS / Disk (fast, attached to VMs)
Database          → RDS / Cloud SQL / DynamoDB / CosmosDB

# Networking
VPC               → Virtual Private Cloud (isolated network)
Subnet            → Network segment within a VPC
Security Group    → Firewall rules for instances
CDN               → Content Delivery Network (CloudFront, Cloudflare)
```

---

## 🏢 SRE — Site Reliability Engineering

| Principle | Description | DevOps Equivalent |
|-----------|-------------|-------------------|
| **SLI** | Service Level Indicator — a measured metric (latency, error rate) | Monitoring data |
| **SLO** | Service Level Objective — target value for an SLI (e.g., 99.9% uptime) | Quality gate |
| **SLA** | Service Level Agreement — contractual commitment to customer | Legal agreement |
| **Error Budget** | (100% — SLO) = allowed downtime before breaching SLA | Risk tolerance |
| **Toil** | Manual, repetitive, automatable operational work | Automation target |
| **Blameless Postmortems** | Incident review focused on process, not people | Learning culture |

### SRE Formula

```text
Error Budget = 100% - SLO %

Example:
  SLO = 99.9%  → Error Budget = 0.1% = 8.76 hours / year
  SLO = 99.99% → Error Budget = 0.01% = 52.56 minutes / year
```

### The Four Golden Signals (Google)

| Signal | Description | Example |
|--------|-------------|---------|
| **Latency** | Time to service a request | p99 < 200ms |
| **Traffic** | Demand on the system | 10,000 req/s |
| **Errors** | Rate of failed requests | < 0.1% 5xx |
| **Saturation** | How "full" the service is | CPU < 80%, Memory < 75% |

---

## 🛠️ Essential Tools by Category

| Category | Tools | Purpose |
|----------|-------|---------|
| **Version Control** | Git, GitHub, GitLab, Bitbucket | Source code management |
| **CI/CD** | GitHub Actions, GitLab CI, Jenkins, CircleCI | Build, test, deploy pipelines |
| **Configuration Mgmt** | Ansible, Puppet, Chef, SaltStack | Automate server configuration |
| **Infrastructure as Code** | Terraform, CloudFormation, Pulumi | Provision cloud resources |
| **Containers** | Docker, Podman, containerd | Application packaging |
| **Orchestration** | Kubernetes, Docker Swarm, Nomad | Container scheduling & management |
| **Monitoring** | Prometheus, Grafana, Datadog, New Relic | Metrics collection & visualization |
| **Logging** | ELK Stack, Loki, Splunk | Centralized log management |
| **Secret Management** | HashiCorp Vault, AWS Secrets Manager, SOPS | Store & rotate secrets |
| **Service Mesh** | Istio, Linkerd, Consul | Microservice networking layer |

---

## 📝 Quick Reference — CLI

```bash
# SSH into a server
ssh -i ~/.ssh/key.pem user@hostname

# Check system resources
top / htop                        # CPU & memory
df -h                             # Disk space
free -m                           # Memory
uptime                            # System load

# Check cloud metadata (AWS)
curl http://169.254.169.254/latest/meta-data/

# Infrastructure as Code pattern
terraform init                    # Initialize providers
terraform plan                    # Preview changes
terraform apply                   # Apply infrastructure changes
ansible-playbook playbook.yml     # Run configuration playbook
```

---

## 🔐 Security Basics

| Concept | Description | Tool/Command |
|---------|-------------|-------------|
| **IAM** | Identity & Access Management | AWS IAM, GCP IAM |
| **Least Privilege** | Minimum permissions needed | Policy documents |
| **Encryption at Rest** | Data encrypted on disk | KMS, AES-256 |
| **Encryption in Transit** | Data encrypted over network | TLS 1.3 |
| **Secrets Rotation** | Regularly change keys/tokens | Vault, Secrets Manager |
| **Immutable Infrastructure** | Never modify servers — replace them | Packer, AMIs |

---

> *☁️ DevOps, Cloud & SRE Cheatsheet — #LearnDevOpsIn90Days • Module 01*
>
> *Maintainer: [Aryashree Pritikrishna](https://github.com/aryashreep)*
