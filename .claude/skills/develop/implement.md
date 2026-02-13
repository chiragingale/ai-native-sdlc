# Skill: /implement - Implement Feature

<command-name>implement</command-name>

## Description
Implements a feature or task following the codebase patterns, architectural guidelines, and best practices. Uses the appropriate Developer Agent (Frontend/Backend) based on the task.

## Usage
```
/implement [task description or user story reference]
```

## Options
```
/implement [description]              # Auto-detect frontend/backend
/implement frontend [description]     # Frontend implementation
/implement backend [description]      # Backend implementation
/implement fullstack [description]    # Both frontend and backend
```

## Workflow

### 1. Context Analysis
- Read existing codebase patterns
- Identify related files and components
- Understand architectural constraints

### 2. Implementation Plan
- List files to create/modify
- Define the implementation approach
- Identify potential risks

### 3. Implementation
- Write code following project patterns
- Add appropriate error handling
- Include inline documentation

### 4. Testing
- Write unit tests for new code
- Ensure existing tests pass
- Add integration tests if needed

### 5. Documentation
- Update API docs if needed
- Add JSDoc/docstrings
- Update README if relevant

## Implementation Checklist

### Before Starting
- [ ] Read the specification/user story
- [ ] Understand existing patterns
- [ ] Identify affected files
- [ ] Check for dependencies

### During Implementation
- [ ] Follow project coding standards
- [ ] Handle edge cases
- [ ] Add error handling
- [ ] Write self-documenting code

### After Implementation
- [ ] Run linter
- [ ] Run tests
- [ ] Review own code
- [ ] Update documentation

## Code Quality Standards

### General
- Meaningful variable/function names
- Single responsibility principle
- DRY (Don't Repeat Yourself)
- KISS (Keep It Simple)

### Error Handling
- Validate inputs at boundaries
- Provide meaningful error messages
- Log errors appropriately
- Fail fast, recover gracefully

### Testing
- Test public interfaces
- Cover edge cases
- Mock external dependencies
- Keep tests focused

## Output Format

```markdown
## Implementation Summary

### Files Created
- `path/to/new/file.ts` - [Description]

### Files Modified
- `path/to/existing/file.ts` - [What changed]

### Changes Made
1. [Change 1 description]
2. [Change 2 description]

### Testing
- Added unit tests in `path/to/tests`
- All tests passing

### Notes
- [Any important notes or follow-up items]
```

## Examples

### Example 1: Backend Feature
```
/implement Add rate limiting middleware for API endpoints
```

### Example 2: Frontend Feature
```
/implement Create a reusable data table component with sorting and pagination
```

### Example 3: Full Stack
```
/implement fullstack User can update their profile photo
```

## Related Skills
- `/spec` - Get feature specification
- `/architecture` - Design architecture first
- `/review` - Request code review
- `/test` - Generate additional tests
