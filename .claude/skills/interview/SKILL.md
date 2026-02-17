---
name: interview
description: Conducts a structured interview to gather comprehensive requirements for a feature or project
---

## Usage
```
/interview [topic or feature area]
/interview quick [topic]        # 5-7 questions, rapid gathering
/interview deep [topic]         # 12-15 questions, comprehensive
/interview technical [topic]    # 8-10 questions, technical focus
```

## Interview Structure

### Phase 1: Context Discovery (2-3 questions)
- What problem are we trying to solve?
- Who currently experiences this problem?
- How are users solving this problem today (workarounds)?

### Phase 2: User Understanding (2-3 questions)
- Who are the primary users of this feature?
- What are their technical skill levels?
- What devices/platforms do they use?

### Phase 3: Goal Definition (2-3 questions)
- What does success look like for this feature?
- How will we measure whether it's working?
- What's the minimum viable version?

### Phase 4: Scope Clarification (2-3 questions)
- What must be included in the first release?
- What can be deferred to later versions?
- Are there any hard constraints (time, budget, tech)?

### Phase 5: Edge Cases & Risks (2-3 questions)
- What could go wrong?
- Are there security or privacy concerns?
- What happens if the feature fails?

## Output

After the interview, generates:

```markdown
# Requirements Summary: [Topic]

## Key Findings

### Problem Statement
[Synthesized problem]

### Target Users
[User personas identified]

### Goals & Success Metrics
[What success looks like]

### Requirements

#### Must Have (P0)
- [Requirement 1]

#### Should Have (P1)
- [Requirement 1]

#### Nice to Have (P2)
- [Requirement 1]

### Constraints
[Time, budget, technical limitations]

### Risks
[Identified risks and mitigations]

### Open Questions
[Questions that need further investigation]

## Next Steps
1. [Action item 1]
2. [Action item 2]
```

## Related Skills
- `/spec` - Generate full specification from interview
- `/user-story` - Create stories from requirements
- `/architecture` - Design based on requirements
