# ⚡ CI/CD with GitHub Actions — Command & Concept Cheatsheet

> **Quick reference for GitHub Actions: workflow syntax, triggers, jobs, steps, actions marketplace, matrix builds, secrets, caching, and CI/CD patterns.**
>
> *Print-friendly — designed for Cmd+P / PDF export.*

---

## 📋 Workflow Anatomy

```yaml
name: CI Pipeline                    # Display name
run-name: "Deploy by @${{ github.actor }}"  # Dynamic run name

on:                                  # Triggers
  push:
    branches: [main, develop]
  pull_request:
    types: [opened, synchronize]
  workflow_dispatch:                 # Manual trigger

env:                                 # Global environment variables
  NODE_VERSION: '20'

jobs:
  build:                             # Job ID
    name: Build Application          # Display name
    runs-on: ubuntu-latest           # Runner environment
    if: github.ref == 'refs/heads/main'  # Conditional execution
    timeout-minutes: 15              # Job timeout

    env:                             # Job-level env vars
      CI: true

    steps:                           # Sequential steps
      - name: Checkout Code          # Step name
        uses: actions/checkout@v4    # Reusable action

      - name: Setup Node
        uses: actions/setup-node@v4
        with:                        # Action inputs
          node-version: ${{ env.NODE_VERSION }}

      - name: Install Dependencies
        run: npm ci                  # Shell command

      - name: Run Tests
        run: npm test

      - name: Upload Artifacts
        uses: actions/upload-artifact@v4
        with:
          name: build-output
          path: dist/
```

---

## 🔄 Workflow Triggers

| Event | Syntax | When It Runs |
|-------|--------|-------------|
| **Push** | `on: push` | Code pushed to any branch |
| **Push (specific)** | `on: push: branches: [main]` | Push to main branch only |
| **Pull Request** | `on: pull_request` | PR opened, synchronized, reopened |
| **PR (specific)** | `on: pull_request: branches: [main]` | PR targeting main |
| **Schedule** | `on: schedule: - cron: '0 3 * * *'` | Cron-based (UTC) |
| **Manual** | `on: workflow_dispatch` | Button click in Actions tab |
| **Release** | `on: release: types: [published]` | Release published |
| **Tag** | `on: push: tags: ['v*']` | Tag created |

### Path & Branch Filters

```yaml
on:
  push:
    branches:
      - main
      - develop
      - feat/**           # Wildcard — matches feat/auth, feat/api
    paths:
      - 'src/**'           # Only if src/ files change
      - '!docs/**'         # Exclude docs directory
    tags:
      - 'v*'               # Version tags
```

### Schedule Examples

```yaml
on:
  schedule:
    - cron: '0 0 * * *'        # Daily at midnight UTC
    - cron: '30 8 * * 1-5'     # Weekdays at 8:30 AM UTC
    - cron: '0 */6 * * *'      # Every 6 hours
    - cron: '0 2 * * 0'        # Weekly (Sunday 2 AM)
```

---

## 🧩 Jobs & Dependencies

```yaml
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm run lint

  test:
    needs: lint                  # Waits for lint to succeed
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm test

  deploy:
    needs: [lint, test]          # Waits for both
    runs-on: ubuntu-latest
    if: github.ref == 'refs/heads/main'     # Only on main
    steps:
      - run: echo "Deploying..."
```

### Job Control

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    continue-on-error: true      # Don't fail workflow if this job fails
    timeout-minutes: 30          # Max runtime
    strategy:                    # Matrix builds
      matrix:
        node: ['18', '20', '22']
        os: [ubuntu-latest, windows-latest]
      fail-fast: false           # Don't cancel all if one fails
      max-parallel: 4            # Max parallel jobs
```

---

## 🔀 Matrix Builds

```yaml
jobs:
  test:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, windows-latest, macos-latest]
        node: ['18', '20', '22']
        include:                    # Add extra combinations
          - os: ubuntu-latest
            node: '22'
            experimental: true
        exclude:                    # Remove specific combos
          - os: windows-latest
            node: '18'
      fail-fast: false

    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node }}
      - run: npm test
```

This generates `3 OS × 3 Node versions = 9 parallel jobs`!

---

## 🔐 Secrets & Variables

```yaml
# Set in GitHub repo: Settings → Secrets and variables → Actions

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      # Secrets (masked in logs)
      - run: echo "${{ secrets.DOCKERHUB_TOKEN }}"

      # Variables (visible in logs)
      - run: echo "${{ vars.DOCKERHUB_USERNAME }}"

      # Environment-level secrets
      - name: Deploy to production
        if: github.ref == 'refs/heads/main'
        uses: some/deploy-action@v1
        with:
          api-key: ${{ secrets.PROD_API_KEY }}
```

| Type | Syntax | Log Visibility | Use For |
|------|--------|----------------|---------|
| **Secrets** | `${{ secrets.NAME }}` | ❌ Masked as `***` | Passwords, tokens, keys |
| **Variables** | `${{ vars.NAME }}` | ✅ Plain text | Usernames, ports, config |

### Environment Protection

```yaml
# Requires approval for production
environment:
  name: production
  url: https://app.example.com

# Or with required reviewers
environment:
  name: production
  url: https://app.example.com
  # 👤 Set required reviewers in environment settings
```

---

## 🗂️ Artifacts & Caching

```yaml
jobs:
  build:
    steps:
      - run: npm run build
      - uses: actions/upload-artifact@v4
        with:
          name: build-files
          path: dist/
          retention-days: 5       # Auto-delete after 5 days

  deploy:
    needs: build
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: build-files
          path: dist/

  # Dependency caching
  test:
    steps:
      - uses: actions/cache@v4
        with:
          path: ~/.npm
          key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
          restore-keys: |
            ${{ runner.os }}-node-
      - run: npm ci
```

---

## 🛠️ Popular Actions

| Action | Purpose | Example |
|--------|---------|---------|
| `actions/checkout@v4` | Clone repository | `uses: actions/checkout@v4` |
| `actions/setup-node@v4` | Install Node.js | `with: { node-version: '20' }` |
| `actions/setup-python@v5` | Install Python | `with: { python-version: '3.12' }` |
| `actions/cache@v4` | Cache dependencies | `with: { path: ~/.npm, key: ... }` |
| `docker/login-action@v3` | Login to registry | `with: { registry: ghcr.io }` |
| `docker/build-push-action@v6` | Build & push image | `with: { tags: ghcr.io/app:latest }` |
| `azure/login@v2` | Azure authentication | `with: { creds: '${{ secrets.AZURE_CRED }}' }` |
| `aws-actions/configure-aws-credentials@v4` | AWS auth | `with: { role-to-assume: arn:aws:iam::... }` |
| `google-github-actions/auth@v2` | GCP auth | `with: { credentials_json: '${{ secrets.GCP_SA_KEY }}' }` |
| `slackapi/slack-github-action@v2` | Slack notifications | `with: { slack-message: "Deploy complete!" }` |

---

## 📝 Expressions & Context

```yaml
# Built-in contexts
${{ github.actor }}           # Who triggered the workflow
${{ github.ref }}             # Branch/tag ref (refs/heads/main)
${{ github.event_name }}      # Trigger event (push, pull_request)
${{ github.sha }}             # Commit SHA
${{ github.run_id }}          # Unique run number
${{ github.workspace }}       # Runner workspace path
${{ runner.os }}              # OS name (Linux, Windows, macOS)
${{ runner.temp }}            # Temp directory
${{ secrets.MY_SECRET }}      # Secret value
${{ vars.MY_VAR }}            # Variable value
${{ env.MY_ENV }}             # Environment variable

# Functions
${{ contains(github.ref, 'main') }}
${{ startsWith(github.ref, 'refs/tags/') }}
${{ endsWith(github.head_ref, '-release') }}
${{ format('Hello {0}', github.actor) }}
${{ join(github.event.commits.*.message, ', ') }}
${{ fromJSON(env.MY_JSON).property }}

# Conditional expressions
if: ${{ github.actor != 'dependabot[bot]' }}
if: always()                    # Run even if previous steps failed
if: cancelled()                 # Run only if workflow is cancelled
if: success()                   # Run only if previous steps succeeded
if: failure()                   # Run only if previous steps failed
```

---

## 🔄 Reusable Workflows

### Caller (main workflow)

```yaml
# .github/workflows/deploy.yml
jobs:
  call-workflow:
    uses: ./.github/workflows/ci.yml           # Local reusable
    # OR from another repo:
    # uses: org/repo/.github/workflows/ci.yml@v1
    with:
      node-version: '20'
    secrets:
      docker-token: ${{ secrets.DOCKERHUB_TOKEN }}
```

### Callee (reusable workflow)

```yaml
# .github/workflows/ci.yml
on:
  workflow_call:
    inputs:
      node-version:
        required: true
        type: string
    secrets:
      docker-token:
        required: true

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: ${{ inputs.node-version }}
      - run: npm ci && npm test
      - run: docker build -t app .
      - run: echo "${{ secrets.docker-token }}" | docker login -u golu --password-stdin
```

---

## 🏗️ Sample CI/CD Pipeline

```yaml
name: Full CI/CD Pipeline

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

env:
  REGISTRY: ghcr.io
  IMAGE_NAME: ${{ github.repository }}

jobs:
  lint-and-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: '20' }
      - run: npm ci
      - run: npm run lint
      - run: npm test

  docker-build:
    needs: lint-and-test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Log in to registry
        uses: docker/login-action@v3
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}
      - name: Build and push
        uses: docker/build-push-action@v6
        with:
          push: true
          tags: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:latest

  deploy:
    needs: docker-build
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    environment:
      name: production
      url: https://app.example.com
    steps:
      - name: Deploy to server
        run: |
          echo "Deploying ${{ env.IMAGE_NAME }}:latest"
          # Add your deploy script here
```

---

> *⚡ CI/CD with GitHub Actions Cheatsheet — #LearnDevOpsIn90Days • Module 08*
>
> *Maintainer: [Aryashree Pritikrishna](https://github.com/aryashreep)*
