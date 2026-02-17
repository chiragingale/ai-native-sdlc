---
name: user-story
description: Creates detailed user stories with acceptance criteria, following best practices for agile development
---

## Usage
```
/user-story [brief description of the functionality]
```

## Output Format

```markdown
## User Story: [Title]

**ID**: US-[XXX]
**Priority**: [High/Medium/Low]
**Estimate**: [Story Points]

### Story
**As a** [specific user type/persona]
**I want** [specific goal or action]
**So that** [measurable benefit or value]

### Acceptance Criteria

#### Scenario 1: [Happy Path]
- **Given** [initial context/state]
- **When** [action performed]
- **Then** [expected outcome]

#### Scenario 2: [Alternative Path]
- **Given** [initial context/state]
- **When** [action performed]
- **Then** [expected outcome]

#### Scenario 3: [Error Handling]
- **Given** [initial context/state]
- **When** [invalid action]
- **Then** [error handling behavior]

### Technical Notes
- [Implementation consideration 1]
- [Implementation consideration 2]

### Definition of Done
- [ ] Code implemented and reviewed
- [ ] Unit tests written and passing
- [ ] Integration tests passing
- [ ] Documentation updated
- [ ] Acceptance criteria verified
```

## Best Practices - INVEST Criteria
- **I**ndependent - Can be developed separately
- **N**egotiable - Details can be discussed
- **V**aluable - Delivers value to users
- **E**stimable - Can be estimated
- **S**mall - Fits in a sprint
- **T**estable - Has clear acceptance criteria

## Related Skills
- `/spec` - Full feature specification
- `/interview` - Gather requirements interactively
- `/test` - Generate tests from acceptance criteria
