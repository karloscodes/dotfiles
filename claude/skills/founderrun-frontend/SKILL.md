---
name: founderrun-frontend
description: Use when building React components, pages, or UI for FounderRun - the gamified indie hacker SaaS with dark theme and neon accents
---

# FounderRun Frontend Development

## Overview

Build React 19 + Inertia.js pages with Tailwind CSS gamified dark theme. All UI uses neon accents on dark backgrounds.

## When to Use

- Creating new pages in `app/javascript/pages/`
- Building shared components in `app/javascript/components/`
- Styling with the gamified design system
- Working with Inertia.js navigation

## Design System Quick Reference

| Element | Classes |
|---------|---------|
| Page background | `min-h-screen` (inherits dark bg) |
| Container | `max-w-5xl mx-auto px-4 py-8` |
| Card | `card` (custom class) |
| Primary button | `btn-primary text-sm py-2` |
| Nav link | `nav-link`, active: `nav-link-active` |
| Muted text | `text-game-muted` |
| Success/verified | `text-neon-green` |
| Level/XP | `text-neon-purple` |
| Project highlight | `text-neon-orange` |
| Danger/alert | `text-neon-pink` |
| Money display | `font-mono text-neon-green` |

## Page Template

```jsx
import { Link } from '@inertiajs/react'
import Header from '../../components/Header'

export default function PageName({ current_user, data }) {
  return (
    <div className="min-h-screen">
      <Header user={current_user} active="page-key" />
      <main className="max-w-5xl mx-auto px-4 py-8">
        <h1 className="text-3xl font-bold mb-6">Title</h1>
        <div className="card">
          {/* content */}
        </div>
      </main>
    </div>
  )
}
```

## Icon Pattern

NO emojis. Use inline SVG function components:

```jsx
function IconName({ className = "w-5 h-5" }) {
  return (
    <svg className={className} fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
      <path strokeLinecap="round" strokeLinejoin="round" d="M..." />
    </svg>
  )
}
```

## Form Submissions

```jsx
import { router } from '@inertiajs/react'

// Form submit
function handleSubmit(e) {
  e.preventDefault()
  router.post('/endpoint', { field: value })
}

// Link with method
<Link href="/logout" method="delete" className="nav-link">Logout</Link>
```

## State Patterns

- Use React hooks for local state
- Server state comes via Inertia props
- No client-side data fetching - all data from controller props

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Using emojis | Use SVG icon components |
| Fetching data client-side | Get data from Inertia props |
| Missing Header component | Always include `<Header user={current_user} />` |
| Wrong import path | Use `@inertiajs/react` not `inertia-react` |
| Hardcoded colors | Use Tailwind theme colors (`neon-*`, `game-*`) |
