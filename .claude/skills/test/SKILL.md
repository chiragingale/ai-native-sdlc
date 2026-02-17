---
name: test
description: Generates comprehensive tests for code, runs existing tests, and analyzes test coverage
---

## Usage
```
/test [file or function to test]
/test run                       # Run all tests
/test run [pattern]             # Run specific tests
/test coverage                  # Run with coverage report
/test e2e [flow]               # Generate E2E test
/test api [endpoint]           # Generate API test
/test missing                  # Identify untested code
```

## Test Generation Workflow

### 1. Analyze Code
- Identify public interfaces
- Find branches and conditions
- Detect edge cases
- Note dependencies to mock

### 2. Generate Test Cases
- Happy path tests
- Edge case tests
- Error handling tests
- Boundary tests

### 3. Write Tests
- Follow project test patterns
- Use appropriate mocking
- Keep tests focused
- Add descriptive names

### 4. Verify
- All tests pass
- Coverage improved
- No flaky tests

## Test Patterns

### Unit Test Pattern
```typescript
describe('[UnitName]', () => {
  describe('[methodName]', () => {
    describe('when [condition]', () => {
      it('should [expected behavior]', () => {
        // Arrange
        const input = createTestInput();

        // Act
        const result = sut.methodName(input);

        // Assert
        expect(result).toEqual(expectedOutput);
      });
    });
  });
});
```

### Integration Test Pattern
```typescript
describe('API: /api/v1/resource', () => {
  describe('POST /', () => {
    it('should create resource with valid data', async () => {
      const response = await request(app)
        .post('/api/v1/resource')
        .send({ name: 'Test' })
        .expect(201);

      expect(response.body).toMatchObject({
        id: expect.any(String),
        name: 'Test',
      });
    });
  });
});
```

### E2E Test Pattern (Playwright)
```typescript
test.describe('User Flow: [Flow Name]', () => {
  test('should complete [action] successfully', async ({ page }) => {
    await page.goto('/');
    await page.click('[data-testid="nav-link"]');
    await page.fill('[data-testid="input-name"]', 'Test Value');
    await page.click('[data-testid="submit"]');
    await expect(page.locator('[data-testid="success"]')).toBeVisible();
  });
});
```

## Output Format

```markdown
## Test Generation Report: [File/Feature]

### Analysis
- Functions identified: X
- Branches identified: Y
- Current coverage: Z%

### Tests Generated

#### [test-file-name].test.ts
[Generated test code]

### Test Cases

| Test | Type | Description |
|------|------|-------------|
| should create with valid input | Unit | Happy path |
| should throw for null input | Unit | Error |
| should handle empty array | Unit | Edge case |

### Coverage Impact
- Before: X%
- After: Y%
- New lines covered: Z
```

## Related Skills
- `/review` - Review code and tests
- `/implement` - Implement test fixes
