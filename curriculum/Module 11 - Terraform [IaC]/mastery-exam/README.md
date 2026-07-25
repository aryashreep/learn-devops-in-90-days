# 🏆 Module 11 Mastery Exam: Terraform [IaC]

Welcome to the **Terraform Mastery Exam**! This assessment tests your knowledge of Infrastructure as Code, HCL syntax, state management, provider plug-ins, custom modules, EKS provisioning, and multi-environment workspaces.

---

## 📝 Part 1: Terraform Fundamentals

**1. What is Terraform primarily used for?**
- A) Application deployment and package configuration management
- B) Orchestrating containers across docker runtimes
- C) Infrastructure provisioning across multi-cloud providers
- D) Continuous application monitoring and log aggregation
- **Ans: C**

**2. Which configuration language does Terraform use?**
- A) YAML
- B) HCL (HashiCorp Configuration Language)
- C) JSON
- D) Python
- **Ans: B**

**3. Which option correctly describes state file management comparison between Terraform and CloudFormation?**
- A) Both tools utilize local storage paths for tfstate records by default
- B) CloudFormation requires developers to configure S3 backend databases manually
- C) Neither tracks resources after provisioning completes
- D) Terraform uses state files to track real-world mappings; CloudFormation manages state internally
- **Ans: D**

**4. You declare "I want 3 EC2 instances" in HCL without specifying the steps to build them. What architecture approach is this?**
- A) Imperative
- B) Declarative
- C) Procedural
- D) Manual
- **Ans: B**

**5. Running `terraform apply` fails, printing the error: "provider registry.terraform.io/... not installed". What is the correct reason and fix?**
- A) The resource block contains syntax errors; edit HCL code and run plan
- B) The state file is missing; run terraform state push
- C) Providers are not initialized; run `terraform init` to download plug-ins before applying
- D) Variables are missing default values; create a tfvars file
- **Ans: C**

**6. What is the role of Providers in Terraform?**
- A) To interact with cloud and service APIs on behalf of resources
- B) To encrypt and unlock state records during executions
- C) To define local variables and outputs
- D) To automate the CI/CD pipeline triggers
- **Ans: A**

**7. Which command displays a preview of proposed changes before applying them to cloud?**
- A) `terraform init`
- B) `terraform apply --dry-run`
- C) `terraform plan`
- D) `terraform fmt`
- **Ans: C**

**8. Which command validates the syntax and internal consistency of HCL files?**
- A) `terraform fmt`
- B) `terraform validate`
- C) `terraform init`
- D) `terraform plan`
- **Ans: B**

**9. Why is the state file critical in real-world Terraform projects?**
- A) It stores the global download history of providers and custom modules
- B) It serves as the single source of truth for mapping code configurations to deployed resources
- C) It contains HCL source code and local parameter mappings
- D) It runs shell commands during deployment phases
- **Ans: B**

**10. How can you secure the state file in a collaborative team environment?**
- A) Store it locally and encrypt the hard drive
- B) Commit the state file to your GitHub repository
- C) Share it via email attachments
- D) Use a remote backend (e.g. S3) with KMS encryption and DynamoDB state locking
- **Ans: D**

**11. You want to reuse the same VPC configuration across different projects. What should you design?**
- A) Shared providers block
- B) A custom Module
- C) Global output variables
- D) Workspace configs
- **Ans: B**

**12. What mechanism is used to pass parameters into your HCL configurations to customize them per deployment?**
- A) Input Variables
- B) Output Blocks
- C) State Files
- D) Providers
- **Ans: A**

**13. What is the difference between the general term "State File" and "terraform.tfstate"?**
- A) The state file stores HCL configurations; `terraform.tfstate` stores credentials
- B) They represent two separate records used for different environments
- C) A state file is the concept of tracking resource mappings; `terraform.tfstate` is the default local file name that stores it
- D) `terraform.tfstate` is only used for remote state backends
- **Ans: C**

**14. You need to print the public IP of an EC2 instance after apply completes and make it accessible to parent workspaces. How?**
- A) Use an `output` block to expose the value
- B) Store it in a variable block with a default argument
- C) Configure it in the provider block
- D) Run `terraform fmt` to parse it from logs
- **Ans: A**

**15. You need to manage Dev, Staging, and Prod environments separately in the same directory using the same codebase. Which feature?**
- A) Modules
- B) Outputs
- C) Provisioners
- D) Workspaces
- **Ans: D**

---

## 🚀 Part 2: Terraform Advanced

**16. You want to assign instance types based on active environments (dev -> t2.micro, prod -> t2.large). What is the correct approach?**
- A) Use resource count loops
- B) Declare multiple provider configurations
- C) Use a conditional expression (e.g., `var.env == "prod" ? "t2.large" : "t2.micro"`)
- D) Run `terraform fmt` on variables
- **Ans: C**

**17. Your team needs to provision resources in AWS and GCP in a single codebase while avoiding vendor lock-in. How does Terraform help?**
- A) By compiling HCL to AWS CloudFormation templates
- B) By allowing multiple providers to be initialized in one configuration
- C) By relying on local bash script wraps
- D) By migrating all GCP calls to AWS adapters
- **Ans: B**

**18. In a hybrid cloud network (AWS + Azure), what is the key advantage of using Terraform?**
- A) Single workspace command set to orchestrate resources across multi-cloud environments
- B) Native monitoring systems that track server metrics across clouds automatically
- C) Restricts resources to local execution only
- D) Only supports AWS endpoints natively
- **Ans: A**

**19. In a CI/CD pipeline, why is Terraform executed before application deployment stages?**
- A) To package application codes into binaries
- B) To run unit and integration code tests
- C) To provision the target virtual servers and subnets dynamically
- D) To deploy configurations inside application runtime memory
- **Ans: C**

**20. Why is hardcoding secrets inside HCL files highly discouraged?**
- A) It slows down terraform apply execution speeds
- B) It causes validation syntax errors during plan
- C) It is not supported by standard variables
- D) It exposes sensitive credentials to version control repositories (Git)
- **Ans: D**

**21. What is the main difference between 'count' and 'for_each' resource arguments?**
- A) `count` works only with maps; `for_each` works only with lists of strings
- B) `count` creates index-based resources; `for_each` creates map/set-based resources (keys)
- C) `for_each` cannot instantiate multiple servers
- D) They perform identical allocations in the state file
- **Ans: B**

**22. What is the purpose of the `terraform taint` command?**
- A) Marks a resource as degraded to force its destruction and recreation on the next apply
- B) Deletes a resource from AWS immediately
- C) Checks syntax without applying changes
- D) Imports external resources to state files
- **Ans: A**

**23. In multi-team environments, why is a remote state backend required?**
- A) To accelerate execution speeds of plan commands
- B) To skip writing backend declarations in HCL files
- C) To compile code into remote binaries
- D) To ensure shared, consistent, and secure state management with concurrency locking
- **Ans: D**

**24. Custom providers in Terraform are developed when?**
- A) Standard cloud providers are offline
- B) Developing local file generators
- C) Interacting with custom, private, or unsupported APIs
- D) Declaring modules
- **Ans: C**

**25. What is a key architecture benefit of a multi-cloud failover setup?**
- A) Lowers network latency globally
- B) Ensures High Availability and Disaster Recovery (HA/DR)
- C) Minimizes credential configuration costs
- D) Reduces deployment automation levels
- **Ans: B**

**26. If `terraform apply` fails halfway through execution, what should you do first?**
- A) Run `terraform plan` again to review partial changes, and then apply
- B) Delete the `terraform.tfstate` database file
- C) Manually edit AWS resources to match your code
- D) Migrate S3 backend to local file paths
- **Ans: A**

**27. In a Terraform Cloud setup, why should `terraform.tfstate` be added to `.gitignore`?**
- A) S3 buckets fail if local files exist
- B) It contains plaintext secrets and conflicts with team remote backend states
- C) Git ignores binary files by default
- D) It causes SSH connection timeouts
- **Ans: B**

**28. What happens during `terraform init` execution?**
- A) Validates provider syntax variables
- B) Creates execution plan and logs into cloud console
- C) Provisions resources in target cloud accounts
- D) Downloads provider plug-ins, initializes the backend, and sets up working directory
- **Ans: D**

**29. What is a key security benefit of dynamic secrets in HashiCorp Vault?**
- A) They are permanent credentials
- B) They bypass IAM validation gates
- C) They provide time-limited, auto-expiring secure access credentials
- D) They do not require authentication
- **Ans: C**

**30. Which command deletes all infrastructure resources managed by the current workspace configuration?**
- A) `terraform remove`
- B) `terraform destroy`
- C) `terraform clean`
- D) `terraform delete`
- **Ans: B**

---
*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 11: Terraform [IaC]*
