# 🏆 Module 10 Mastery Exam: Kubernetes

Welcome to the **Mastery Exam** for Module 10! Test your knowledge on Kubernetes architecture, Control Plane vs Worker Nodes, Pod lifecycles, Deployments, Services, ConfigMaps, Secrets, persistent storage (PV/PVC), scheduling (Affinity/Taints), HPA scaling, Helm package management, and Capstone deployments.

---

### 📝 30 Multiple Choice Questions

#### ☸️ Day 1: Architecture & Core Workloads (1-15)

1. **Which component acts as the main entry point for the Kubernetes API?**
   - A) kubelet
   - B) kube-scheduler
   - C) etcd
   - D) kube-apiserver
   - **Answer:** D

2. **Where is the state of the Kubernetes cluster persisted?**
   - A) kube-controller-manager
   - B) etcd
   - C) kube-proxy
   - D) containerd
   - **Answer:** B

3. **What is the primary role of the kube-scheduler?**
   - A) To monitor container CPU utilization
   - B) To assign Pods to healthy Worker Nodes based on resource constraints
   - C) To restart crashed containers
   - D) To configure iptables rules
   - **Answer:** B

4. **Which agent runs on worker nodes to monitor container state and talk to the API server?**
   - A) kube-proxy
   - B) etcd
   - C) kubelet
   - D) containerd
   - **Answer:** C

5. **What is the smallest deployable unit of execution in Kubernetes?**
   - A) Container
   - B) Service
   - C) Pod
   - D) Deployment
   - **Answer:** C

6. **How do multiple containers inside the same Pod share networking resources?**
   - A) They communicate over separate network interfaces
   - B) They communicate via localhost ports
   - C) They must use external load balancers
   - D) They cannot share networking resources
   - **Answer:** B

7. **What is the default namespace where K8s objects are scheduled if none is specified?**
   - A) kube-system
   - B) kube-public
   - C) default
   - D) home
   - **Answer:** C

8. **Which K8s resource manages ReplicaSets and automates rolling updates for stateless applications?**
   - A) DaemonSet
   - B) StatefulSet
   - C) Job
   - D) Deployment
   - **Answer:** D

9. **If a bare "naked" Pod crashes, what happens?**
   - A) Kubelet restarts it automatically on another node
   - B) The Deployment controller recreates it
   - C) The Pod is gone forever and is not rescheduled
   - D) Kube-scheduler waits 5 minutes before restarting it
   - **Answer:** C

10. **Which command rolls back a deployment to its previous stable revision?**
    - A) kubectl rollback deployment
    - B) kubectl rollout undo deployment
    - C) kubectl delete deployment
    - D) kubectl apply deployment
    - **Answer:** B

11. **What is the default Service type in Kubernetes?**
    - A) NodePort
    - B) LoadBalancer
    - C) ClusterIP
    - D) ExternalName
    - **Answer:** C

12. **Which component provides internal DNS resolution inside a Kubernetes cluster?**
    - A) CoreDNS
    - B) kube-proxy
    - C) etcd
    - D) containerd
    - **Answer:** A

13. **How does the Gateway API differ from legacy Ingress?**
    - A) It is slower and less secure
    - B) It splits routing and load balancing into separate role-oriented resources (Gateway, HTTPRoute)
    - C) It is hosted outside the cluster only
    - D) It only supports TCP traffic
    - **Answer:** B

14. **How are values stored inside a standard Kubernetes Secret manifest?**
    - A) Encrypted using AES-256
    - B) Base64 encoded
    - C) Rotated automatically by etcd
    - D) Clear-text plaintext
    - **Answer:** B

15. **What happens to the environment variables inside a running Pod if you modify a mapped ConfigMap?**
    - A) They update instantly and live
    - B) They are deleted
    - C) They only update after a Pod restart/recreation
    - D) The Pod crashes immediately
    - **Answer:** C

---

#### 🚀 Day 2: Storage, Scheduling, Scaling & Helm (16-30)

16. **Which resource represents a developer's request for persistent storage in a cluster?**
    - A) PersistentVolume (PV)
    - B) StorageClass
    - C) PersistentVolumeClaim (PVC)
    - D) ConfigMap
    - **Answer:** C

17. **Which reclaim policy ensures the Persistent Volume remains in the cluster after the PVC is deleted?**
    - A) Delete
    - B) Recycle
    - C) Retain
    - D) Archive
    - **Answer:** C

18. **What is the advantage of using a StorageClass in Kubernetes?**
    - A) It encrypts database configurations
    - B) It enables dynamic provisioning of physical disks on-demand
    - C) It speeds up pod scheduling
    - D) It monitors log directories
    - **Answer:** B

19. **Which controller is best suited for running stateful databases requiring sticky identities?**
    - A) Deployment
    - B) DaemonSet
    - C) StatefulSet
    - D) Job
    - **Answer:** C

20. **Which controller ensures a copy of a specific Pod runs on every single worker node?**
    - A) ReplicaSet
    - B) StatefulSet
    - C) Job
    - D) DaemonSet
    - **Answer:** D

21. **When does a Job controller terminate its execution?**
    - A) When the schedule time is met
    - B) Once its task runs to successful completion
    - C) It runs indefinitely
    - D) When the node goes offline
    - **Answer:** B

22. **What probe does Kubelet use to verify if a container needs to be restarted due to a deadlock?**
    - A) Readiness Probe
    - B) Liveness Probe
    - C) Startup Probe
    - D) Healthy Probe
    - **Answer:** B

23. **Which probe temporarily removes a Pod from Service endpoints if it fails?**
    - A) Liveness Probe
    - B) Startup Probe
    - C) Readiness Probe
    - D) Eviction Probe
    - **Answer:** C

24. **A Pod is terminated with Exit Code 137. What does this mean?**
    - A) It was throttled due to CPU limits
    - B) It was OOMKilled (Out Of Memory) for exceeding its memory limit
    - C) It exited successfully
    - D) It had a network timeout
    - **Answer:** B

25. **Which QoS class does a Pod receive if its container requests 100m CPU and has limits.cpu set to 200m?**
    - A) Guaranteed
    - B) Burstable
    - C) BestEffort
    - D) Priority
    - **Answer:** B

26. **What is required to make a Horizontal Pod Autoscaler (HPA) function?**
    - A) Legacy Ingress controller
    - B) Persistent Volume claims
    - C) Metrics Server active in the cluster and resource requests defined
    - D) A service mesh
    - **Answer:** C

27. **What is applied to Nodes to repel Pods unless the Pod has a matching VIP pass?**
    - A) Labels
    - B) Taints
    - C) Tolerations
    - D) Selectors
    - **Answer:** B

28. **How do you define a soft preference for scheduling Pods on nodes with SSDs?**
    - A) requiredDuringSchedulingIgnoredDuringExecution Node Affinity
    - B) Taints and Tolerations
    - C) preferredDuringSchedulingIgnoredDuringExecution Node Affinity
    - D) DaemonSet configuration
    - **Answer:** C

29. **What is Helm in the context of Kubernetes?**
    - A) A container runtime engine
    - B) A package manager to bundle and configure K8s YAML manifests
    - C) A monitoring dashboard
    - D) An internal network overlay CNI
    - **Answer:** B

30. **Which Helm file contains the customizable input parameters to overwrite defaults?**
    - A) Chart.yaml
    - B) templates/service.yaml
    - C) values.yaml
    - D) Release.json
    - **Answer:** C
