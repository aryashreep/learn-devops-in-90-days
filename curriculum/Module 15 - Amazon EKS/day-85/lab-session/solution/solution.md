# 🌐 Day 85 — Solution: Expose & Persist on EKS

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 1. Demo App Deployed

```bash
kubectl create deploy nginx --image nginx
kubectl scale deploy nginx --replicas=3
kubectl get pods -o wide
```

**Expected Output (partial):**
```
NAME                     READY   STATUS    RESTARTS   AGE   IP           NODE
nginx-7c79c4b897-aaaaa   1/1     Running   0          2m    10.0.1.30    ip-10-0-1-12...
nginx-7c79c4b897-bbbbb   1/1     Running   0          2m    10.0.2.40    ip-10-0-2-45...
nginx-7c79c4b897-ccccc   1/1     Running   0          2m    10.0.2.41    ip-10-0-2-45...
```

*(Note the real VPC IPs from the VPC CNI!)*

---

## ✅ 2. Service Types Walkthrough

```bash
kubectl expose deploy nginx --port 80
kubectl get svc nginx          # ClusterIP
kubectl delete svc nginx
kubectl expose deploy nginx --port 80 --type=NodePort
kubectl get svc nginx          # NodePort 3xxxx
kubectl delete svc nginx
kubectl expose deploy nginx --port 80 --type=LoadBalancer
kubectl get svc nginx -w
```

**Expected Output (LoadBalancer):**
```
NAME    TYPE           CLUSTER-IP      EXTERNAL-IP                                 PORT(S)        AGE
nginx   LoadBalancer   a1234b567890c   k8s-default-nginx-abc123-1234567890.us-east-1.elb.amazonaws.com   80:31234/TCP   1m
```

---

## ✅ 3. External Access Verified

```bash
curl http://k8s-default-nginx-abc123-1234567890.us-east-1.elb.amazonaws.com
```

**Expected Output (partial):**
```html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
...
```

---

## ✅ 4. (Bonus) ALB Ingress

```bash
kubectl get ingress -w
```

**Expected Output:**
```
NAME         CLASS    HOSTS   ADDRESS                                                        PORTS   AGE
ai-bankapp   <none>   *       k8s-aibankap-aibankap-xxxx-1234567890.us-east-1.elb.amazonaws.com   80      2m
```

---

## ✅ 5. EBS PVC Bound

```bash
kubectl apply -f pvc.yaml
kubectl get pvc test-ebs
kubectl get pv
```

**Expected Output:**
```
NAME       STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
test-ebs   Bound    pvc-12345678-90ab-cdef-1234-567890abcdef   1Gi        RWO            gp2            1m
```

*(A real EBS volume now exists in your AWS account, created by the CSI driver.)*

---

## ✅ 6. Cleanup

```bash
kubectl delete pvc test-ebs     # volume deleted
kubectl delete deploy nginx svc nginx
# optional: eksctl delete cluster --name demo --region us-east-1
```

---

## ✅ Lessons Learned

- **VPC CNI** gives pods real VPC IPs — traffic never leaves the VPC network.
- Service ladder: **ClusterIP → NodePort → LoadBalancer (NLB)** for progressively wider reach.
- **ALB Ingress** (via the AWS Load Balancer Controller) = Layer 7 routing.
- **PVCs** request storage by size; the **EBS CSI driver** provisions the real volume.
- **EBS = single-AZ block** (databases), **EFS = multi-AZ shared** (files).
- Delete cloud resources after labs — ALBs and volumes are billable! 🌐
- Next: the AI-BankApp project on EKS! 🏗️

---

*#LearnDevOpsIn90Days • Day 85 • Golu & Jagu Edition*
