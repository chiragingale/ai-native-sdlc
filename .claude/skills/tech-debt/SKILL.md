---
name: tech-debt
description: Analyzes the codebase for technical debt, categorizes issues, and creates a prioritized remediation plan
---

## Usage
```
/tech-debt                      # Full codebase analysis
/tech-debt [directory]          # Analyze specific directory
/tech-debt --type [type]        # Focus on specific debt type
/tech-debt --priority           # Show prioritized action plan
```

## Tech Debt Categories

### 1. Code Quality Debt
- Complex functions (high cyclomatic complexity)
- Long methods/classes
- Code duplication
- Poor naming
- Missing documentation

### 2. Architecture Debt
- Tight coupling
- Circular dependencies
- Inconsistent patterns
- Missing abstractions

### 3. Test Debt
- Low test coverage
- Missing integration tests
- Flaky tests
- Slow test suite

### 4. Dependency Debt
- Outdated packages
- Deprecated APIs
- Security vulnerabilities
- Unnecessary dependencies

### 5. Documentation Debt
- Outdated documentation
- Missing API docs
- Undocumented decisions

### 6. Infrastructure Debt
- Manual deployments
- Missing monitoring
- Hard-coded configs

## Output Format

```markdown
# Technical Debt Analysis

**Analyzed:** [date]
**Scope:** [files/directories analyzed]
**Health Score:** [X/100]

## Summary

| Category | Issues | Severity | Effort |
|----------|--------|----------|--------|
| Code Quality | 15 | High | Medium |
| Architecture | 5 | Critical | High |
| Test Coverage | 8 | Medium | Medium |
| Dependencies | 12 | High | Low |

## Critical Issues

### 1. [Issue Title]
**Category:** Architecture
**Severity:** Critical
**Effort:** High (2-3 weeks)

**Description:** [Detailed description]
**Impact:** [Impact on development]
**Remediation:** [Steps to fix]

## Prioritized Action Plan

### Sprint 1: Quick Wins (Low effort, High impact)
- [ ] Update critical dependencies
- [ ] Remove dead code

### Sprint 2-3: Code Quality
- [ ] Refactor high-complexity functions
- [ ] Add missing unit tests

### Sprint 4-5: Architecture
- [ ] Break circular dependencies
- [ ] Implement proper error handling
```

## Related Skills
- `/refactor` - Refactor identified issues
- `/review` - Code review
