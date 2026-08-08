# 🏦 Day 86 — Solution: Deploy AI-BankApp on EKS

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 1. AI-BankApp Deployed

```bash
kubectl create ns ai-bank
kubectl apply -f namespace.yaml -f deployment.yaml -f service.yaml
kubectl get pods -n ai-bank
```

**Expected Output:**
```
NAME                         READY   STATUS    RESTARTS   AGE
ai-bankapp-6f8c8b6b4f-aaaaa  1/1     Running   0          3m
ai-bankapp-6f8c8b6b4f-bbbbb  1/1     Running   0          3m
```

---

## ✅ 2. Readiness Probes Working

```bash
kubectl get pods -n ai-bank
```

All pods show `1/1 Running` — the readiness probe passed (`/health` returned 200).

---

## ✅ 3. HPA Created

```bash
kubectl apply -f hpa.yaml
kubectl get hpa -n ai-bank
```

**Expected Output:**
```
NAME              REFERENCE              TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
ai-bankapp-hpa    Deployment/ai-bankapp   2%/60%    2         10        2          1m
```

---

## ✅ 4. Load Test — HPA Scaled Up! 🎉

```bash
kubectl get hpa -n ai-bank -w
```

**Expected Output (watched):**
```
NAME              REFERENCE              TARGETS    MINPODS   MAXPODS   REPLICAS   AGE
ai-bankapp-hpa    Deployment/ai-bankapp  79%/60%    2         10        2          2m
ai-bankapp-hpa    Deployment/ai-bankapp  85%/60%    2         10        4          3m
ai-bankapp-hpa    Deployment/ai-bankapp  64%/60%    2         10        6          4m
```

*(REPLICAS climbed 2 → 4 → 6 as CPU crossed the 60% target!)*

---

## ✅ 5. Scaled Back Down After Load Test

```bash
kubectl get hpa -n ai-bank -w
```

**Expected Output (after Ctrl+C):**
```
ai-bankapp-hpa    Deployment/ai-bankapp  3%/60%   2   10   2   8m
```

---

## ✅ 6. Zero-Downtime Rollout

```bash
kubectl set image deploy/ai-bankapp app=aryashreep/ai-bankapp:1.5.0 -n ai-bank
kubectl rollout status deploy/ai-bankapp -n ai-bank
```

**Expected Output:**
```
deployment "ai-bankapp" successfully rolled out
```

```bash
kubectl rollout history deploy/ai-bankapp -n ai-bank
```

**Expected Output:**
```
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
```

---

## ✅ 7. Rollback Drill

```bash
kubectl rollout undo deploy/ai-bankapp -n ai-bank
kubectl rollout status deploy/ai-bankapp -n ai-bank
# deployment "ai-bankapp" successfully rolled out (back to rev 1)
```

---

## ✅ 8. Cleanup

```bash
kubectl delete ns ai-bank
# namespace "ai-bank" deleted
```

---

## ✅ Lessons Learned

- **Namespace** = environment isolation on a shared cluster.
- **HPA** scales pods on CPU; pair it with **Cluster Autoscaler** for node-level elasticity.
- **Readiness probes** gate traffic; **rolling updates** replace pods gradually → zero downtime.
- `kubectl rollout undo` = instant rollback to a known-good revision.
- Secrets belong in **AWS Secrets Manager** (via IRSA/External Secrets) — never in Git.
- **ALB + ACM** handles TLS termination for free.
- **Module 15 complete!** You ran a production Kubernetes platform on AWS. 🏆

---

*#LearnDevOpsIn90Days • Day 86 • Golu & Jagu Edition*
