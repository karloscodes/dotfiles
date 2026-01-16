# Global Guidelines

These rules apply to ALL projects. Project-specific CLAUDE.md files can extend but not override these.

## Communication

- **Short, clear answers** - No fluff, no over-explanation
- **Show, don't tell** - Code examples over lengthy descriptions
- **Be direct** - State issues plainly, no softening language

## Safety

- **Never `rm -rf`** - Use `trash` command instead (recoverable)
- **Never force push to main** - Ask first
- **Never commit secrets** - Check for .env, API keys, credentials

## Architecture

- **Pragmatic over pure** - Working code beats perfect architecture
- **Simple over clever** - If a junior can't understand it, simplify
- **Minimal dependencies** - Every dep is a liability
- **Monolith first** - Extract only when pain is real
- **SQLite/PostgreSQL** - No exotic databases
- **Phoenix Contexts pattern** - For Go, TypeScript, etc. (domain-focused modules)
- **Vanilla Rails** - For Rails: standard models, controllers, tests, fixtures. No service objects, no interactors, no fancy patterns

## Code Style

- **Readable > DRY** - Repeat yourself if it's clearer
- **Small functions** - One thing, done well
- **Delete dead code** - No commented-out blocks

## Testing

- **No mocks unless strictly necessary** - Test real behavior
- **BDD style** - Describe behavior, not implementation
- **Integration > unit** - Test the actual system
- **Fast tests** - Slow tests don't get run
- **Four phases** - setup, exercise, verify, teardown (blank lines between)
- **Contexts for cases** - Use subtests to group related scenarios
- **Table-driven only when needed** - Don't force it; simple tests are fine

```go
// ✅ GOOD: Four phases, clear structure
func TestUserCanLogin(t *testing.T) {
    // setup
    db := setupTestDB(t)
    user := createUser(db, "test@example.com", "password123")

    // exercise
    result, err := Login(db, "test@example.com", "password123")

    // verify
    assert.NoError(t, err)
    assert.Equal(t, user.ID, result.UserID)

    // teardown (if needed, or use t.Cleanup)
}

// ✅ GOOD: Contexts for related cases
func TestLogin(t *testing.T) {
    t.Run("with valid credentials", func(t *testing.T) {
        // ...
    })

    t.Run("with invalid password", func(t *testing.T) {
        // ...
    })

    t.Run("with non-existent user", func(t *testing.T) {
        // ...
    })
}

// ❌ BAD: Mocks everything, tests nothing real
func TestUserCanLogin(t *testing.T) {
    mockDB := new(MockDB)
    mockDB.On("FindUser", mock.Anything).Return(mockUser, nil)
    // ... tests the mock, not the system
}
```

## Git

- **Small commits** - One logical change per commit
- **Descriptive messages** - "Fix login redirect" not "fix bug"
- **No merge commits** - Rebase to keep history clean

## When in Doubt

1. What's the simplest thing that works?
2. Will I understand this in 6 months?
3. Can I delete this and rebuild it quickly?

If yes to all three, ship it.
