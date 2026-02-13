# Skill: /review - Code Review

<command-name>review</command-name>

## Description
Performs a comprehensive code review using the QA Agent persona. Analyzes code for bugs, security issues, performance problems, and best practice violations.

## Usage
```
/review [file, PR number, or description]
```

## Options
```
/review [file]                  # Review specific file
/review pr [number]             # Review pull request
/review staged                  # Review staged changes
/review diff                    # Review uncommitted changes
/review security [file]         # Security-focused review
/review performance [file]      # Performance-focused review
```

## Review Categories

### 1. Correctness
- Logic errors
- Off-by-one errors
- Null/undefined handling
- Edge cases
- Race conditions

### 2. Security
- Input validation
- Authentication/authorization
- Injection vulnerabilities
- Sensitive data exposure
- Cryptographic issues

### 3. Performance
- N+1 queries
- Memory leaks
- Unnecessary computations
- Missing caching
- Blocking operations

### 4. Code Quality
- Readability
- Maintainability
- DRY violations
- SOLID principles
- Naming conventions

### 5. Testing
- Test coverage
- Test quality
- Edge case coverage
- Mock appropriateness

## Severity Levels

| Level | Icon | Meaning |
|-------|------|---------|
| Critical | 🔴 | Must fix before merge - security/data issues |
| Major | 🟠 | Should fix - bugs or significant issues |
| Minor | 🟡 | Nice to fix - code quality improvements |
| Info | 🔵 | Suggestions and observations |

## Output Format

```markdown
## Code Review: [File/PR]

### Summary
[Brief overall assessment]

**Recommendation:** ✅ Approve | ⚠️ Request Changes | 💬 Discuss

### Statistics
- Files reviewed: X
- Lines changed: +X / -Y
- Issues found: X critical, Y major, Z minor

---

### 🔴 Critical Issues

#### Issue 1: [Title]
**File:** `path/to/file.ts:42`

**Problem:**
[Description of the issue]

```typescript
// Current code
const query = `SELECT * FROM users WHERE id = ${userId}`;
```

**Suggested Fix:**
```typescript
// Use parameterized query
const query = 'SELECT * FROM users WHERE id = $1';
const result = await db.query(query, [userId]);
```

**Why:** SQL injection vulnerability allows attackers to...

---

### 🟠 Major Issues

#### Issue 1: [Title]
**File:** `path/to/file.ts:78`

**Problem:**
[Description]

**Suggested Fix:**
[Solution]

---

### 🟡 Minor Issues

#### Issue 1: [Title]
**File:** `path/to/file.ts:105`

**Suggestion:**
[Improvement suggestion]

---

### 🔵 Observations

- [Positive observation or minor suggestion]
- [Architecture note]

---

### ✨ Highlights
Things done well:
- [Good practice 1]
- [Good practice 2]

### 📋 Checklist
- [ ] All critical issues addressed
- [ ] Tests added for new functionality
- [ ] Documentation updated
- [ ] No sensitive data exposed
```

## Security Review Checklist

### Authentication & Authorization
- [ ] Authentication required where needed
- [ ] Authorization checks in place
- [ ] Session handling secure
- [ ] Token validation correct

### Input Handling
- [ ] All inputs validated
- [ ] SQL injection prevented
- [ ] XSS prevented
- [ ] Command injection prevented

### Data Protection
- [ ] Sensitive data encrypted
- [ ] PII handled properly
- [ ] Secrets not in code
- [ ] Logging doesn't expose sensitive data

### API Security
- [ ] Rate limiting in place
- [ ] CORS configured correctly
- [ ] HTTPS enforced
- [ ] Error messages don't leak info

## Performance Review Checklist

### Database
- [ ] No N+1 queries
- [ ] Indexes used appropriately
- [ ] Queries optimized
- [ ] Connection pooling used

### Memory
- [ ] No memory leaks
- [ ] Large objects handled properly
- [ ] Streams used for large data
- [ ] Caching implemented

### Async Operations
- [ ] Proper async/await usage
- [ ] Parallel where possible
- [ ] Timeouts configured
- [ ] Error handling for async

## Related Skills
- `/test` - Add missing tests
- `/security-scan` - Deep security analysis
- `/refactor` - Refactor issues found
