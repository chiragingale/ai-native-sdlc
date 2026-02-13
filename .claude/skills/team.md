# Skill: /team - Orchestrate Agent Teams

<command-name>team</command-name>

## Description
Orchestrates multiple specialized agents to work together on complex tasks. Manages handoffs between agents and ensures coherent output.

## Usage
```
/team [team-type] "[task description]"
```

## Available Teams

### Feature Team
**Agents:** PM → Architect → Developer → QA → Tech Writer
**Use for:** New features, major enhancements

```
/team feature "Add user authentication with OAuth"
```

**Workflow:**
1. **PM Agent**: Gathers requirements, creates user stories
2. **Architect Agent**: Designs system architecture, API contracts
3. **Developer Agent**: Implements the feature
4. **QA Agent**: Reviews code, writes tests
5. **Tech Writer Agent**: Updates documentation

### Bugfix Team
**Agents:** QA → Developer → QA
**Use for:** Bug fixes, issue resolution

```
/team bugfix "Fix login redirect loop on mobile"
```

**Workflow:**
1. **QA Agent**: Analyzes bug, identifies root cause
2. **Developer Agent**: Implements fix
3. **QA Agent**: Verifies fix, adds regression test

### Review Team
**Agents:** QA (Security) → QA (Performance) → QA (Quality)
**Use for:** Comprehensive code reviews

```
/team review "PR #123"
```

**Workflow:**
1. **Security Review**: OWASP vulnerabilities, auth issues
2. **Performance Review**: N+1 queries, memory leaks
3. **Quality Review**: Code patterns, maintainability

### Refactor Team
**Agents:** Architect → Developer → QA
**Use for:** Code refactoring, modernization

```
/team refactor "Migrate from REST to GraphQL"
```

**Workflow:**
1. **Architect Agent**: Plans migration strategy
2. **Developer Agent**: Executes refactoring
3. **QA Agent**: Ensures no regressions

### Release Team
**Agents:** DevOps → QA → Tech Writer
**Use for:** Release preparation and deployment

```
/team release "v2.0.0"
```

**Workflow:**
1. **DevOps Agent**: Prepares deployment, validates infrastructure
2. **QA Agent**: Final validation, deploy checklist
3. **Tech Writer Agent**: Changelog, release notes

### Maintenance Team
**Agents:** DevOps → Developer → QA
**Use for:** Dependency updates, tech debt

```
/team maintain "Update all dependencies"
```

**Workflow:**
1. **DevOps Agent**: Identifies updates, security issues
2. **Developer Agent**: Applies updates, fixes breaking changes
3. **QA Agent**: Validates functionality

## Team Orchestration

### Handoff Protocol
Each agent produces a structured handoff document:

```markdown
## Handoff: [From Agent] → [To Agent]

### Summary
[What was done]

### Deliverables
- [Deliverable 1]
- [Deliverable 2]

### Context for Next Agent
[Important information for the next agent]

### Open Questions
- [Question 1]
- [Question 2]

### Dependencies
- [Dependency 1]
```

### Parallel Execution
Some team tasks can run in parallel:

```
/team feature --parallel "Add user dashboard"
```

Parallel phases:
- Frontend + Backend implementation
- Unit tests + Integration tests
- API docs + User guide

### Progress Tracking
```markdown
## Team Progress: [Task]

| Phase | Agent | Status | Output |
|-------|-------|--------|--------|
| Specify | PM | ✅ Complete | [spec.md] |
| Design | Architect | ✅ Complete | [architecture.md] |
| Develop | Developer | 🔄 In Progress | - |
| Validate | QA | ⏳ Pending | - |
| Document | Tech Writer | ⏳ Pending | - |

**Current Phase:** Develop
**ETA:** [estimated completion]
```

## Custom Teams

Define custom teams in `.claude/teams/`:

```yaml
# .claude/teams/api-team.yaml
name: API Development Team
description: Specialized team for API development

agents:
  - name: API Designer
    base: architect-agent
    focus: API contracts, OpenAPI specs

  - name: Backend Developer
    base: backend-agent
    focus: API implementation

  - name: API Tester
    base: qa-agent
    focus: API testing, contract testing

workflow:
  - agent: API Designer
    output: openapi-spec.yaml

  - agent: Backend Developer
    input: openapi-spec.yaml
    output: implementation

  - agent: API Tester
    input: implementation
    output: test-report
```

## Team Communication

### Inter-Agent Messages
Agents communicate through structured messages:

```typescript
interface AgentMessage {
  from: AgentType;
  to: AgentType;
  type: 'handoff' | 'question' | 'feedback' | 'approval';
  content: string;
  attachments?: string[]; // file paths
  priority: 'low' | 'normal' | 'high';
}
```

### Feedback Loops
Agents can request clarification:

```markdown
## Feedback Request

**From:** Developer Agent
**To:** PM Agent
**Type:** Clarification

**Question:**
The spec mentions "real-time updates" but doesn't specify the mechanism.
Should we use:
1. WebSockets
2. Server-Sent Events
3. Long polling

**Context:**
WebSockets provide bidirectional communication but require more infrastructure.
SSE is simpler but only supports server-to-client.

**Recommendation:**
SSE for this use case (one-way notifications)
```

## Output Format

```markdown
# Team Execution Report: [Task]

## Team: [Team Type]
## Task: [Description]
## Duration: [time taken]

---

## Phase Summary

### 1. [Phase Name] - [Agent]
**Status:** Complete
**Duration:** [time]

**Output:**
[Summary of what was produced]

**Key Decisions:**
- [Decision 1]
- [Decision 2]

---

### 2. [Phase Name] - [Agent]
...

---

## Final Deliverables

| Deliverable | Location | Status |
|-------------|----------|--------|
| Specification | docs/spec.md | ✅ |
| Architecture | docs/architecture.md | ✅ |
| Implementation | src/features/... | ✅ |
| Tests | tests/... | ✅ |
| Documentation | docs/... | ✅ |

## Metrics

- Lines of code: +X / -Y
- Test coverage: Z%
- Files modified: N

## Recommendations

- [Follow-up recommendation 1]
- [Follow-up recommendation 2]
```

## Related Skills
- Individual agent skills (`/spec`, `/architecture`, `/implement`, etc.)
- `/review` - Code review
- `/deploy-checklist` - Deployment validation
