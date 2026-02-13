#!/bin/bash

# Claude SDLC Framework Setup Script
# This script sets up the Claude SDLC Framework in your project

set -e

FRAMEWORK_VERSION="1.0.0"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_header() {
    echo -e "${BLUE}"
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║         Claude SDLC Framework Setup v${FRAMEWORK_VERSION}              ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_step() {
    echo -e "${GREEN}▶ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
    echo -e "${RED}✖ $1${NC}"
}

print_success() {
    echo -e "${GREEN}✔ $1${NC}"
}

# Check if we're in a git repository
check_git() {
    if [ -d ".git" ]; then
        return 0
    else
        return 1
    fi
}

# Check if Claude Code is installed
check_claude_code() {
    if command -v claude &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Setup for new repository
setup_new_repo() {
    print_step "Setting up new repository..."

    TARGET_DIR="${1:-.}"

    if [ "$TARGET_DIR" != "." ]; then
        mkdir -p "$TARGET_DIR"
        cp -r "$SCRIPT_DIR/.claude" "$TARGET_DIR/"
        cp "$SCRIPT_DIR/CLAUDE.md" "$TARGET_DIR/"
        cd "$TARGET_DIR"
    fi

    if ! check_git; then
        git init
        print_success "Initialized git repository"
    fi

    # Create basic project structure
    mkdir -p src tests docs

    # Create .gitignore if not exists
    if [ ! -f ".gitignore" ]; then
        cat > .gitignore << 'EOF'
# Dependencies
node_modules/
vendor/
.venv/

# Build
dist/
build/
*.egg-info/

# Environment
.env
.env.local
.env.*.local

# IDE
.idea/
.vscode/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
*.log
logs/

# Coverage
coverage/
.nyc_output/
EOF
        print_success "Created .gitignore"
    fi

    print_success "New repository setup complete!"
}

# Setup for existing repository
setup_existing_repo() {
    print_step "Setting up in existing repository..."

    # Backup existing .claude if present
    if [ -d ".claude" ]; then
        print_warning "Existing .claude directory found"
        read -p "Backup and replace? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            mv .claude ".claude.backup.$(date +%Y%m%d%H%M%S)"
            print_success "Backed up existing .claude directory"
        else
            print_warning "Merging with existing configuration..."
            # Merge logic - copy missing files
            find "$SCRIPT_DIR/.claude" -type f | while read -r file; do
                target_file="${file#$SCRIPT_DIR/}"
                if [ ! -f "$target_file" ]; then
                    mkdir -p "$(dirname "$target_file")"
                    cp "$file" "$target_file"
                    print_success "Added $target_file"
                fi
            done
            return
        fi
    fi

    # Copy framework files
    cp -r "$SCRIPT_DIR/.claude" .

    # Handle CLAUDE.md
    if [ -f "CLAUDE.md" ]; then
        print_warning "Existing CLAUDE.md found"
        read -p "Append framework content? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "" >> CLAUDE.md
            echo "---" >> CLAUDE.md
            echo "" >> CLAUDE.md
            cat "$SCRIPT_DIR/CLAUDE.md" >> CLAUDE.md
            print_success "Appended framework content to CLAUDE.md"
        fi
    else
        cp "$SCRIPT_DIR/CLAUDE.md" .
        print_success "Created CLAUDE.md"
    fi

    print_success "Existing repository setup complete!"
}

# Interactive setup
interactive_setup() {
    print_header

    echo "This script will set up the Claude SDLC Framework in your project."
    echo ""

    # Check prerequisites
    print_step "Checking prerequisites..."

    if check_claude_code; then
        print_success "Claude Code is installed"
    else
        print_warning "Claude Code not found. Install with: npm install -g @anthropic-ai/claude-code"
    fi

    echo ""

    # Determine setup type
    if check_git; then
        echo "Detected existing git repository."
        read -p "Set up framework in current directory? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            setup_existing_repo
        else
            echo "Setup cancelled."
            exit 0
        fi
    else
        echo "No git repository detected."
        echo ""
        echo "Options:"
        echo "  1) Initialize new repository here"
        echo "  2) Create new repository in subdirectory"
        echo "  3) Cancel"
        echo ""
        read -p "Choose option (1-3): " -n 1 -r
        echo
        case $REPLY in
            1)
                setup_new_repo "."
                ;;
            2)
                read -p "Enter directory name: " dir_name
                setup_new_repo "$dir_name"
                ;;
            *)
                echo "Setup cancelled."
                exit 0
                ;;
        esac
    fi

    echo ""
    print_header
    echo -e "${GREEN}Setup complete!${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Run 'claude' to start Claude Code"
    echo "  2. Try '/spec' to create your first specification"
    echo "  3. Explore available skills with '/help sdlc'"
    echo ""
    echo "Documentation: https://github.com/your-org/claude-sdlc-framework"
    echo ""
}

# Main
case "${1:-}" in
    --new)
        setup_new_repo "${2:-.}"
        ;;
    --existing)
        setup_existing_repo
        ;;
    --help|-h)
        echo "Claude SDLC Framework Setup"
        echo ""
        echo "Usage: ./setup.sh [option]"
        echo ""
        echo "Options:"
        echo "  (none)      Interactive setup"
        echo "  --new       Set up new repository"
        echo "  --existing  Set up in existing repository"
        echo "  --help      Show this help"
        ;;
    *)
        interactive_setup
        ;;
esac
