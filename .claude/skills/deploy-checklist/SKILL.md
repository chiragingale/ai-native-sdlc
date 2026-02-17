---
name: deploy-checklist
description: Generates and validates a pre-deployment checklist to ensure safe releases
---

## Usage
```
/deploy-checklist staging        # Staging deployment checklist
/deploy-checklist production     # Production deployment checklist
/deploy-checklist hotfix         # Hotfix deployment checklist
/deploy-checklist rollback       # Rollback checklist
```

## Output Format

```markdown
# Deployment Checklist: [Environment]

**Version:** [version]
**Date:** [date]
**Deployer:** [name]

---

## Pre-Deployment

### Code Readiness
- [ ] All tests passing in CI
- [ ] Code review approved
- [ ] No critical/high security vulnerabilities
- [ ] Feature flags configured for new features

### Database
- [ ] Migrations tested on staging
- [ ] Migrations are backward compatible
- [ ] Rollback migrations prepared
- [ ] Database backup scheduled/completed

### Configuration
- [ ] Environment variables updated
- [ ] Secrets rotated if needed
- [ ] Feature flags set correctly

---

## Deployment

### Execution
- [ ] Blue-green deployment configured
- [ ] Health checks configured
- [ ] Deployment timeout set

### Monitoring
- [ ] Dashboards open
- [ ] Log aggregation accessible

---

## Post-Deployment

### Verification
- [ ] Health endpoints responding
- [ ] Key user flows tested
- [ ] No error rate spike
- [ ] Performance metrics normal

---

## Rollback Criteria

Initiate rollback if ANY of these occur:
- [ ] Error rate > 5% for 5 minutes
- [ ] P95 latency > 2x baseline for 5 minutes
- [ ] Critical functionality broken
- [ ] Data corruption detected
```

## Related Skills
- `/changelog` - Generate changelog
- `/review` - Final code review
