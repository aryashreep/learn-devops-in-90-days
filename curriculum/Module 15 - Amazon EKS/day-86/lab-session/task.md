# 🧪 Lab Session: Day 86 — Project: Deploy AI-BankApp on EKS

**Jagu:** "Beep Boop! This is the capstone, Golu — deploy AI-BankApp the production way: namespace, deployment with probes, HPA, and a load test that proves it scales. GO! 🏦"

## 🎯 Task Objectives
- Create an `ai-bank` namespace and deploy AI-BankApp (Deployment + Service).
- Attach a HorizontalPodAutoscaler (2–10 replicas).
- Run a load test and WATCH the HPA scale replicas up.
- Perform a zero-downtime image rollout with `kubectl rollout`.
- (Bonus) Add an ALB Ingress if time permits.

## 🛠️ Hands-on Challenges

> ⚠️ Reuse your **Day 84/85** cluster. Everything below is `kubectl` — no console needed.

1. **Namespace + deployment (use the manifests from the lesson):**
   ```bash
   kubectl create ns ai-bank
   kubectl apply -f namespace.yaml -f deployment.yaml -f service.yaml
   kubectl get deploy,svc,pods -n ai-bank
   ```

2. **Verify health probes work:**
   ```bash
   kubectl get pods -n ai-bank -o wide
   kubectl describe pod <pod-name> -n ai-bank | grep -A 2 Readiness
   # All pods should show Ready 1/1
   ```

3. **Add the HPA:**
   ```bash
   kubectl apply -f hpa.yaml
   kubectl get hpa -n ai-bank
   ```

4. **Load test — watch it scale (2 terminals):**
   ```bash
   # Terminal 1: watch the HPA
   kubectl get hpa -n ai-bank -w
   # Terminal 2: hammer the service
   kubectl run loadgen --image=busybox --rm -it -- sh -c \
     "while true; do wget -q -O- http://ai-bankapp.ai-bank.svc; done"
   ```
   Wait for `REPLICAS` to climb past 2 (CPU target = 60%).

5. **Stop the load test (Ctrl+C) and watch it scale down:**
   ```bash
   kubectl get hpa -n ai-bank -w
   ```

6. **Zero-downtime rollout:**
   ```bash
   kubectl set image deploy/ai-bankapp app=aryashreep/ai-bankapp:1.5.0 -n ai-bank
   kubectl rollout status deploy/ai-bankapp -n ai-bank
   kubectl rollout history deploy/ai-bankapp -n ai-bank
   ```

7. **Rollback drill (the superpower!):**
   ```bash
   kubectl rollout undo deploy/ai-bankapp -n ai-bank
   kubectl rollout status deploy/ai-bankapp -n ai-bank
   ```

8. **Cleanup:**
   ```bash
   kubectl delete ns ai-bank
   # and destroy the cluster if done: eksctl delete cluster --name demo --region us-east-1
   ```

---

### ✅ Proof of Work
**Jagu:** "Golu, upload your solution to show your mastery!"

1. Create a file named **`solution.md`** in the **`solution/`** folder.
2. Paste `kubectl get pods -n ai-bank` showing all pods `1/1 Running`.
3. Paste the HPA output showing `REPLICAS` **above 2** during the load test.
4. Paste `kubectl rollout status` showing "successfully rolled out".
5. Paste `kubectl rollout history` showing at least 2 revisions.
6. Commit and push!

---

*#LearnDevOpsIn90Days • Day 86 • Golu & Jagu Edition*
