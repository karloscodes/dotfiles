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

## Code Style

- **Readable > DRY** - Repeat yourself if it's clearer
- **Small functions** - One thing, done well
- **Explicit > implicit** - Magic causes bugs
- **Delete dead code** - No commented-out blocks

## Testing

- **No mocks unless strictly necessary** - Test real behavior
- **BDD style** - Describe behavior, not implementation
- **Integration > unit** - Test the actual system
- **Fast tests** - Slow tests don't get run

```go
// ✅ GOOD: BDD style, tests real behavior
func TestUserCanLogin(t *testing.T) {
    db := setupTestDB(t)
    user := createUser(db, "test@example.com", "password123")

    result, err := Login(db, "test@example.com", "password123")

    assert.NoError(t, err)
    assert.Equal(t, user.ID, result.UserID)
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
