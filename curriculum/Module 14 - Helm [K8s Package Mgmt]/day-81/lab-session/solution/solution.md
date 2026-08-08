# 🧪 Day 81 — Solution: First Helm Release

**Student:** [Your Name]
**Date:** [Date]

---

## ✅ 1. Helm Installed

```bash
helm version
```

**Expected Output:**
```
version.BuildInfo{Version:"v3.15.x", GitCommit:"...", GitTreeState:"clean", GoVersion:"go1.22.x"}
```

---

## ✅ 2. Repository Added

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm search repo nginx
```

**Expected Output (partial):**
```
NAME                    CHART VERSION   APP VERSION   DESCRIPTION
bitnami/nginx           18.x.x          1.25.x        NGINX Open Source is a ...
bitnami/nginx-ingress-controller ...
```

---

## ✅ 3. Release Installed

```bash
helm install my-nginx bitnami/nginx
helm list
```

**Expected Output:**
```
NAME      NAMESPACE  REVISION  UPDATED   STATUS    CHART       APP VERSION
my-nginx  default    1         2026-...  deployed  nginx-18.x  1.25.x
```

```bash
kubectl get all
```

**Expected Output (partial):**
```
NAME                            READY   STATUS    RESTARTS   AGE
pod/my-nginx-6f8c8b6b4f-abc12   1/1     Running   0          2m

NAME               TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
service/my-nginx   ClusterIP   10.96.160.45    <none>        80/TCP    2m

NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/my-nginx   1/1     1            1           2m
```

---

## ✅ 4. Upgrade & History

```bash
helm upgrade my-nginx bitnami/nginx --set service.type=NodePort
helm history my-nginx
```

**Expected Output:**
```
REVISION  UPDATED                   STATUS     CHART       APP VERSION  DESCRIPTION
1         2026-08-08 10:00:00 ...    superseded nginx-18.x  1.25.x       Install complete
2         2026-08-08 10:05:00 ...    deployed   nginx-18.x  1.25.x       Upgrade complete
```

Service type changed from `ClusterIP` → `NodePort`.

---

## ✅ 5. Rollback

```bash
helm rollback my-nginx 1
helm history my-nginx
```

**Expected Output (now 3 revisions):**
```
REVISION  UPDATED                   STATUS      CHART       APP VERSION  DESCRIPTION
1         ...                       superseded  nginx-18.x  1.25.x       Install complete
2         ...                       superseded  nginx-18.x  1.25.x       Upgrade complete
3         ...                       deployed    nginx-18.x  1.25.x       Rollback to 1
```

---

## ✅ 6. Cleanup

```bash
helm uninstall my-nginx
# release "my-nginx" uninstalled
helm list   # empty
```

---

## ✅ Lessons Learned

- Helm v3 is **client-only** — no server component needed.
- A **chart** packages an entire app; an **install** creates a versioned **release**.
- `helm upgrade` creates a new revision; `helm rollback <release> <rev>` reverts instantly.
- `helm list -A` shows releases across all namespaces.
- Bitnami charts are a safe starting point for real-world apps.
- Tomorrow we'll build a custom chart from scratch! 🏷️

---

*#LearnDevOpsIn90Days • Day 81 • Golu & Jagu Edition*
