---
name: review
description: Performs a comprehensive code review analyzing code for bugs, security issues, performance problems, and best practice violations
---

## Usage
```
/review [file, PR number, or description]
/review pr [number]             # Review pull request
/review staged                  # Review staged changes
/review diff                    # Review uncommitted changes
/review security [file]         # Security-focused review
/review performance [file]      # Performance-focused review
```

## Review Categories

### 1. Correctness
- Logic errors, off-by-one errors
- Null/undefined handling
- Edge cases, race conditions

### 2. Security
- Input validation
- Authentication/authorization
- Injection vulnerabilities
- Sensitive data exposure

### 3. Performance
- N+1 queries, memory leaks
- Unnecessary computations
- Missing caching, blocking operations

### 4. Code Quality
- Readability, maintainability
- DRY violations, SOLID principles
- Naming conventions

### 5. Testing
- Test coverage and quality
- Edge case coverage
- Mock appropriateness

## Severity Levels

| Level | Meaning |
|-------|---------|
| Critical | Must fix before merge - security/data issues |
| Major | Should fix - bugs or significant issues |
| Minor | Nice to fix - code quality improvements |
| Info | Suggestions and observations |

## Output Format

```markdown
## Code Review: [File/PR]

### Summary
[Brief overall assessment]

**Recommendation:** Approve | Request Changes | Discuss

### Statistics
- Files reviewed: X
- Lines changed: +X / -Y
- Issues found: X critical, Y major, Z minor

### Critical Issues

#### Issue 1: [Title]
**File:** `path/to/file.ts:42`
**Problem:** [Description]
**Suggested Fix:** [Solution]
**Why:** [Explanation]

### Major Issues
...

### Minor Issues
...

### Highlights
Things done well:
- [Good practice 1]
- [Good practice 2]

### Checklist
- [ ] All critical issues addressed
- [ ] Tests added for new functionality
- [ ] Documentation updated
- [ ] No sensitive data exposed
```

## Related Skills
- `/test` - Add missing tests
- `/refactor` - Refactor issues found
