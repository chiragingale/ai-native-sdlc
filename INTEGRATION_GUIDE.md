# Claude SDLC Framework Integration Guide

This guide provides detailed instructions for integrating the Claude SDLC Framework into new and existing repositories.

## Table of Contents
- [Prerequisites](#prerequisites)
- [New Repository Setup](#new-repository-setup)
- [Existing Repository Setup](#existing-repository-setup)
- [Configuration](#configuration)
- [Customization](#customization)
- [CI/CD Integration](#cicd-integration)
- [Team Onboarding](#team-onboarding)

---

## Prerequisites

### Required
- **Claude Code CLI**: Install with `npm install -g @anthropic-ai/claude-code`
- **Git**: Version control
- **Node.js 18+**: For MCP servers (if using)

### Recommended
- **GitHub CLI** (`gh`): For PR automation
- **VS Code** or **Cursor**: IDE with Claude Code integration

### Environment Variables
```bash
# Required for GitHub integration
export GITHUB_TOKEN="your-github-token"

# Optional - for additional MCP servers
export JIRA_URL="https://your-org.atlassian.net"
export JIRA_TOKEN="your-jira-token"
export SLACK_TOKEN="xoxb-your-slack-token"
```

---

## New Repository Setup

### Option 1: Clone Template (Recommended)

```bash
# Clone the framework as a template
git clone https://github.com/your-org/claude-sdlc-framework.git my-new-project
cd my-new-project

# Remove template git history
rm -rf .git

# Initialize fresh repository
git init
git add .
git commit -m "Initial commit with Claude SDLC Framework"

# Start Claude Code
claude
```

### Option 2: Manual Setup

```bash
# Create new directory
mkdir my-new-project
cd my-new-project
git init

# Create directory structure
mkdir -p .claude/{agents,skills/{specify,design,develop,validate,release,maintain},templates,rules,examples}
mkdir -p src tests docs

# Download framework files
curl -sL https://raw.githubusercontent.com/your-org/claude-sdlc-framework/main/CLAUDE.md -o CLAUDE.md
curl -sL https://raw.githubusercontent.com/your-org/claude-sdlc-framework/main/.claude/settings.json -o .claude/settings.json

# Download agents
for agent in pm architect frontend backend qa devops tech-writer; do
  curl -sL "https://raw.githubusercontent.com/your-org/claude-sdlc-framework/main/.claude/agents/${agent}-agent.md" \
    -o ".claude/agents/${agent}-agent.md"
done

# Download skills (example for specify phase)
for skill in spec user-story interview; do
  curl -sL "https://raw.githubusercontent.com/your-org/claude-sdlc-framework/main/.claude/skills/specify/${skill}.md" \
    -o ".claude/skills/specify/${skill}.md"
done

# Commit
git add .
git commit -m "Add Claude SDLC Framework"
```

### Option 3: Setup Script

```bash
# Download and run setup script
curl -sL https://raw.githubusercontent.com/your-org/claude-sdlc-framework/main/setup.sh | bash
```

---

## Existing Repository Setup

### Step 1: Backup Existing Configuration

```bash
# If you have existing Claude Code configuration
if [ -d ".claude" ]; then
  cp -r .claude .claude.backup
fi

if [ -f "CLAUDE.md" ]; then
  cp CLAUDE.md CLAUDE.md.backup
fi
```

### Step 2: Copy Framework Files

```bash
# Download and extract framework
curl -sL https://github.com/your-org/claude-sdlc-framework/archive/main.tar.gz | \
  tar -xz --strip-components=1 claude-sdlc-framework-main/.claude claude-sdlc-framework-main/CLAUDE.md
```

### Step 3: Merge Configuration

If you have existing `.claude/settings.json`:

```bash
# View current settings
cat .claude.backup/settings.json

# Merge manually or use jq
jq -s '.[0] * .[1]' .claude.backup/settings.json .claude/settings.json > .claude/settings.merged.json
mv .claude/settings.merged.json .claude/settings.json
```

### Step 4: Merge CLAUDE.md

If you have existing project context:

```bash
# Append framework content to existing CLAUDE.md
cat CLAUDE.md.backup > CLAUDE.md
echo -e "\n---\n" >> CLAUDE.md
cat claude-sdlc-framework-main/CLAUDE.md >> CLAUDE.md
```

### Step 5: Customize for Your Project

Edit `CLAUDE.md` to include project-specific context:

```markdown
# [Your Project Name]

## Project Overview
[Description of your project]

## Tech Stack
- Frontend: [React/Vue/Angular]
- Backend: [Node.js/Python/Go]
- Database: [PostgreSQL/MongoDB]
- Infrastructure: [AWS/GCP/Azure]

## Key Directories
- `/src/api` - API endpoints
- `/src/services` - Business logic
- `/src/components` - UI components

## Development Workflow
[Your team's workflow]

---

# Claude SDLC Framework
[Framework content follows]
```

---

## Configuration

### MCP Servers

Configure Model Context Protocol servers in `.claude/settings.json`:

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "."],
      "description": "File system access"
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_TOKEN": "${GITHUB_TOKEN}"
      },
      "description": "GitHub API integration"
    },
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres"],
      "env": {
        "DATABASE_URL": "${DATABASE_URL}"
      },
      "description": "PostgreSQL database access"
    },
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"],
      "description": "Persistent memory across sessions"
    }
  }
}
```

### Permissions

Configure allowed and denied commands:

```json
{
  "permissions": {
    "allow": [
      "Bash(npm:*)",
      "Bash(yarn:*)",
      "Bash(git:*)",
      "Bash(gh:*)",
      "Bash(docker:*)",
      "Read",
      "Glob",
      "Grep",
      "Edit",
      "Write"
    ],
    "deny": [
      "Bash(rm -rf /)",
      "Bash(*--force*)",
      "Bash(*sudo*)",
      "Bash(*DROP TABLE*)"
    ]
  }
}
```

---

## Customization

### Adding Custom Skills

Create a new skill file:

```bash
# Create skill file
cat > .claude/skills/develop/my-skill.md << 'EOF'
# Skill: /my-skill - Description

<command-name>my-skill</command-name>

## Description
What this skill does.

## Usage
```
/my-skill [arguments]
```

## Workflow
1. Step 1
2. Step 2

## Output Format
Expected output format.

## Examples
```
/my-skill example-argument
```
EOF
```

### Adding Custom Agents

Create a new agent file:

```bash
cat > .claude/agents/custom-agent.md << 'EOF'
# Custom Agent Name

## Role
Description of the agent's expertise and responsibilities.

## Responsibilities
- Responsibility 1
- Responsibility 2

## Communication Style
How this agent communicates.

## Output Formats
Templates for outputs.

## Collaboration
How this agent works with other agents.
EOF
```

### Adding Project Rules

Create rule files:

```bash
cat > .claude/rules/security.md << 'EOF'
# Security Rules

1. Never commit secrets to code
2. Always validate user input
3. Use parameterized queries
4. Implement rate limiting
5. Log security events
EOF
```

---

## CI/CD Integration

### GitHub Actions

```yaml
# .github/workflows/claude-assist.yml
name: Claude Code Assistance

on:
  pull_request:
    types: [opened, synchronize]
  issues:
    types: [opened, labeled]

jobs:
  analyze-pr:
    if: github.event_name == 'pull_request'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Setup Claude Code
        run: npm install -g @anthropic-ai/claude-code

      - name: Analyze PR
        env:
          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
        run: |
          claude "/review pr ${{ github.event.pull_request.number }}" \
            --output pr-review.md

      - name: Comment on PR
        uses: actions/github-script@v7
        with:
          script: |
            const fs = require('fs');
            const review = fs.readFileSync('pr-review.md', 'utf8');
            github.rest.issues.createComment({
              owner: context.repo.owner,
              repo: context.repo.repo,
              issue_number: context.issue.number,
              body: review
            });
```

### Pre-commit Hook

```bash
# .husky/pre-commit
#!/bin/sh
. "$(dirname "$0")/_/husky.sh"

# Run Claude Code review on staged files
claude "/review staged" --format json > /tmp/review.json

# Check for critical issues
if jq -e '.issues[] | select(.severity == "critical")' /tmp/review.json > /dev/null; then
  echo "Critical issues found. Please fix before committing."
  jq '.issues[] | select(.severity == "critical")' /tmp/review.json
  exit 1
fi
```

---

## Team Onboarding

### Quick Start Guide for Team Members

1. **Install Claude Code**
   ```bash
   npm install -g @anthropic-ai/claude-code
   ```

2. **Set up API key**
   ```bash
   export ANTHROPIC_API_KEY="your-key"
   ```

3. **Clone and start**
   ```bash
   git clone [repo-url]
   cd [repo-name]
   claude
   ```

4. **Try your first skill**
   ```
   /spec Hello World feature
   ```

### Common Workflows

#### Starting a New Feature
```bash
# 1. Create specification
/spec "Feature description"

# 2. Design architecture
/architecture "Feature name"

# 3. Implement
/implement "Feature based on spec"

# 4. Test
/test src/features/new-feature

# 5. Review
/review staged
```

#### Fixing a Bug
```bash
# 1. Analyze and fix
/team bugfix "Bug description"

# Or step by step:
# 1. Investigate
"Analyze this bug: [description]"

# 2. Implement fix
/implement "Fix for [bug]"

# 3. Add regression test
/test "Add regression test for [bug]"
```

#### Code Review
```bash
# Review PR
/review pr 123

# Review specific file
/review src/services/user-service.ts

# Security-focused review
/review security src/api/
```

### Tips for Effective Usage

1. **Be specific**: Provide context and details in your requests
2. **Use skills**: Skills are optimized for common tasks
3. **Leverage agents**: Let specialized agents handle their domains
4. **Iterate**: Review outputs and provide feedback for refinement
5. **Check CLAUDE.md**: Project context helps Claude understand your codebase

---

## Troubleshooting

### Common Issues

#### Skills not recognized
- Ensure skill file has `<command-name>` tag
- Check file is in correct `.claude/skills/[phase]/` directory
- Restart Claude Code session

#### MCP servers not connecting
- Verify environment variables are set
- Check server is installed: `npx @modelcontextprotocol/server-[name] --help`
- Review logs: `claude --debug`

#### Context not loading
- Ensure CLAUDE.md is in project root
- Check file permissions
- Verify file is valid markdown

### Getting Help

- **Documentation**: See README.md
- **Issues**: https://github.com/your-org/claude-sdlc-framework/issues
- **Claude Code Help**: Run `/help` in Claude Code

---

## Version Compatibility

| Framework Version | Claude Code Version | Node.js |
|------------------|---------------------|---------|
| 1.0.x | 1.0.0+ | 18+ |

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on contributing to the framework.
