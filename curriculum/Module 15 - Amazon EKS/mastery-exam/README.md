# 🏆 Module 15 Mastery Exam: Amazon EKS

Welcome to the **Amazon EKS Mastery Exam**! This assessment tests your knowledge of EKS fundamentals, provisioning with Terraform, IAM & IRSA, networking (VPC CNI, Services, ALB), storage (EBS/EFS), autoscaling, secrets, and production deployment of the AI-BankApp.

---

## 📝 Part 1: EKS Fundamentals

**1. What is Amazon EKS?**
- A) A CI/CD pipeline service
- B) A managed Kubernetes service on AWS
- C) An EC2 instance type
- D) A serverless database
- **Ans: B**

**2. Who manages the Kubernetes control plane in EKS?**
- A) AWS
- B) You
- C) Your on-prem team
- D) HashiCorp
- **Ans: A**

**3. Which of the following is NOT true about EKS?**
- A) It is certified Kubernetes
- B) AWS patches the master nodes
- C) You must SSH into master nodes to fix etcd
- D) It integrates with IAM
- **Ans: C**

**4. The EKS control plane runs HA across how many availability zones?**
- A) 1
- B) 2
- C) 5
- D) 3
- **Ans: D**

**5. What is a Fargate profile on EKS?**
- A) A way to run pods without managing EC2 nodes
- B) A node group of GPU instances
- C) A load balancer type
- D) A storage class
- **Ans: A**

**6. Which tool is the production-grade choice for provisioning EKS as Infrastructure-as-Code?**
- A) Docker Compose
- B) Terraform
- C) kubectl
- D) Helm
- **Ans: B**

**7. What is eksctl mainly used for?**
- A) Deploying Helm charts
- B) Building container images
- C) Quickly creating and managing EKS clusters
- D) Monitoring clusters
- **Ans: C**

**8. Which command connects your kubectl to an EKS cluster?**
- A) `aws eks update-kubeconfig`
- B) `kubectl connect eks`
- C) `eksctl connect`
- D) `aws eks login`
- **Ans: A**

---

## 📝 Part 2: Provisioning & IAM

**9. What does IRSA (IAM Roles for Service Accounts) rely on?**
- A) Static IAM access keys in pods
- B) VPN tunnels
- C) AWS CLI on every node
- D) OIDC federation between the cluster and IAM
- **Ans: D**

**10. Where do EKS worker nodes (node groups) run?**
- A) Inside the AWS-managed control plane VPC
- B) Inside subnets in your own VPC
- C) On-premises
- D) In a separate AWS account you don't own
- **Ans: B**

**11. What is a managed node group?**
- A) An EC2 Auto Scaling group that EKS manages for you
- B) A Fargate pod
- C) A cluster of on-prem servers
- D) A Terraform state file
- **Ans: A**

**12. Where is the Kubernetes cluster state (etcd) stored in EKS?**
- A) On your node groups
- B) In an S3 bucket you manage
- C) Inside the AWS-managed control plane
- D) On your laptop
- **Ans: C**

**13. What does the AWS VPC CNI give every pod?**
- A) A private NAT IP
- B) A real IP address from your VPC subnet
- C) A Kubernetes ClusterIP
- D) A public Elastic IP
- **Ans: B**

**14. Which Service type is the Kubernetes default?**
- A) LoadBalancer
- B) NodePort
- C) ExternalName
- D) ClusterIP
- **Ans: D**

---

## 📝 Part 3: Networking

**15. Which Service type provisions a load balancer with an AWS DNS name?**
- A) LoadBalancer
- B) ClusterIP
- C) NodePort
- D) ExternalName
- **Ans: A**

**16. What does the AWS Load Balancer Controller provision from an Ingress resource?**
- A) A CloudFront distribution
- B) A Route53 record
- C) An Application Load Balancer (ALB)
- D) An API Gateway
- **Ans: C**

**17. An ALB (Application Load Balancer) routes traffic at which layer?**
- A) Layer 2
- B) Layer 7
- C) Layer 4
- D) Layer 1
- **Ans: B**

**18. Which Service type exposes pods on every node's IP:port?**
- A) LoadBalancer
- B) ClusterIP
- C) ExternalName
- D) NodePort
- **Ans: D**

**19. Which annotation on an Ingress enables HTTPS with an ACM certificate?**
- A) `alb.ingress.kubernetes.io/certificate-arn`
- B) `nginx.ingress.kubernetes.io/ssl`
- C) `cert-manager.io/cluster-issuer`
- D) `kubernetes.io/tls-secret`
- **Ans: A**

**20. How does an ALB terminate TLS in the EKS pattern we learned?**
- A) Each pod runs an nginx with a self-signed cert
- B) The Service encrypts traffic end-to-end
- C) The ALB terminates TLS; pods stay plain HTTP internally
- D) TLS is not supported on EKS
- **Ans: C**

---

## 📝 Part 4: Storage

**21. EBS is best suited for which workload?**
- A) Shared files across many pods
- B) A database needing low-latency block storage in one AZ
- C) Static website hosting
- D) Ephemeral logs
- **Ans: B**

**22. Which storage is shared file storage that many pods can mount across AZs?**
- A) EBS
- B) Instance Store
- C) S3 Glacier
- D) EFS
- **Ans: D**

**23. Which object requests storage BY SIZE rather than a specific volume?**
- A) StorageClass
- B) PersistentVolumeClaim
- C) PersistentVolume
- D) Node
- **Ans: B**

**24. Which controller/provisioner creates the real EBS volume for a PVC?**
- A) AWS Load Balancer Controller
- B) Cluster Autoscaler
- C) The EBS CSI driver
- D) The VPC CNI
- **Ans: C**

**25. A PVC with accessMode ReadWriteOnce can be mounted by...**
- A) Many pods on many nodes simultaneously
- B) A single node at a time
- C) Any pod in any AZ
- D) Only the kube-system namespace
- **Ans: B**

---

## 📝 Part 5: Operations & The AI-BankApp Project

**26. What does a HorizontalPodAutoscaler (HPA) scale?**
- A) The number of pod replicas
- B) The number of EC2 nodes
- C) The size of EBS volumes
- D) The number of ALBs
- **Ans: A**

**27. What does the Cluster Autoscaler scale?**
- A) Pod replicas
- B) Database connections
- C) The number of EC2 nodes in node groups
- D) Ingress rules
- **Ans: C**

**28. Which probe ensures Kubernetes only sends traffic to a pod that is ready?**
- A) livenessProbe
- B) startupProbe
- C) tcpSocketProbe
- D) readinessProbe
- **Ans: D**

**29. Where should database credentials live on a production EKS platform?**
- A) AWS Secrets Manager, injected via IRSA/External Secrets
- B) In a ConfigMap
- C) In the Git repository
- D) In the container image
- **Ans: A**

**30. Which command rolls back a Deployment to a previous revision?**
- A) `kubectl revert`
- B) `kubectl delete`
- C) `kubectl rollout undo`
- D) `kubectl scale --rollback`
- **Ans: C**

---

## 🏆 Scoring

| Score | Verdict |
|---|---|
| 27–30 | 🥇 EKS Master — production-ready platform builder! |
| 21–26 | 🥈 Solid — review Networking & Storage (Day 85) |
| 15–20 | 🥉 Getting there — redo Days 84–85 |
| 0–14 | 🔁 Restart the module with Golu & Jagu! |

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 15: Amazon EKS*
