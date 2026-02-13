# Claude SDLC Framework

This repository uses an AI-native SDLC framework powered by Claude Code with specialized agents, skills, and automation.

## Framework Overview

This framework implements a comprehensive AI-powered Software Development Lifecycle with:
- **6 SDLC Phases**: Specify → Design → Develop → Validate → Release → Maintain
- **Specialized Agents**: Role-based AI personas for different tasks
- **Skills**: Auto-loaded context and capabilities based on task type
- **Templates**: Standardized outputs for consistency
- **Rules**: Architectural constraints and conventions

## Directory Structure

```
.claude/
├── settings.json          # Claude Code configuration
├── agents/                # Specialized agent configurations
│   ├── pm-agent.md       # Product Manager Agent
│   ├── architect-agent.md # Solution Architect Agent
│   ├── frontend-agent.md # Frontend Developer Agent
│   ├── backend-agent.md  # Backend Developer Agent
│   ├── qa-agent.md       # QA Engineer Agent
│   ├── devops-agent.md   # DevOps Engineer Agent
│   └── tech-writer-agent.md # Technical Writer Agent
├── skills/                # Task-specific skills
│   ├── specify/          # Specification phase skills
│   ├── design/           # Design phase skills
│   ├── develop/          # Development phase skills
│   ├── validate/         # Validation phase skills
│   ├── release/          # Release phase skills
│   └── maintain/         # Maintenance phase skills
├── templates/             # Output templates
├── rules/                 # Architectural rules and constraints
└── examples/              # Reference implementations
```

## Quick Commands

### Specification Phase
- `/spec` - Generate a feature specification
- `/user-story` - Create user stories with acceptance criteria
- `/interview` - Interactive spec gathering mode

### Design Phase
- `/architecture` - Generate architecture diagrams and docs
- `/api-design` - Design REST/GraphQL API contracts
- `/ui-spec` - Create UI/UX specifications

### Development Phase
- `/implement` - Implement a feature with full context
- `/refactor` - Refactor code following patterns
- `/migrate` - Migrate code to new patterns/frameworks

### Validation Phase
- `/review` - Comprehensive code review
- `/test` - Generate and run tests
- `/security-scan` - Security vulnerability analysis

### Release Phase
- `/changelog` - Generate changelog from commits
- `/release-notes` - Create release documentation
- `/deploy-checklist` - Pre-deployment validation

### Maintenance Phase
- `/tech-debt` - Analyze and prioritize tech debt
- `/dependency-update` - Upgrade dependencies safely
- `/docs-sync` - Sync documentation with code

## Agent Teams

### Feature Development Team
Agents: PM → Architect → Developer → QA → Tech Writer
Use: `/team feature "Feature description"`

### Bug Fix Team
Agents: QA → Developer → QA
Use: `/team bugfix "Bug description"`

### Maintenance Team
Agents: DevOps → Developer → QA
Use: `/team maintain "Maintenance task"`

## Conventions

### Git
- Commit format: `type(scope): description` (Conventional Commits)
- Branch naming: `feature/`, `bugfix/`, `hotfix/`, `release/`
- PR titles must match commit convention

### Code Style
- Follow existing patterns in the codebase
- Document public APIs
- Write tests for new functionality
- Keep functions focused and small

### Documentation
- ADRs in `/docs/adr/`
- API docs auto-generated
- README updated with major changes

## Context Files

When working on this project, Claude will automatically load:
- This CLAUDE.md file
- Relevant skill files based on task
- Agent configurations when using agent commands
- Project-specific rules from `.claude/rules/`

## Getting Help

- `/help sdlc` - Show SDLC framework help
- `/help agents` - List available agents
- `/help skills` - List available skills
