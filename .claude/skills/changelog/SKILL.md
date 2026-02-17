---
name: changelog
description: Generates a changelog from git commits and pull requests, following Keep a Changelog format and Semantic Versioning
---

## Usage
```
/changelog                      # Changes since last tag
/changelog v1.2.0               # Changes for specific version
/changelog v1.1.0..v1.2.0       # Changes between versions
/changelog --unreleased         # All unreleased changes
/changelog --pr                 # Include PR descriptions
```

## Workflow

### 1. Analyze Commits
- Parse conventional commits
- Identify breaking changes
- Group by type

### 2. Determine Version
- MAJOR: Breaking changes
- MINOR: New features
- PATCH: Bug fixes

### 3. Generate Changelog
- Format entries
- Link to PRs/issues
- Credit contributors

## Conventional Commit Types

| Type | Section | Example |
|------|---------|---------|
| feat | Added | `feat: add user profile` |
| fix | Fixed | `fix: resolve login issue` |
| docs | Documentation | `docs: update API docs` |
| perf | Performance | `perf: optimize query` |
| refactor | Changed | `refactor: simplify auth` |
| test | Tests | `test: add unit tests` |
| build | Build | `build: update deps` |
| ci | CI/CD | `ci: add deploy step` |
| BREAKING CHANGE | Breaking | `feat!: new API format` |

## Output Format

```markdown
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- New user profile page ([#123](link))

### Changed
- Improved dashboard loading performance ([#124](link))

### Fixed
- Login redirect issue on mobile ([#126](link))

## [1.2.0] - 2024-01-15

### Added
- User authentication system ([#100](link)) - @contributor

### Security
- Updated dependencies to fix CVE-2024-XXXX ([#108](link))
```

## Related Skills
- `/deploy-checklist` - Pre-deployment validation
