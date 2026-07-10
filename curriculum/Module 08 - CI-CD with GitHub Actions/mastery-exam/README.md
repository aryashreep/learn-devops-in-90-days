# 🏆 Module 07 Mastery Exam: CI/CD with GitHub Actions

Welcome to the **Mastery Exam** for Module 07! Test your knowledge on Continuous Integration, Delivery, Deployment, workflow syntax, strategy matrices, runners, caching, environments, OIDC security, and debugging.

---

### 📝 30 Multiple Choice Questions

#### 🤖 Day 1: GitHub Actions Fundamentals (1-15)

1. **What are GitHub Actions primarily used for?**
   - A) To manage database architectures
   - B) To automate tasks, set up CI/CD, and deploy code directly from repositories
   - C) To act as a primary web hosting service
   - D) To manually review errors
   - **Answer:** B

2. **A job in GitHub Actions consists of:**
   - A) Only One Step
   - B) Multiple Jobs in parallel
   - C) Series of individual Steps executed sequentially
   - D) Only a single shell script
   - **Answer:** C

3. **Where are workflow files stored in a repository?**
   - A) `.github/workflows/`
   - B) `.github/work`
   - C) `github/workflows/`
   - D) `workflows/`
   - **Answer:** A

4. **If a workflow runs a job on Ubuntu, Windows, and macOS simultaneously, how are they executed by default?**
   - A) Sequentially
   - B) In parallel
   - C) Alphabetically
   - D) Manually
   - **Answer:** B

5. **What is a 'Runner' in GitHub Actions?**
   - A) A script that checks for syntax errors
   - B) A directory where workflows are stored
   - C) A set of pre-defined objects
   - D) A VM responsible for executing workflows upon triggering
   - **Answer:** D

6. **Which of the following is true of GitHub-hosted runners?**
   - A) You must manually manage each VM
   - B) They allow you to run multiple jobs on the same clean VM indefinitely
   - C) They provide a fresh, clean instance for each and every job run
   - D) You can install system-level changes to the base OS permanently
   - **Answer:** C

7. **When would you use the `workflow_dispatch` trigger event?**
   - A) When a pull request is created
   - B) When you want to manually run the workflow
   - C) When an issue is updated
   - D) When code is merged to the main branch
   - **Answer:** B

8. **Which event in GitHub Actions triggers a workflow on every commit push or tags?**
   - A) When a pull request is merged
   - B) When a commit or tag is pushed to the repository (`push`)
   - C) When an issue is created
   - D) When workflow dispatch is clicked
   - **Answer:** B

9. **In GitHub Actions, what does the `schedule` event with cron syntax actually control?**
   - A) It runs the workflow only on weekends
   - B) It triggers the workflow at specified time intervals
   - C) It runs the workflow once every year
   - D) It triggers the workflow only once when created
   - **Answer:** B

10. **What typically happens when you push code to a repository that has a workflow configured with `on: push`?**
    - A) The workflow is automatically triggered
    - B) GitHub deletes the repository
    - C) The repository is forked automatically
    - D) Nothing happens unless triggered manually
    - **Answer:** A

11. **What are 'Steps' in the context of a job?**
    - A) They define the operating system for the job
    - B) They trigger the workflow
    - C) They are individual tasks executed sequentially within a job
    - D) They define environment variables for the repository
    - **Answer:** C

12. **Which of the following statements correctly describes advantages of GitHub Actions?**
    - A) You must manually set up and scale servers for your workflows
    - B) GitHub Actions only works on local machines, not in virtual environments
    - C) You can't get reports or job status from GitHub Actions
    - D) GitHub manages infrastructure, executes jobs, and provides reports
    - **Answer:** D

13. **What is the advantage of self-hosted runners?**
    - A) You don't have to manage any infrastructure
    - B) You can install any software & fully control the environment
    - C) You cannot run multiple jobs on the same runner
    - D) macOS runners are hosted on GitHub's servers
    - **Answer:** B

14. **Where are GitHub-hosted runners for Linux, Windows, and macOS hosted?**
    - A) Linux & Windows on Azure, macOS on GitHub macOS cloud
    - B) Linux & Windows on GitHub cloud, macOS on Azure
    - C) All runners on self-managed servers
    - D) All runners on AWS EC2
    - **Answer:** A

15. **Which of the following operations is NOT supported directly on GitHub-hosted runners?**
    - A) Running jobs automatically on push events
    - B) Using YAML-based workflow configuration
    - C) Installing system-level software permanently (modifying host OS permanently)
    - D) Receiving job logs and artifacts
    - **Answer:** C

---

#### 🚀 Day 2: GitHub Actions Advanced (16-30)

16. **In `workflow_dispatch`, why do we define `inputs`?**
    - A) To auto-detect the deployment environment
    - B) To allow users to select or type values when manually running the workflow
    - C) To permanently store sensitive keys
    - D) To restrict branch creation
    - **Answer:** B

17. **In a GitHub Actions workflow, what is the purpose of using `actions/checkout@v4`?**
    - A) Installs dependencies required for the project
    - B) Creates a new branch automatically before deployment
    - C) Action checks out repository under `$GITHUB_WORKSPACE`, so workflow can access files
    - D) Deploys the application to the production server
    - **Answer:** C

18. **What are artifacts in GitHub Actions?**
    - A) To permanently store source code in the repository
    - B) To save files (like build outputs or reports) and share them between jobs in a workflow run
    - C) To trigger another workflow automatically
    - D) To automatically merge branches
    - **Answer:** B

19. **What is the primary benefit of GitHub Environments?**
    - A) To create new branches automatically
    - B) To execute workflows on local operating systems
    - C) To protect deployments with environment-specific secrets and manual approval rules
    - D) To share files between jobs
    - **Answer:** C

20. **What is the main purpose of the lint job in a production pipeline?**
    - A) Run code quality/syntax checks before building/testing
    - B) Build the Docker image
    - C) Run unit tests
    - D) Deploy the application
    - **Answer:** A

21. **Why are `if` conditional expressions used in a job or step?**
    - A) To speed up workflow execution automatically
    - B) To define inputs
    - C) To run a step only on specific branches or under certain conditions
    - D) To control whether a job or step runs based on a condition
    - **Answer:** D

22. **What is the role of Matrix Strategy in GitHub Actions?**
    - A) To run a single job across predefined combinations of variables (e.g. multiple OS, Node versions)
    - B) To create separate repos for each operating system
    - C) To limit the number of runs
    - D) To deploy applications to multiple servers
    - **Answer:** A

23. **What is the main advantage of using OIDC (OpenID Connect) with AWS in GitHub Actions?**
    - A) To permanently store AWS access keys in the repository secrets
    - B) To authenticate securely with AWS without storing long-term credentials
    - C) To increase Docker build speed
    - D) To create IAM users automatically
    - **Answer:** B

24. **In GitHub Actions, why is the `needs` keyword used?**
    - A) To run workflows only on one branch
    - B) To run multiple jobs in a sequence (define dependencies)
    - C) To automatically merge pull requests
    - D) To store secrets
    - **Answer:** B

25. **Which trigger/event is used to create a reusable workflow?**
    - A) `push`
    - B) `workflow_dispatch`
    - C) `workflow_call`
    - D) `pull_request`
    - **Answer:** C

26. **What is the purpose of the `concurrency` key in a workflow?**
    - A) To store workflow logs
    - B) To speed up Docker image builds
    - C) To run multiple jobs in parallel
    - D) Limits or cancels in-progress workflow runs to prevent conflicts/overlapping deployments
    - **Answer:** D

27. **How do you target a self-hosted runner in a workflow?**
    - A) `runs-on: ubuntu-latest`
    - B) `runs-on: github-hosted`
    - C) `runs-on: self-hosted` (or labels like `runs-on: [self-hosted, linux]`)
    - D) `runs-on: ec2`
    - **Answer:** C

28. **What is the primary role of the `env` context?**
    - A) Store encrypted sensitive values
    - B) Store environment variables defined at the workflow, job, or step level
    - C) Automatically rotate access tokens
    - D) Store AWS secrets
    - **Answer:** B

29. **What is a common reason why jobs are not assigned to a self-hosted runner?**
    - A) Git is not installed on the runner
    - B) Ubuntu is not updated
    - C) SSH keys are missing
    - D) Incorrect `runs-on` label mismatch
    - **Answer:** D

30. **What is the primary aim of the `secrets` context?**
    - A) Store sensitive data like passwords, keys, and tokens securely
    - B) Store public configuration values
    - C) Store temporary build variables
    - D) Store repository file paths
    - **Answer:** A
