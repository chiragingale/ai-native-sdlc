# Quick Start

## Framework Structure

```text
claude-sdlc-framework/
├── CLAUDE.md                    # Project context file
├── README.md                    # Main documentation
├── INTEGRATION_GUIDE.md         # Detailed integration instructions
├── setup.sh                     # Interactive setup script
└── .claude/
    ├── settings.json            # Claude Code configuration
    ├── agents/                  # 7 Specialized Agents
    │   ├── pm-agent.md          # Product Manager
    │   ├── architect-agent.md   # Solution Architect
    │   ├── frontend-agent.md    # Frontend Developer
    │   ├── backend-agent.md     # Backend Developer
    │   ├── qa-agent.md          # QA Engineer
    │   ├── devops-agent.md      # DevOps Engineer
    │   └── tech-writer-agent.md # Technical Writer
    ├── skills/                  # 13 Skills across 6 SDLC phases
    │   ├── specify/             # /spec, /user-story, /interview
    │   ├── design/              # /architecture, /api-design
    │   ├── develop/             # /implement, /refactor
    │   ├── validate/            # /review, /test
    │   ├── release/             # /changelog, /deploy-checklist
    │   ├── maintain/            # /tech-debt
    │   └── team.md              # /team - Agent orchestration
    ├── templates/               # PR template, ADR template
    └── rules/                   # Code conventions
```

## Key Features

| Feature | Description |
|---|---|
| 6 SDLC Phases | Specify → Design → Develop → Validate → Release → Maintain |
| 7 Agents | Role-based AI personas with domain expertise |
| 13+ Skills | Slash commands for common workflows |
| Agent Teams | Multi-agent orchestration (`/team feature`, `/team bugfix`) |
| MCP Integration | GitHub, filesystem, memory servers |
| Templates | PRs, ADRs, and more |

## Integration Instructions

### New Repository

```bash
# Option 1: Run setup script
cd claude-sdlc-framework
./setup.sh

# Option 2: Manual
git clone <repo> my-project
cd my-project && rm -rf .git && git init
claude
```

### Existing Repository

```bash
# Copy framework files to your project
cp -r claude-sdlc-framework/.claude your-project/
cp claude-sdlc-framework/CLAUDE.md your-project/

# Merge with existing CLAUDE.md if needed
claude
```

## Quick Start Commands

```bash
# Specify phase
/spec "Add user authentication"
/interview "Payment system"

# Design phase
/architecture "Order management system"
/api-design "Users resource"

# Develop phase
/implement "User login with OAuth"
/refactor src/services/

# Validate phase
/review staged
/test src/features/auth

# Release phase
/changelog
/deploy-checklist production

# Maintain phase
/tech-debt

# Agent Teams
/team feature "Add dashboard analytics"
/team bugfix "Fix payment timeout"
```
