# Skill: /refactor - Refactor Code

<command-name>refactor</command-name>

## Description
Refactors code to improve quality, maintainability, or performance while preserving behavior. Ensures tests pass before and after changes.

## Usage
```
/refactor [file or description]
```

## Options
```
/refactor [file]                    # General refactoring
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

## Common Refactoring Patterns

### Extract Function
Before:
```typescript
function processOrder(order: Order) {
  // 50 lines of validation
  // 30 lines of calculation
  // 20 lines of notification
}
```

After:
```typescript
function processOrder(order: Order) {
  validateOrder(order);
  const total = calculateOrderTotal(order);
  notifyOrderProcessed(order, total);
}
```

### Replace Conditional with Polymorphism
Before:
```typescript
function calculatePrice(type: string, base: number) {
  switch (type) {
    case 'standard': return base;
    case 'premium': return base * 1.5;
    case 'enterprise': return base * 2;
  }
}
```

After:
```typescript
interface PricingStrategy {
  calculate(base: number): number;
}

class StandardPricing implements PricingStrategy {
  calculate(base: number) { return base; }
}
// ... etc
```

### Introduce Parameter Object
Before:
```typescript
function createUser(
  name: string,
  email: string,
  age: number,
  role: string,
  department: string
) { ... }
```

After:
```typescript
interface CreateUserParams {
  name: string;
  email: string;
  age: number;
  role: string;
  department: string;
}

function createUser(params: CreateUserParams) { ... }
```

### Replace Magic Numbers
Before:
```typescript
if (retries > 3) { ... }
setTimeout(fn, 30000);
```

After:
```typescript
const MAX_RETRIES = 3;
const TIMEOUT_MS = 30_000;

if (retries > MAX_RETRIES) { ... }
setTimeout(fn, TIMEOUT_MS);
```

## Code Smells to Address

| Smell | Solution |
|-------|----------|
| Long Method | Extract into smaller functions |
| Large Class | Split into focused classes |
| Long Parameter List | Introduce parameter object |
| Duplicate Code | Extract shared function |
| Feature Envy | Move method to appropriate class |
| Data Clumps | Create data class |
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

### Follow-up Recommendations
- [Additional refactoring opportunities]
```

## Related Skills
- `/review` - Get code review
- `/test` - Add missing tests
- `/implement` - Implement features
