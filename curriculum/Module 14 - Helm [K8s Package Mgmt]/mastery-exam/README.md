# 🏆 Module 14 Mastery Exam: Helm [K8s Package Mgmt]

Welcome to the **Helm Mastery Exam**! This assessment tests your knowledge of Helm fundamentals, chart structure, templating, values precedence, the release lifecycle, multi-environment deployment, and Helm in CI/CD.

---

## 📝 Part 1: Helm Fundamentals

**1. What is Helm?**
- A) A Kubernetes package manager
- B) A CI server
- C) A container runtime
- D) A monitoring agent
- **Ans: A**

**2. Which server-side component was removed in Helm v3?**
- A) Helm client
- B) Chartmuseum
- C) Tiller
- D) kubectl
- **Ans: C**

**3. Where does Helm v3 store release state?**
- A) In a Kubernetes Secret in the release's namespace
- B) In a local database
- C) In Git tags
- D) In `/var/lib/helm`
- **Ans: A**

**4. Which file contains a chart's metadata (name, version, dependencies)?**
- A) `values.yaml`
- B) `.helmignore`
- C) `Chart.yaml`
- D) `NOTES.txt`
- **Ans: C**

**5. What does a "release" represent in Helm?**
- A) A packaged `.tgz` file
- B) A running instance of a chart together with its configuration
- C) A Git tag
- D) A chart repository
- **Ans: B**

**6. Which is NOT a valid Helm command?**
- A) `helm install`
- B) `helm commit`
- C) `helm upgrade`
- D) `helm rollback`
- **Ans: B**

---

## 📝 Part 2: Charts & Structure

**7. Which command scaffolds a new chart?**
- A) `helm init`
- B) `helm create`
- C) `helm scaffold`
- D) `helm new`
- **Ans: B**

**8. Which directory holds subchart dependencies?**
- A) `charts/`
- B) `crds/`
- C) `templates/`
- D) `values/`
- **Ans: A**

**9. What is `_helpers.tpl` used for?**
- A) Storing secrets
- B) Defining reusable template snippets (names, labels)
- C) Installing dependencies
- D) Writing release notes
- **Ans: B**

**10. What does `helm template` do?**
- A) Renders manifests locally without installing
- B) Installs the chart into the cluster
- C) Packages the chart into a `.tgz`
- D) Deletes old releases
- **Ans: A**

**11. What does `helm lint` check?**
- A) Cluster health
- B) Image vulnerabilities
- C) Chart structure and template validity
- D) Release history
- **Ans: C**

**12. What file type does `helm package` produce?**
- A) `.zip`
- B) `.yaml`
- C) `.tgz`
- D) `.tar`
- **Ans: C**

**13. Which folder holds custom resource definitions (CRDs)?**
- A) `crds/`
- B) `charts/`
- C) `hooks/`
- D) `templates/`
- **Ans: A**

**14. Which built-in object exposes the release name in templates?**
- A) `.Chart`
- B) `.Values`
- C) `.Env`
- D) `.Release`
- **Ans: D**

**15. Which template function provides a fallback when a value is empty?**
- A) `default`
- B) `fallback`
- C) `or`
- D) `coalesce`
- **Ans: A**

---

## 📝 Part 3: Templating & Values

**16. Which has the HIGHEST values precedence?**
- A) `values.yaml` defaults
- B) `Chart.yaml`
- C) `--set image.tag=1.3.0` flags
- D) `-f values-prod.yaml` files
- **Ans: C**

**17. Which flag passes a value inline during install/upgrade?**
- A) `--value`
- B) `-v`
- C) `--set`
- D) `--config`
- **Ans: C**

**18. Which template construct conditionally includes content?**
- A) `{{- if ... }} ... {{- end }}`
- B) `{{- switch ... }}`
- C) `{{- case ... }}`
- D) `{{- when ... }}`
- **Ans: A**

**19. Which function renders a map as indented YAML in a template?**
- A) `quote`
- B) `toYaml`
- C) `b64enc`
- D) `upper`
- **Ans: B**

**20. Where should secrets be stored in a Helm setup?**
- A) Committed in `values.yaml`
- B) In CI secrets / external secret stores, injected at deploy time
- C) In `Chart.yaml`
- D) In `NOTES.txt`
- **Ans: B**

**21. Which command shows the values actually used by a release?**
- A) `helm values`
- B) `helm show values`
- C) `helm get values`
- D) `helm config`
- **Ans: C**

---

## 📝 Part 4: Releases & Lifecycle

**22. Which command installs OR upgrades idempotently?**
- A) `helm apply`
- B) `helm upgrade --install`
- C) `helm install`
- D) `helm deploy`
- **Ans: B**

**23. What does `--atomic` do on an upgrade?**
- A) Makes it faster
- B) Automatically rolls back if the install fails
- C) Skips linting
- D) Deletes the release after install
- **Ans: B**

**24. Which command reverts a release to a previous revision?**
- A) `helm revert`
- B) `helm undo`
- C) `helm restore`
- D) `helm rollback`
- **Ans: D**

**25. How do you list releases in ALL namespaces?**
- A) `helm list -A`
- B) `helm get all`
- C) `helm show list`
- D) `helm list --full`
- **Ans: A**

**26. What does `helm history <release>` show?**
- A) Chart versions
- B) Container logs
- C) The release's revision timeline
- D) Cluster events
- **Ans: C**

---

## 📝 Part 5: Multi-Env & CI/CD

**27. What is the standard way to isolate dev vs prod releases of the same chart?**
- A) Deploy to different namespaces
- B) Use different chart names
- C) Use different Helm versions
- D) Different values files alone (no isolation)
- **Ans: A**

**28. What is the correct deploy order in a CI pipeline?**
- A) deploy → lint → package
- B) template → deploy → lint
- C) lint → template → package → deploy
- D) package → lint → deploy → template
- **Ans: C**

**29. Where do you push packaged charts for sharing with other teams?**
- A) Docker Hub
- B) npm
- C) PyPI
- D) An OCI registry via `helm push`
- **Ans: D**

**30. What is the main benefit of combining `--atomic` with `helm rollback`?**
- A) Faster releases
- B) Reliable, safe recoveries from failed deploys
- C) Less YAML to write
- D) No values files needed
- **Ans: B**

---

*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 14: Helm [K8s Package Mgmt]*
