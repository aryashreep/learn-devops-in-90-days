# 🏆 Module 05 Mastery Exam: Jira For DevOps

Welcome to the **Mastery Exam**! This assessment covers everything from Scrum and Kanban fundamentals to JQL querying and Jira project administration in a DevOps context.

---

## 📝 Part 1: Scrum vs Kanban (Day 22)

**1. A DevOps team is managing an ongoing support queue with no fixed release schedule. Work items arrive continuously and must be completed as fast as possible. Which agile methodology is the best fit?**
- A) Scrum, because sprints create urgency and improve throughput
- B) Kanban, because it is optimized for continuous flow without time-boxed iterations
- C) Waterfall, because support queues require strict phase gates
- D) SAFe, because it scales better than Kanban for support teams
- **Ans: B**

**2. In Scrum, what is the primary purpose of the Sprint Retrospective ceremony?**
- A) To review and accept completed work with the product owner and stakeholders
- B) To plan the tasks for the upcoming sprint by pulling from the backlog
- C) To inspect how the last sprint went and identify improvements to the team's process
- D) To update the burndown chart and recalculate team velocity
- **Ans: C**

**3. A Scrum team's velocity over the last four sprints was 28, 32, 30, and 26 story points. What is their average velocity, and how should the team use this figure?**
- A) 29 points; use it as a hard cap — the team must complete exactly this many points each sprint
- B) 29 points; use it as a guide for how much work to pull into the next sprint during Sprint Planning
- C) 116 points; velocity is always the cumulative total across sprints
- D) 30 points; the highest sprint value is always the baseline for planning
- **Ans: B**

**4. Which of the following is a key difference between a Scrum board and a Kanban board in Jira?**
- A) Scrum boards can only have three columns: To Do, In Progress, and Done
- B) Kanban boards do not support WIP limits, but Scrum boards do
- C) Scrum boards display work for the active sprint only, while Kanban boards show all active work on the board continuously
- D) Kanban boards are only available in Jira Service Management, not Jira Software
- **Ans: C**

**5. A Kanban team's In Progress column has a WIP limit of 3, and there are already 3 items there. A new urgent task arrives. What should the team do first?**
- A) Immediately add the urgent task to In Progress and temporarily exceed the WIP limit
- B) Create a new column called "Urgent" with no WIP limit to bypass the restriction
- C) Focus on finishing one of the current In Progress items before pulling in the new task
- D) Move all current In Progress items back to the backlog to prioritize the urgent task
- **Ans: C**

**6. What event in Scrum results in a potentially shippable product increment?**
- A) Sprint Planning
- B) Daily Standup
- C) Sprint Review
- D) The end of each Sprint
- **Ans: D**

**7. In a Scrum context, who is responsible for maximizing the value of the product and managing the Product Backlog?**
- A) Scrum Master
- B) Development Team collectively
- C) Product Owner
- D) Release Train Engineer
- **Ans: C**

**8. A team is using Scrum but their sprint length keeps changing — sometimes 1 week, sometimes 3 weeks — depending on available features. What is wrong with this approach?**
- A) Sprint lengths must always be exactly 2 weeks; any deviation breaks Scrum
- B) Variable sprint lengths make velocity meaningless because you can't compare story points across sprints of different lengths
- C) Nothing is wrong; Scrum encourages flexible sprint lengths based on team needs
- D) This is only a problem if the team is using Jira Software instead of Jira Work Management
- **Ans: B**

**9. What is the definition of "cycle time" in a Kanban workflow?**
- A) The total time from when a feature is first requested by a customer to when it is delivered
- B) The time it takes a work item to move from the start of active work to completion
- C) The number of items completed per sprint divided by sprint length in days
- D) The average duration between two consecutive team retrospectives
- **Ans: B**

**10. During Sprint Planning, the team pulls items from the Product Backlog into the Sprint Backlog. Which of the following best describes what makes a backlog item "Sprint-ready"?**
- A) It has been assigned to a specific developer and has a due date set
- B) It is refined, estimated, has a clear acceptance criteria, and is small enough to complete within the sprint
- C) It has been approved by the Jira project administrator and has no open sub-tasks
- D) It has been in the backlog for at least two sprints without being completed
- **Ans: B**

---

## 🚀 Part 2: Issue Types, Hierarchy & Workflows (Day 22–23)

**11. In Jira's default issue hierarchy for a software project, what is the correct order from largest to smallest?**
- A) Epic > Story > Task > Subtask
- B) Initiative > Story > Epic > Subtask
- C) Epic > Bug > Story > Subtask
- D) Story > Epic > Task > Bug
- **Ans: A**

**12. A DevOps team is tracking a large cross-team effort to migrate from on-premise servers to AWS. Several teams will each contribute multiple stories over three months. What Jira issue type should be used to group all this work?**
- A) Story, because the scope of work is described in user story format
- B) Task, because it is a technical operation with no end-user value
- C) Epic, because it represents a large body of work spanning multiple sprints and teams
- D) Bug, because the current on-premise setup is a defect in the architecture
- **Ans: C**

**13. What is the functional difference between a Jira "Task" and a Jira "Story"?**
- A) Tasks can have subtasks; Stories cannot be broken down further
- B) Stories represent user-facing value written from a user's perspective; Tasks are used for technical or internal work items that don't fit a user story format
- C) Tasks are only visible to developers; Stories are visible to all project roles
- D) There is no difference; they are interchangeable and the names are only cosmetic
- **Ans: B**

**14. A QA engineer finds a regression in the login feature after a recent deployment. After creating a Bug issue in Jira, they want to formally link it to the Story that introduced the regression. Which issue link type is most semantically appropriate?**
- A) "relates to"
- B) "is blocked by"
- C) "is caused by" or "duplicates"
- D) "is cloned by"
- **Ans: A**

**15. In Jira, a Subtask has a status of "In Progress" but its parent Story is still "To Do". A team lead wants to enforce that the parent issue must be moved to "In Progress" when any subtask is started. What Jira feature enables this behavior?**
- A) WIP limits on the Kanban board
- B) Workflow automation rules (e.g., "When subtask transitions to In Progress, transition parent to In Progress")
- C) Issue security schemes that restrict who can move parent issues
- D) Cascade delete settings in the project configuration
- **Ans: B**

**16. What are the four default Jira priority levels in order from highest to lowest urgency?**
- A) Critical > High > Medium > Low
- B) Blocker > Critical > Major > Minor > Trivial (five levels)
- C) Highest > High > Medium > Low > Lowest
- D) P1 > P2 > P3 > P4
- **Ans: C**

**17. A team uses a "Definition of Done" (DoD) in Jira. A story has passed code review and testing but the documentation has not been updated. According to the DoD, can the story be marked "Done"?**
- A) Yes, as long as code review and testing are complete, the story is done
- B) No; a story can only be marked "Done" when ALL criteria in the Definition of Done are met
- C) Yes, because documentation is tracked as a separate Task issue and doesn't block the Story
- D) It depends on the project administrator's workflow configuration
- **Ans: B**

**18. Which Jira issue type is specifically designed to report unintended behavior or functionality that does not meet the expected requirements?**
- A) Task
- B) Improvement
- C) Bug
- D) Risk
- **Ans: C**

**19. An engineer wants to break down a complex "Deploy to Kubernetes" story into smaller parallel units of work that can be assigned to individual team members. What Jira issue type should they create?**
- A) Linked Issues
- B) Child Stories under the Epic
- C) Subtasks under the Story
- D) New Epics for each parallel track
- **Ans: C**

**20. A team is conducting Sprint Planning in Jira. They want to move several refined stories from the Backlog into the active sprint. Where in Jira do they perform this action?**
- A) The Releases tab, by assigning a fix version to each story
- B) The Backlog view, by selecting the issues and using "Move to Sprint" or dragging them into the sprint
- C) The Board view, by dragging cards from the Done column to the To Do column
- D) The Issue Navigator, by bulk-editing the sprint field on each issue
- **Ans: B**

---

## 🔧 Part 3: JQL, Dashboards & Jira in DevOps (Day 23)

**21. Which of the following is a valid JQL query to find all open bugs assigned to you in the project "INFRA" with high or highest priority?**
- A) `project = INFRA AND type = Bug AND assignee = currentUser() AND priority in (High, Highest) AND status != Done`
- B) `INFRA.bugs WHERE assignee=me AND priority > Medium AND open=true`
- C) `SELECT * FROM INFRA WHERE issuetype=Bug AND priority=(High,Highest)`
- D) `project=INFRA, type=Bug, assignee=currentUser, priority>=High, status=Open`
- **Ans: A**

**22. In JQL, what is the function of the `currentUser()` keyword?**
- A) It returns the username of the Jira project administrator
- B) It dynamically resolves to the username of whoever is running the query, making the filter reusable across team members
- C) It returns the user who last modified the issue
- D) It is only valid in dashboard gadgets, not in saved filters
- **Ans: B**

**23. A DevOps team lead wants to create a shared Jira filter that shows all issues updated in the last 7 days across all projects. Which JQL clause correctly filters by update date?**
- A) `lastModified >= -7d`
- B) `updated >= -7d`
- C) `changeDate > "now-7days"`
- D) `modifiedDate in last("1w")`
- **Ans: B**

**24. What is the difference between a Jira "Saved Filter" and a Jira "Dashboard"?**
- A) Saved Filters store a JQL query that can be reused and shared; Dashboards are configurable pages that display multiple gadgets, which can use saved filters as their data source
- B) Dashboards store JQL queries; Saved Filters are visual layouts with charts and reports
- C) Saved Filters are only available in Jira Service Management; Dashboards are in Jira Software
- D) There is no difference; both terms refer to the same feature in different UI contexts
- **Ans: A**

**25. A CI/CD pipeline has just completed and the build failed. The pipeline uses the Jira API to automatically transition the linked story. Which HTTP method and Jira REST API endpoint is used to transition an issue?**
- A) `PUT /rest/api/3/issue/{issueKey}/status`
- B) `POST /rest/api/3/issue/{issueKey}/transitions`
- C) `PATCH /rest/api/3/issue/{issueKey}/workflow`
- D) `GET /rest/api/3/issue/{issueKey}/transition`
- **Ans: B**

**26. In Jira project administration, which role typically has permission to manage project configurations such as workflows, issue types, and board settings?**
- A) Any user with a Developer role in that project
- B) Only the Atlassian account owner
- C) Users with the Project Administrator role or Jira Administrators
- D) All users with the Reporter role and above
- **Ans: C**

**27. A DevOps team wants to see a burndown chart for their current sprint. Where can they find this in Jira Software?**
- A) Under Project Settings > Reports > Burndown
- B) On the Board view, by clicking "Chart" in the top navigation
- C) Under the active sprint's Reports section, specifically the "Sprint Burndown Chart"
- D) On the Releases page under the Fix Version assigned to the sprint
- **Ans: C**

**28. Which JQL operator would you use to find issues whose summary contains ANY of the words "deploy", "release", or "rollback"?**
- A) `summary = "deploy OR release OR rollback"`
- B) `summary ~ "deploy" OR summary ~ "release" OR summary ~ "rollback"`
- C) `summary IN ("deploy", "release", "rollback")`
- D) `summary CONTAINS ("deploy", "release", "rollback")`
- **Ans: B**

**29. A team wants to measure how much unplanned work (bugs filed mid-sprint) is disrupting their sprints. Which Jira report or metric is most useful for tracking this?**
- A) The Velocity Chart, filtered to show only bug issue types
- B) The Sprint Report, which shows issues added to the sprint after it started ("scope change") versus those committed at the start
- C) The Cumulative Flow Diagram, which shows WIP trends across all issue types
- D) The Release Burndown, which tracks remaining work against a target release date
- **Ans: B**

**30. In a DevOps context, a team integrates their Jira board with their GitHub repository. A developer makes a commit with the message `git commit -m "INFRA-204: fix nginx config reload on deploy"`. What is the automatic benefit of this naming convention?**
- A) The commit automatically closes the Jira issue and transitions it to Done
- B) Jira links the commit to issue INFRA-204, making the development work visible directly on the issue page without any manual linking
- C) GitHub creates a pull request automatically and assigns it to the issue reporter
- D) The Jira sprint velocity increases by one point for each commit referencing an issue key
- **Ans: B**

---
*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 2: The Automation Surge*
