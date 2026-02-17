---
name: team
description: Orchestrates multiple specialized agents to work together on complex tasks with structured handoffs
---

## Usage
```
/team [team-type] "[task description]"
```

## Available Teams

### Feature Team
**Agents:** PM -> Architect -> Developer -> QA -> Tech Writer
```
/team feature "Add user authentication with OAuth"
```

### Bugfix Team
**Agents:** QA -> Developer -> QA
```
/team bugfix "Fix login redirect loop on mobile"
```

### Review Team
**Agents:** QA (Security) -> QA (Performance) -> QA (Quality)
```
/team review "PR #123"
```

### Refactor Team
**Agents:** Architect -> Developer -> QA
```
/team refactor "Migrate from REST to GraphQL"
```

### Release Team
**Agents:** DevOps -> QA -> Tech Writer
```
/team release "v2.0.0"
```

### Maintenance Team
**Agents:** DevOps -> Developer -> QA
```
/team maintain "Update all dependencies"
```

## Handoff Protocol
Each agent produces a structured handoff document:

```markdown
## Handoff: [From Agent] -> [To Agent]

### Summary
[What was done]

### Deliverables
- [Deliverable 1]

### Context for Next Agent
[Important information for the next agent]

### Open Questions
- [Question 1]
```

## Output Format

```markdown
# Team Execution Report: [Task]

## Team: [Team Type]
## Task: [Description]

## Phase Summary

### 1. [Phase Name] - [Agent]
**Status:** Complete
**Output:** [Summary]
**Key Decisions:** [Decisions made]

## Final Deliverables

| Deliverable | Location | Status |
|-------------|----------|--------|
| Specification | docs/spec.md | Done |
| Implementation | src/features/... | Done |
| Tests | tests/... | Done |

## Metrics
- Lines of code: +X / -Y
- Test coverage: Z%
- Files modified: N
```

## Related Skills
- `/spec`, `/architecture`, `/implement`, `/review`, `/test`
- `/deploy-checklist` - Deployment validation
