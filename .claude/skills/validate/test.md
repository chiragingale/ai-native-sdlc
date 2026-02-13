# Skill: /test - Generate and Run Tests

<command-name>test</command-name>

## Description
Generates comprehensive tests for code, runs existing tests, and analyzes test coverage. Uses the QA Agent persona.

## Usage
```
/test [file or function to test]
```

## Options
```
/test [file]                    # Generate tests for file
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
  // Setup
  let sut: SystemUnderTest;
  let mockDep: jest.Mocked<Dependency>;

  beforeEach(() => {
    mockDep = createMock<Dependency>();
    sut = new SystemUnderTest(mockDep);
  });

  describe('[methodName]', () => {
    describe('when [condition]', () => {
      it('should [expected behavior]', () => {
        // Arrange
        const input = createTestInput();
        mockDep.someMethod.mockReturnValue(expectedValue);

        // Act
        const result = sut.methodName(input);

        // Assert
        expect(result).toEqual(expectedOutput);
        expect(mockDep.someMethod).toHaveBeenCalledWith(input);
      });
    });

    describe('when [error condition]', () => {
      it('should throw [ErrorType]', () => {
        // Arrange
        const invalidInput = createInvalidInput();

        // Act & Assert
        expect(() => sut.methodName(invalidInput))
          .toThrow(ExpectedError);
      });
    });
  });
});
```

### Integration Test Pattern
```typescript
describe('API: /api/v1/resource', () => {
  let app: Application;
  let db: TestDatabase;

  beforeAll(async () => {
    db = await TestDatabase.create();
    app = await createApp({ database: db });
  });

  afterAll(async () => {
    await db.destroy();
  });

  beforeEach(async () => {
    await db.reset();
  });

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

      // Verify database state
      const saved = await db.resource.findById(response.body.id);
      expect(saved).toBeDefined();
    });

    it('should return 400 for invalid data', async () => {
      const response = await request(app)
        .post('/api/v1/resource')
        .send({ name: '' })
        .expect(400);

      expect(response.body.error).toContain('name');
    });
  });
});
```

### E2E Test Pattern (Playwright)
```typescript
test.describe('User Flow: [Flow Name]', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
  });

  test('should complete [action] successfully', async ({ page }) => {
    // Navigate
    await page.click('[data-testid="nav-link"]');
    await expect(page).toHaveURL('/target');

    // Fill form
    await page.fill('[data-testid="input-name"]', 'Test Value');
    await page.click('[data-testid="submit"]');

    // Verify result
    await expect(page.locator('[data-testid="success"]'))
      .toBeVisible();
    await expect(page.locator('[data-testid="result"]'))
      .toContainText('Test Value');
  });
});
```

## Test Case Categories

### Functional Tests
| Category | Description | Example |
|----------|-------------|---------|
| Happy Path | Normal successful flow | Valid input returns expected output |
| Edge Cases | Boundary conditions | Empty array, max length |
| Error Handling | Invalid inputs | Null, undefined, wrong type |
| State Transitions | State changes | Created → Active → Completed |

### Non-Functional Tests
| Category | Description | Tool |
|----------|-------------|------|
| Performance | Response time, throughput | k6, Artillery |
| Security | Vulnerabilities | OWASP ZAP |
| Accessibility | A11y compliance | axe, Lighthouse |
| Load | Concurrent users | k6, Locust |

## Output Format

```markdown
## Test Generation Report: [File/Feature]

### Analysis
- Functions identified: X
- Branches identified: Y
- Current coverage: Z%

### Tests Generated

#### [test-file-name].test.ts

```typescript
// Generated test code
```

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

### Recommendations
- [ ] Add test for [uncovered path]
- [ ] Consider adding integration test for [scenario]
```

## Related Skills
- `/review` - Review code and tests
- `/implement` - Implement test fixes
- `/coverage` - Detailed coverage analysis
