# 🧪 Lab Session: Day 85 — Expose & Persist on EKS

**Jagu:** "Beep Boop! Golu, today we make the cluster useful: traffic IN (Service types + ALB) and data SAFE (EBS PVC). Let's wire it up! 🌐"

## 🎯 Task Objectives
- Deploy a demo app and expose it with ClusterIP → NodePort → LoadBalancer.
- Install the AWS Load Balancer Controller (IRSA-based).
- Create an ALB Ingress and confirm the ALB DNS.
- Create an EBS-backed PVC and verify it binds.

## 🛠️ Hands-on Challenges

> ⚠️ Reuse your **Day 84** cluster (`aws eks update-kubeconfig ...`). If you destroyed it, recreate it quickly with `eksctl`:
> `eksctl create cluster --name demo --region us-east-1 --nodegroup-name workers --node-type t3.medium --nodes 2 --managed`

1. **Deploy a demo app:**
   ```bash
   kubectl create deploy nginx --image nginx
   kubectl scale deploy nginx --replicas=3
   kubectl get pods -o wide
   ```

2. **Walk through Service types:**
   ```bash
   kubectl expose deploy nginx --port 80          # ClusterIP
   kubectl get svc nginx                          # CLUSTER-IP
   kubectl delete svc nginx
   kubectl expose deploy nginx --port 80 --type=NodePort
   kubectl get svc nginx                          # note the NodePort (3xxxx)
   kubectl delete svc nginx
   kubectl expose deploy nginx --port 80 --type=LoadBalancer
   kubectl get svc nginx -w                       # wait for EXTERNAL-IP (NLB)
   ```

3. **Test from outside:**
   ```bash
   curl http://&lt;EXTERNAL-IP&gt;
   # nginx welcome page should load
   ```

4. **ALB Ingress (bonus, if time permits):**
   ```bash
   # Ensure OIDC + IRSA (Day 84), attach the AWSLoadBalancerControllerIAMPolicy
   # to a kube-system service account (see the lesson), then:
   helm repo add eks https://aws.github.io/eks-charts
   helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
     -n kube-system --set clusterName=&lt;cluster&gt; \
     --set serviceAccount.name=aws-load-balancer-controller
   kubectl apply -f ingress.yaml   # ALB Ingress from the lesson
   kubectl get ingress -w          # note ADDRESS (the ALB DNS)
   ```

5. **EBS-backed PVC:**
   ```bash
   kubectl apply -f - <<'EOF'
   apiVersion: v1
   kind: PersistentVolumeClaim
   metadata: { name: test-ebs }
   spec:
     accessModes: [ "ReadWriteOnce" ]
     resources: { requests: { storage: 1Gi } }
   EOF
   kubectl get pvc test-ebs     # should go Pending → Bound
   kubectl get pv               # AWS created an EBS volume (gp2/gp3)
   ```

6. **Cleanup (no surprises on the bill!):**
   ```bash
   kubectl delete pvc test-ebs
   kubectl delete deploy nginx svc nginx
   # and destroy the cluster if done: eksctl delete cluster --name demo --region us-east-1
   ```

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste `kubectl get svc` showing the LoadBalancer with its EXTERNAL-IP.
3. Paste the output of `curl http://<EXTERNAL-IP>` (the nginx welcome page HTML).
4. Paste `kubectl get pvc` showing `Bound`, and `kubectl get pv` showing the EBS volume.
5. (Bonus) Paste `kubectl get ingress` with the ALB ADDRESS.
6. Commit and push!

---

*#LearnDevOpsIn90Days • Day 85 • Golu & Jagu Edition*
