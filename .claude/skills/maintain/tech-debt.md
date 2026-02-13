# Skill: /tech-debt - Analyze Technical Debt

<command-name>tech-debt</command-name>

## Description
Analyzes the codebase for technical debt, categorizes issues, and creates a prioritized remediation plan.

## Usage
```
/tech-debt [scope]
```

## Options
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
- Monolithic components

### 3. Test Debt
- Low test coverage
- Missing integration tests
- Flaky tests
- Slow test suite
- Outdated test data

### 4. Dependency Debt
- Outdated packages
- Deprecated APIs
- Security vulnerabilities
- Unnecessary dependencies
- License issues

### 5. Documentation Debt
- Outdated documentation
- Missing API docs
- Undocumented decisions
- Incomplete README
- No contribution guide

### 6. Infrastructure Debt
- Manual deployments
- Missing monitoring
- No disaster recovery
- Inconsistent environments
- Hard-coded configs

## Output Format

```markdown
# Technical Debt Analysis

**Analyzed:** [date]
**Scope:** [files/directories analyzed]
**Health Score:** [X/100]

---

## Summary

| Category | Issues | Severity | Effort |
|----------|--------|----------|--------|
| Code Quality | 15 | High | Medium |
| Architecture | 5 | Critical | High |
| Test Coverage | 8 | Medium | Medium |
| Dependencies | 12 | High | Low |
| Documentation | 6 | Low | Low |

---

## Critical Issues

### 1. [Issue Title]
**Category:** Architecture
**Location:** `src/services/`
**Severity:** 🔴 Critical
**Effort:** High (2-3 weeks)

**Description:**
[Detailed description of the issue]

**Impact:**
- [Impact on development speed]
- [Impact on reliability]
- [Impact on security]

**Remediation:**
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Related Files:**
- `src/services/UserService.ts`
- `src/services/OrderService.ts`

---

### 2. [Issue Title]
...

---

## High Priority Issues

### 1. Outdated Dependencies
**Files Affected:** 12
**Security Vulnerabilities:** 3

| Package | Current | Latest | Severity |
|---------|---------|--------|----------|
| lodash | 4.17.15 | 4.17.21 | High |
| axios | 0.21.1 | 1.6.0 | Critical |

---

## Metrics

### Code Complexity
```
Average Complexity: 12.5 (target: < 10)
Files > 20 complexity: 8
Largest file: UserController.ts (45 complexity)
```

### Test Coverage
```
Overall: 62% (target: 80%)
Unit: 75%
Integration: 45%
E2E: 30%
```

### Duplication
```
Duplicate blocks: 23
Duplicate lines: 456
Worst offenders:
- utils/validators.ts (8 blocks)
- components/forms/ (6 blocks)
```

---

## Prioritized Action Plan

### Sprint 1: Quick Wins (Low effort, High impact)
- [ ] Update critical dependencies
- [ ] Add missing TypeScript types
- [ ] Remove dead code (estimated: 500 lines)

### Sprint 2-3: Code Quality
- [ ] Refactor UserController (complexity: 45 → 10)
- [ ] Extract shared validation logic
- [ ] Add missing unit tests for services

### Sprint 4-5: Architecture
- [ ] Introduce repository pattern
- [ ] Break circular dependencies
- [ ] Implement proper error handling

### Ongoing: Maintenance
- [ ] Weekly dependency updates
- [ ] Monthly architecture review
- [ ] Continuous documentation updates

---

## Tracking

### Metrics to Monitor
- Code coverage: Target 80% by Q2
- Avg complexity: Target < 10 by Q2
- Dependency age: No package > 6 months old

### Review Schedule
- Weekly: Dependency security scan
- Monthly: Code quality metrics
- Quarterly: Full tech debt review
```

## Integration

### Automated Detection
```yaml
# .github/workflows/tech-debt.yml
- name: Analyze Tech Debt
  run: |
    npx sonarqube-scanner
    npx dependency-cruiser --validate
    npx jscpd --blame
```

## Related Skills
- `/refactor` - Refactor identified issues
- `/dependency-update` - Update dependencies
- `/review` - Code review
