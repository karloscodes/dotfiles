---
name: founderrun-code-style
description: Use when writing any code for FounderRun - enforces beautiful, expressive, non-verbose code using vanilla Rails patterns and Inertia.js for frontend
---

# FounderRun Code Style

## Philosophy

**Beautiful code reads like prose.** Every line should earn its place. Prefer clarity over cleverness, simplicity over flexibility.

## Core Principles

| Principle | Practice |
|-----------|----------|
| **Vanilla Rails** | Use Rails conventions, not gems. ActiveRecord, concerns, helpers. |
| **Expressive** | Code should explain itself. If it needs a comment, rewrite it. |
| **Not verbose** | Delete everything that doesn't add meaning. |
| **Pragmatic** | Ship working software. Perfection is the enemy. |

## Rails Backend

### Do This
```ruby
# Clear, scannable, minimal
def index
  @users = User.active.by_reputation
end

def create
  @user = User.create!(user_params)
  redirect_to @user
end
```

### Not This
```ruby
# Over-engineered, verbose
def index
  @users = UserQueryService.new(
    scope: User.all,
    filters: UserFilters.new(params)
  ).execute
end
```

### Patterns

**Scopes over service objects:**
```ruby
# Good - in model
scope :active, -> { where(active: true) }
scope :by_reputation, -> { order(reputation: :desc) }

# Avoid - separate service
class UserQueryService; end
```

**Concerns for shared behavior:**
```ruby
# app/models/concerns/has_revenue.rb
module HasRevenue
  extend ActiveSupport::Concern

  def total_revenue_cents
    achievements.sum(:revenue_cents)
  end
end
```

**Simple controllers:**
```ruby
class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    render inertia: "Projects/Show", props: { project: serialize(@project) }
  end
end
```

## React Frontend

### Do This
```jsx
// Clean, readable JSX
function UserCard({ user }) {
  return (
    <div className="card">
      <h2>{user.name}</h2>
      <span className="text-neon-green">{user.level}</span>
    </div>
  )
}
```

### Not This
```jsx
// Over-abstracted
function UserCard({ user }) {
  const { name, level } = useUserData(user)
  const cardClasses = useCardStyles({ variant: 'user' })

  return (
    <Card className={cardClasses}>
      <Typography variant="h2">{name}</Typography>
      <Badge color="success">{level}</Badge>
    </Card>
  )
}
```

### Patterns

**Inline styles with Tailwind:**
```jsx
// Good - direct, readable
<button className="px-4 py-2 bg-neon-green text-black rounded hover:opacity-90">
  Save
</button>

// Avoid - abstraction for one button
<Button variant="primary" size="md">Save</Button>
```

**Props over context:**
```jsx
// Good - explicit data flow
<Header user={currentUser} />
<Feed achievements={achievements} user={currentUser} />

// Avoid - hidden dependencies
<UserProvider><Header /><Feed /></UserProvider>
```

**Colocate helpers:**
```jsx
// Good - helper in same file
function formatCurrency(cents) {
  return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(cents / 100)
}

export default function PriceTag({ cents }) {
  return <span>{formatCurrency(cents)}</span>
}
```

## Red Flags

| Smell | Fix |
|-------|-----|
| Creating a service object | Use model method or concern |
| Adding a gem | Check if Rails has it built-in |
| Creating a shared component for one use | Keep it inline |
| Adding TypeScript types | Plain JS is fine for this scale |
| Writing a custom hook | Usually useState is enough |
| Abstracting "for later" | YAGNI - wait until you need it |

## The Test

Before committing, ask:

1. Can I delete any lines without losing meaning?
2. Would a new developer understand this in 10 seconds?
3. Am I solving a real problem or an imagined future one?

If unsure, choose the simpler path.
