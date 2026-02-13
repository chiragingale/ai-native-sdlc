# Skill: /deploy-checklist - Pre-Deployment Validation

<command-name>deploy-checklist</command-name>

## Description
Generates and validates a pre-deployment checklist to ensure safe releases. Uses DevOps Agent persona.

## Usage
```
/deploy-checklist [environment]
```

## Options
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
- [ ] No console.log/debug statements

### Database
- [ ] Migrations tested on staging
- [ ] Migrations are backward compatible
- [ ] Rollback migrations prepared
- [ ] Database backup scheduled/completed
- [ ] Index changes reviewed for performance

### Configuration
- [ ] Environment variables updated
- [ ] Secrets rotated if needed
- [ ] Feature flags set correctly
- [ ] Third-party API keys valid

### Dependencies
- [ ] No deprecated dependencies
- [ ] Security vulnerabilities addressed
- [ ] License compliance verified

### Documentation
- [ ] Changelog updated
- [ ] API documentation current
- [ ] Runbook updated if needed

---

## Deployment

### Timing
- [ ] Deployment window confirmed
- [ ] Team availability verified
- [ ] On-call engineer notified
- [ ] Stakeholders informed

### Execution
- [ ] Blue-green deployment configured
- [ ] Canary percentage set (if applicable)
- [ ] Health checks configured
- [ ] Deployment timeout set

### Monitoring
- [ ] Dashboards open
- [ ] Alerts temporarily adjusted if needed
- [ ] Log aggregation accessible

---

## Post-Deployment

### Verification
- [ ] Health endpoints responding
- [ ] Key user flows tested
- [ ] API responses correct
- [ ] No error rate spike
- [ ] Performance metrics normal

### Monitoring (15 min post-deploy)
- [ ] Error rate < baseline
- [ ] Latency p95 < threshold
- [ ] No memory leaks
- [ ] Database connections stable

### Communication
- [ ] Status page updated
- [ ] Team notified of completion
- [ ] Stakeholders informed

---

## Rollback Criteria

Initiate rollback if ANY of these occur:
- [ ] Error rate > 5% for 5 minutes
- [ ] P95 latency > 2x baseline for 5 minutes
- [ ] Critical functionality broken
- [ ] Data corruption detected
- [ ] Security incident identified

### Rollback Steps
1. Trigger rollback in deployment system
2. Verify previous version healthy
3. Notify team and stakeholders
4. Create incident report
5. Schedule post-mortem

---

## Sign-offs

| Role | Name | Approved | Time |
|------|------|----------|------|
| Engineering Lead | | [ ] | |
| QA Lead | | [ ] | |
| Product Owner | | [ ] | |
| On-call Engineer | | [ ] | |

---

## Notes
[Any deployment-specific notes]
```

## Environment-Specific Checklists

### Production Additional Items
- [ ] Traffic routing plan confirmed
- [ ] CDN cache invalidation scheduled
- [ ] Customer support notified
- [ ] Marketing aware (if user-facing changes)

### Hotfix Additional Items
- [ ] Incident ticket linked
- [ ] Root cause identified
- [ ] Fix verified on staging
- [ ] Post-fix monitoring plan

## Automated Checks

The following are verified automatically:
```yaml
automated_checks:
  - ci_status: passing
  - security_scan: clean
  - test_coverage: ">= 80%"
  - lighthouse_score: ">= 90"
  - bundle_size: "<= baseline + 5%"
```

## Related Skills
- `/changelog` - Generate changelog
- `/release-notes` - Create release notes
- `/review` - Final code review
