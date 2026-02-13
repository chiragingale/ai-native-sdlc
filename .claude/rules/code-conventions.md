# Code Conventions

These rules define the coding standards for this project. All code generated or modified should follow these conventions.

## General Principles

1. **Clarity over Cleverness**: Write code that is easy to understand, not code that shows off
2. **Consistency**: Follow existing patterns in the codebase
3. **Simplicity**: The simplest solution that works is often the best
4. **Testability**: Write code that can be easily tested

## Naming Conventions

### Variables and Functions
- Use camelCase for variables and functions
- Use descriptive names that indicate purpose
- Boolean variables should start with `is`, `has`, `can`, `should`
- Functions should start with a verb

```typescript
// Good
const isUserLoggedIn = true;
const userEmail = 'user@example.com';
function calculateTotalPrice() {}
function fetchUserData() {}

// Bad
const x = true;
const email = 'user@example.com';
function price() {}
function userData() {}
```

### Classes and Types
- Use PascalCase for classes, interfaces, types, and enums
- Interfaces should not be prefixed with `I`
- Use descriptive names that indicate what the class represents

```typescript
// Good
class UserService {}
interface UserProfile {}
type OrderStatus = 'pending' | 'completed';
enum PaymentMethod { CreditCard, PayPal }

// Bad
class userService {}
interface IUserProfile {}
type status = 'pending' | 'completed';
```

### Files and Directories
- Use kebab-case for file names
- Use PascalCase for component files (React/Vue)
- Group related files in directories

```
src/
├── services/
│   ├── user-service.ts
│   └── order-service.ts
├── components/
│   ├── UserProfile.tsx
│   └── OrderList.tsx
└── utils/
    └── format-date.ts
```

## Code Structure

### Function Length
- Functions should do one thing
- Maximum recommended length: 30-50 lines
- If a function is too long, extract helper functions

### Class Size
- Classes should have a single responsibility
- Maximum recommended methods: 10-15
- If a class is too large, split into smaller classes

### File Length
- Maximum recommended length: 300-400 lines
- If a file is too long, split into multiple files

## Error Handling

### Always Handle Errors
```typescript
// Good
try {
  await saveUser(user);
} catch (error) {
  logger.error('Failed to save user', { userId: user.id, error });
  throw new UserSaveError('Failed to save user', { cause: error });
}

// Bad
await saveUser(user); // Unhandled potential error
```

### Use Custom Error Classes
```typescript
class ValidationError extends Error {
  constructor(message: string, public field: string) {
    super(message);
    this.name = 'ValidationError';
  }
}
```

### Provide Context in Errors
```typescript
// Good
throw new Error(`Failed to fetch user with id ${userId}: ${error.message}`);

// Bad
throw new Error('Failed');
```

## Comments

### When to Comment
- Complex business logic
- Non-obvious workarounds with references
- Public API documentation

### When NOT to Comment
- Obvious code (self-documenting)
- Commented-out code (delete it)
- TODOs without tickets

```typescript
// Good - explains WHY
// Using setTimeout to allow the DOM to update before measuring
// See: https://github.com/org/repo/issues/123
setTimeout(() => measureElement(), 0);

// Bad - explains WHAT (obvious from code)
// Loop through users
for (const user of users) {}
```

## Testing

### Test Naming
```typescript
describe('UserService', () => {
  describe('createUser', () => {
    it('should create a user with valid data', () => {});
    it('should throw ValidationError when email is invalid', () => {});
    it('should hash password before saving', () => {});
  });
});
```

### Test Coverage
- Minimum coverage: 80%
- Critical paths: 100%
- New code: 90%+

## Git Commits

### Conventional Commits
```
type(scope): description

[optional body]

[optional footer]
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Formatting
- `refactor`: Code restructuring
- `test`: Adding tests
- `chore`: Maintenance

Examples:
```
feat(auth): add OAuth2 login support
fix(api): handle null response from external service
docs(readme): add installation instructions
```
