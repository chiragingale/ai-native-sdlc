# Skill: /spec - Generate Feature Specification

<command-name>spec</command-name>

## Description
Generates a comprehensive feature specification using the PM Agent persona. This skill guides you through creating well-defined specifications with acceptance criteria.

## Usage
```
/spec [feature description]
```

## Workflow

### 1. Context Gathering
First, I'll ask clarifying questions to understand:
- **Problem**: What problem are we solving?
- **Users**: Who are the target users?
- **Value**: What's the expected business value?
- **Scope**: What's in and out of scope?

### 2. Specification Generation
Based on your answers, I'll generate:
- Feature overview
- User stories with acceptance criteria
- Technical considerations
- Dependencies and risks
- Success metrics

### 3. Review & Refinement
We'll iterate on the specification until it meets your requirements.

## Output Format

```markdown
# Feature Specification: [Feature Name]

## Overview
[Brief description]

## Problem Statement
[What problem does this solve?]

## Target Users
[Who will use this?]

## User Stories

### US-001: [Story Title]
**As a** [user type]
**I want** [goal]
**So that** [benefit]

#### Acceptance Criteria
- [ ] Given [context], when [action], then [outcome]
- [ ] Given [context], when [action], then [outcome]

## Technical Considerations
[Any technical notes]

## Dependencies
[List dependencies]

## Risks & Mitigations
| Risk | Impact | Mitigation |
|------|--------|------------|

## Success Metrics
- [Metric]: [Target]

## Out of Scope
[What's NOT included]
```

## Examples

### Example 1: Simple Feature
```
/spec Add user profile photo upload
```

### Example 2: Complex Feature
```
/spec Implement real-time notification system for order status updates
```

## Related Skills
- `/user-story` - Create individual user stories
- `/interview` - Interactive requirements gathering
- `/architecture` - Design the technical architecture
