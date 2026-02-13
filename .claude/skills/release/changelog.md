# Skill: /changelog - Generate Changelog

<command-name>changelog</command-name>

## Description
Generates a changelog from git commits and pull requests, following Keep a Changelog format and Semantic Versioning.

## Usage
```
/changelog [version or range]
```

## Options
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
- Export functionality for reports ([#125](link))

### Changed
- Improved dashboard loading performance ([#124](link))

### Fixed
- Login redirect issue on mobile ([#126](link))

## [1.2.0] - 2024-01-15

### Added
- User authentication system ([#100](link)) - @contributor
- REST API for resources ([#102](link)) - @contributor

### Changed
- Updated Node.js to v20 ([#103](link))
- Migrated from Express to Fastify ([#105](link))

### Deprecated
- Legacy `/api/v1/old-endpoint` will be removed in v2.0

### Removed
- Support for Node.js 16 ([#104](link))

### Fixed
- Memory leak in background worker ([#106](link))
- Incorrect timezone handling ([#107](link))

### Security
- Updated dependencies to fix CVE-2024-XXXX ([#108](link))

## [1.1.0] - 2024-01-01

### Added
- Initial release

---

[Unreleased]: https://github.com/org/repo/compare/v1.2.0...HEAD
[1.2.0]: https://github.com/org/repo/compare/v1.1.0...v1.2.0
[1.1.0]: https://github.com/org/repo/releases/tag/v1.1.0
```

## Version Recommendation

Based on commits, I'll suggest the next version:

```markdown
## Version Analysis

### Commits Since Last Release
- feat: 3 (new features)
- fix: 5 (bug fixes)
- BREAKING: 0

### Recommended Version
Current: 1.2.0
Suggested: **1.3.0** (MINOR - new features, no breaking changes)

### Rationale
- New features added (feat commits)
- No breaking changes
- Bug fixes included
```

## Integration with CI/CD

### GitHub Release
```yaml
# .github/workflows/release.yml
- name: Generate Changelog
  run: |
    claude /changelog ${{ github.ref_name }} > RELEASE_NOTES.md

- name: Create Release
  uses: softprops/action-gh-release@v1
  with:
    body_path: RELEASE_NOTES.md
```

## Related Skills
- `/release-notes` - User-facing release notes
- `/commit` - Create conventional commits
- `/deploy-checklist` - Pre-deployment validation
