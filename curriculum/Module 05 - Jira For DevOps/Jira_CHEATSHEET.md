# 🎫 Jira For DevOps — Command & Concept Cheatsheet

> **Quick reference for Jira project management: issue hierarchy, workflows, JQL, Agile boards, and DevOps integrations.**
>
> *Print-friendly — designed for Cmd+P / PDF export in dark or light mode.*

---

## 📋 Issue Types & Hierarchy

| Level | Type | Description | Example |
|-------|------|-------------|---------|
| **L1** | **Epic** | Large body of work spanning multiple sprints | "User Authentication System" |
| **L2** | **Story** | User-facing requirement (INVEST format) | "As a user, I can reset my password via email" |
| **L2** | **Task** | Technical work that doesn't map to a story | "Set up CI/CD pipeline for backend" |
| **L2** | **Bug** | Something broken that needs fixing | "Login button returns 500 error on submit" |
| **L3** | **Sub-task** | Smallest unit – child of a Story/Task | "Design password reset email template" |

```
┌─────────────────────────────────────────────────────────┐
│                     EPIC (The Goal)                      │
│  "User Authentication System"                            │
│  ├── Story: "As a user, I can log in with email"        │
│  │   ├── Sub-task: Design login UI                       │
│  │   ├── Sub-task: Implement backend API                 │
│  │   └── Sub-task: Write unit tests                      │
│  ├── Bug: "Login button returns 500 on submit"          │
│  └── Task: "Set up OAuth2 provider config"              │
└─────────────────────────────────────────────────────────┘
```

---

## 🔄 Issue Lifecycle & Workflows

### Default Jira Workflow (Simplified)

```
┌─────────┐    ┌─────────┐    ┌──────────┐    ┌────────────┐
│  TO DO  │───▶│ IN PROG │───▶│ IN REVIEW│───▶│    DONE    │
└─────────┘    └─────────┘    └──────────┘    └────────────┘
                    │                                ▲
                    ▼                                │
               ┌─────────┐                     ┌─────────┐
               │ BLOCKED │                     │  CLOSED │
               └─────────┘                     └─────────┘
```

### Custom Workflow States (Common for DevOps)

| State | Description | Transitions |
|-------|-------------|-------------|
| **To Do** | Backlog; not yet started | → In Progress |
| **In Progress** | Actively being worked on | → In Review, Blocked |
| **Blocked** | Dependency or issue preventing progress | → In Progress |
| **In Review** | Code review / peer review phase | → Done, In Progress |
| **Done** | Work complete, awaiting verification | → Closed, Reopened |
| **Closed** | Verified and accepted | → Reopened |
| **Reopened** | Previously closed issue needs more work | → In Progress |

---

## 🎯 Agile Boards

### Scrum Board

| Column | Purpose | WIP Limit |
|--------|---------|-----------|
| **Backlog** | Prioritized list of all work | Unlimited |
| **Sprint Backlog** | Committed for current sprint | Sprint capacity |
| **In Progress** | Active work items | 2–3 per developer |
| **In Review** | Awaiting peer review | 3–5 per team |
| **Done** | Completed this sprint | — |

### Kanban Board

| Column | Purpose | WIP Limit |
|--------|---------|-----------|
| **Backlog** | Prioritized queue | Unlimited |
| **Ready** | Next up for development | 2–3 |
| **In Progress** | Active work | 2 per developer |
| **Review** | Awaiting approval | 3–5 |
| **Done** | Completed | — |

**Key Metrics:** Cycle Time, Lead Time, Throughput, Cumulative Flow Diagram.

---

## 🔍 JQL — Jira Query Language

JQL is Jira's powerful search language. Use it to filter issues, create boards, and build reports.

### Basic Syntax

```jql
field OPERATOR value
```

### Common Operators

| Operator | Usage | Example |
|----------|-------|---------|
| `=` / `!=` | Exact match | `project = DEVOPS` |
| `~` / `!~` | Contains (text search) | `summary ~ "deployment"` |
| `>` / `<` | Greater/less than | `priority > Medium` |
| `IN` / `NOT IN` | Multiple values | `status IN (Done, Closed)` |
| `IS` / `IS NOT` | Null checks | `due IS EMPTY` |
| `WAS` / `WAS IN` | History queries | `status WAS "In Progress"` |

### JQL by Category

#### 🏷️ By Project & Issue

```jql
project = DEVOPS
issuetype = Bug
project IN (DEVOPS, PLATFORM, SRE)
issuekey = DEVOPS-42
```

#### 📅 By Date & Time

```jql
created >= -7d
updated > startOfWeek()
due < now()
resolved > startOfMonth() AND resolved < endOfMonth()
created >= "2026-01-01" AND created <= "2026-06-30"
```

#### 👤 By Assignee & Reporter

```jql
assignee = currentUser()
reporter IN (membersOf("devops-team"))
assignee IS EMPTY
assignee != currentUser() AND status = "In Progress"
```

#### 🔄 By Status & Workflow

```jql
status = "In Progress"
status CHANGED FROM "To Do" TO "In Progress"
status CHANGED AFTER startOfDay()
resolution = Unresolved
resolution = Done
```

#### 🚀 Advanced (Functions)

```jql
issueFunction in commented("by currentUser() after -2d")
issueFunction in linkedIssuesOf("project = DEVOPS", "blocks")
issueFunction in epicsOf("project = DEVOPS")
```

---

## 🛠️ Jira + DevOps Workflows (Real-World)

### 1. Git Integration (Smart Commits)

Link commits and branches to Jira issues automatically:

```bash
# Branch naming convention
git checkout -b DEVOPS-42-add-login-page

# Smart commit — transitions issue automatically
git commit -m "DEVOPS-42 #comment Added login form UI
DEVOPS-42 #transition In Review
DEVOPS-42 #time 2h 30m"

# Smart commit — close issue
git commit -m "DEVOPS-42 #resolve #time 4h"
```

**Smart Commit Commands:**
| Command | Effect |
|---------|--------|
| `#comment <text>` | Adds a comment to the issue |
| `#time <value>` | Logs work (e.g., `#time 3h`, `#time 1d`) |
| `#transition <name>` | Transitions issue to new status |
| `#resolve` | Resolves the issue (transition to Done) |
| `#close` | Closes the issue |

### 2. GitHub + Jira Integration

```yaml
# .github/workflows/jira-link.yml
name: Jira Link
on: [pull_request]
jobs:
  link:
    runs-on: ubuntu-latest
    steps:
      - name: Jira Check
        env:
          JIRA_BASE_URL: ${{ secrets.JIRA_BASE_URL }}
          JIRA_API_TOKEN: ${{ secrets.JIRA_API_TOKEN }}
        run: |
          BRANCH="${{ github.head_ref }}"
          ISSUE_KEY=$(echo "$BRANCH" | grep -oE '[A-Z]+-[0-9]+')
          echo "Linked to: $ISSUE_KEY"
```

### 3. Jenkins + Jira Pipeline

```groovy
// Jenkinsfile — Jira integration stage
stage('Jira Update') {
    steps {
        script {
            jiraTransition(
                idOrKey: "${env.JIRA_ISSUE}",
                transition: 'In Review'
            )
            jiraAddComment(
                idOrKey: "${env.JIRA_ISSUE}",
                comment: "Build #${env.BUILD_NUMBER} deployed to staging"
            )
        }
    }
}
```

---

## 📊 Key Jira Reports

| Report | Purpose | Agile Board |
|--------|---------|-------------|
| **Sprint Report** | Track sprint progress vs commitment | Scrum |
| **Velocity Chart** | Measure team throughput over sprints | Scrum |
| **Burndown/Burnup** | Track remaining work vs time | Scrum |
| **Cumulative Flow Diagram** | See cycle time and bottlenecks | Kanban |
| **Control Chart** | Analyze cycle time per issue | Kanban |
| **Epic Report** | Track progress toward big goals | Both |
| **Release Burndown** | Track fixes vs release scope | Both |

---

## 📝 Jira Fields Reference

| Field | Key (JQL) | Type | Example |
|-------|-----------|------|---------|
| Summary | `summary` | Text | "Fix login bug" |
| Description | `description` | Rich Text | Acceptance criteria |
| Priority | `priority` | Dropdown | Highest, High, Medium, Low, Lowest |
| Status | `status` | Workflow | To Do, In Progress, Done |
| Resolution | `resolution` | Dropdown | Done, Won't Do, Duplicate |
| Assignee | `assignee` | User | Current user |
| Reporter | `reporter` | User | Who created it |
| Labels | `labels` | Tags | `devops`, `urgent` |
| Fix Version | `fixVersion` | Version | v2.1.0 |
| Epic Link | `"Epic Link"` | Issue | DEVOPS-1 |
| Sprint | `sprint` | Sprint | "Sprint 5" |
| Original Estimate | `timeOriginalEstimate` | Duration | 8h |
| Due Date | `due` | Date | 2026-07-15 |
| Created | `created` | DateTime | When issue was created |

---

## 🔐 Project Role & Permission Scheme

| Role | Permissions | Common For |
|------|-------------|------------|
| **Project Lead** | Full admin — schema, workflow, permissions | DevOps Lead |
| **Developer** | Create, edit, transition, assign, link | Engineers |
| **Tester/QA** | Transition, comment, attach | QA Team |
| **Viewer** | Browse, view, comment | Stakeholders |
| **Administrator** | Global Jira admin | Jira Admin |

---

## 🧩 Useful Jira Marketplace Apps (DevOps)

| App | Purpose | Integration |
|-----|---------|-------------|
| **GitHub for Jira** | Link PRs, commits, branches | GitHub |
| **Jenkins for Jira** | Pipeline status in issues | Jenkins |
| **Slack for Jira** | Notifications and commands | Slack |
| **ScriptRunner** | Automation with Groovy scripts | Advanced |
| **JMWE** | Post-functions, validators | Workflow |
| **Tempo Timesheets** | Time tracking & billing | Reports |
| **Structure** | Multi-project hierarchy views | Organization |

---

## ⚡ Quick-Reference Commands

### Smart Commits
```bash
# Comment + Transition + Log time
git commit -m "PROJ-123 #comment Fixed the bug #transition In Review #time 3h"
```

### Branch Naming Convention
```bash
# Format: <project-key>-<issue-number>-<short-description>
git checkout -b PROJ-123-fix-login-bug
```

### JQL Quick Examples
```jql
# My open issues
assignee = currentUser() AND resolution = Unresolved

# Issues updated in last 7 days
updated >= -7d

# Bugs in current sprint
issuetype = Bug AND sprint in openSprints()

# Issues blocking my project
issueFunction in issuesInLinkedIssues("is blocked by", "project = MYPROJ")
```

---

## 🏗️ DevOps Pipeline Integration (ASCII)

```
┌──────────────┐     ┌──────────────────┐     ┌────────────────┐
│  Developer   │     │    GitHub/Jenkins │     │   Jira Board   │
│  (IDE)       │     │    (CI/CD)        │     │   (Tracking)   │
├──────────────┤     ├──────────────────┤     ├────────────────┤
│ git commit   │────▶│ PR created       │────▶│ Issue → In     │
│ "PROJ-123    │     │ Build triggered  │     │ Review         │
│ #transition  │     │ Tests run        │     │                │
│ In Review"   │     │ Deploy to staging│     │ Issue → Done   │
└──────────────┘     └──────────────────┘     └────────────────┘
```

---

> *🎫 Jira For DevOps Cheatsheet — #LearnDevOpsIn90Days • Module 05*
>
> *Maintainer: [Aryashree Pritikrishna](https://github.com/aryashreep)*
