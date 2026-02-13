# Skill: /interview - Interactive Requirements Gathering

<command-name>interview</command-name>

## Description
Conducts a structured interview to gather comprehensive requirements for a feature or project. Uses the PM Agent persona to ask targeted questions and synthesize responses into a specification.

## Usage
```
/interview [topic or feature area]
```

## Interview Structure

### Phase 1: Context Discovery (2-3 questions)
Understanding the background and motivation.

**Questions:**
- What problem are we trying to solve?
- Who currently experiences this problem?
- How are users solving this problem today (workarounds)?

### Phase 2: User Understanding (2-3 questions)
Identifying and understanding target users.

**Questions:**
- Who are the primary users of this feature?
- What are their technical skill levels?
- What devices/platforms do they use?

### Phase 3: Goal Definition (2-3 questions)
Clarifying what success looks like.

**Questions:**
- What does success look like for this feature?
- How will we measure whether it's working?
- What's the minimum viable version?

### Phase 4: Scope Clarification (2-3 questions)
Setting boundaries.

**Questions:**
- What must be included in the first release?
- What can be deferred to later versions?
- Are there any hard constraints (time, budget, tech)?

### Phase 5: Edge Cases & Risks (2-3 questions)
Identifying potential issues.

**Questions:**
- What could go wrong?
- Are there security or privacy concerns?
- What happens if the feature fails?

## Interview Modes

### Quick Interview (5-7 questions)
```
/interview quick [topic]
```
Rapid requirements gathering for small features.

### Deep Interview (12-15 questions)
```
/interview deep [topic]
```
Comprehensive discovery for complex features.

### Technical Interview (8-10 questions)
```
/interview technical [topic]
```
Focused on technical requirements and constraints.

## Output

After the interview, I'll generate:

```markdown
# Requirements Summary: [Topic]

## Interview Date
[Date]

## Participants
[Who was interviewed]

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
- [Requirement 2]

#### Should Have (P1)
- [Requirement 1]
- [Requirement 2]

#### Nice to Have (P2)
- [Requirement 1]
- [Requirement 2]

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

## Tips for Good Interviews

1. **Answer with specifics** - Concrete examples help
2. **It's okay to say "I don't know"** - We can research later
3. **Think about edge cases** - What if things go wrong?
4. **Consider all users** - Not just the primary user

## Related Skills
- `/spec` - Generate full specification from interview
- `/user-story` - Create stories from requirements
- `/architecture` - Design based on requirements
