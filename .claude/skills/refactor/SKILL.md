---
name: refactor
description: Refactors code to improve quality, maintainability, or performance while preserving behavior
---

## Usage
```
/refactor [file or description]
/refactor extract [file]            # Extract functions/components
/refactor simplify [file]           # Reduce complexity
/refactor modernize [file]          # Update to modern patterns
/refactor performance [file]        # Optimize performance
/refactor dry [file]                # Remove duplication
```

## Refactoring Workflow

### 1. Safety First
- Run existing tests
- Ensure all tests pass
- Identify test coverage gaps

### 2. Analyze Code
- Identify code smells
- Measure complexity
- Find duplication

### 3. Plan Refactoring
- List specific changes
- Order changes by risk
- Identify test needs

### 4. Execute
- Make small, incremental changes
- Run tests after each change
- Commit frequently

### 5. Verify
- All tests still pass
- Behavior unchanged
- Code quality improved

## Code Smells to Address

| Smell | Solution |
|-------|----------|
| Long Method | Extract into smaller functions |
| Large Class | Split into focused classes |
| Long Parameter List | Introduce parameter object |
| Duplicate Code | Extract shared function |
| Feature Envy | Move method to appropriate class |
| Primitive Obsession | Introduce value objects |
| Switch Statements | Use polymorphism |
| Speculative Generality | Remove unused abstractions |
| Dead Code | Delete it |

## Output Format

```markdown
## Refactoring Summary: [File/Component]

### Code Smells Identified
1. [Smell 1] - [Location]
2. [Smell 2] - [Location]

### Changes Made
1. **[Change Type]**: [Description]
   - Before: [Brief description]
   - After: [Brief description]
   - Reason: [Why this improves the code]

### Metrics
| Metric | Before | After |
|--------|--------|-------|
| Lines of Code | X | Y |
| Cyclomatic Complexity | X | Y |
| Functions | X | Y |

### Tests
- [ ] All existing tests pass
- [ ] Added tests for [new function]
```

## Related Skills
- `/review` - Get code review
- `/test` - Add missing tests
- `/implement` - Implement features
