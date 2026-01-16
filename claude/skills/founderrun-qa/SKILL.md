---
name: founderrun-qa
description: Use when testing FounderRun features, checking for regressions, or verifying implementations work correctly across the Rails + React stack
---

# FounderRun Quality Assurance

## Overview

Verify features work correctly across the Rails 8 + Inertia.js + React stack. Check both backend logic and frontend rendering.

## When to Use

- After implementing a new feature
- Before marking a task complete
- When debugging issues
- After refactoring code

## Quick Verification Checklist

### Backend Checks
- [ ] Rails console queries return expected data
- [ ] Controller actions render correct Inertia pages
- [ ] Serializers include all needed fields
- [ ] Database migrations applied (`bin/rails db:migrate:status`)

### Frontend Checks
- [ ] Page renders without JS errors (check browser console)
- [ ] Styling matches design system (dark theme, neon accents)
- [ ] Links navigate correctly
- [ ] Forms submit and redirect properly
- [ ] Loading/error states handled

### Integration Checks
- [ ] Props passed from controller appear in React
- [ ] Auth-protected routes redirect unauthenticated users
- [ ] Stripe connection flow works end-to-end

## Running Tests

```bash
# Rails tests
bin/rails test

# Specific test file
bin/rails test test/models/user_test.rb

# Lint Ruby
bin/rubocop
```

## Manual Testing Flow

### 1. Start Development Server
```bash
bin/dev
# Or separately:
docker compose up -d && bin/rails server && bin/vite dev
```

### 2. Check Browser Console
Open DevTools → Console. Look for:
- React errors/warnings
- Failed network requests
- Inertia navigation issues

### 3. Test User Flows

**Auth Flow:**
1. Visit `/login`
2. Enter email
3. Check LetterOpener at `localhost:3000/letter_opener`
4. Click magic link
5. Verify redirect to home

**Stripe Flow:**
1. Go to Settings
2. Connect Stripe (use test mode)
3. Complete setup wizard
4. Verify connection shows as active

**Leaderboard:**
1. Visit `/leaderboards`
2. Test scope tabs (Projects, Founders, Cohort, Country, Region)
3. Verify podium displays top 3
4. Check list shows all entries

## Database Verification

```ruby
# Rails console (bin/rails c)
User.count
Achievement.verified.count
Milestone.ordered.pluck(:name, :threshold_cents)
```

## Common Issues

| Symptom | Check |
|---------|-------|
| Blank page | Browser console for JS errors |
| Missing data | Controller props, serializer |
| Style broken | Tailwind classes, CSS loaded |
| 404 errors | Routes (`bin/rails routes`) |
| Auth redirect loop | Session, `current_user` |
| Stripe errors | Credentials, webhook setup |

## Regression Areas

After changes, specifically verify:
1. **Header** - appears on all pages, links work
2. **Auth states** - logged in vs logged out UI
3. **Leaderboard scopes** - all filters still work
4. **Profile** - own profile shows Settings link
5. **XP/Level** - calculations still correct

## Before Marking Complete

1. Feature works as specified
2. No console errors
3. Responsive on mobile viewport
4. Both logged-in and logged-out states tested
5. Edge cases handled (empty states, loading)
