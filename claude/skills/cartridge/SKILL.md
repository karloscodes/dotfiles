---
name: cartridge
description: Use when working with Go web applications using the cartridge framework - covers Application, Server, Context, SQLite, Inertia, Flash, Cache, and middleware
---

# Cartridge Framework

Minimal, opinionated Go web framework built on Fiber. Designed for solo maintainability.

## Package Structure

```
github.com/karloscodes/cartridge
├── application.go      # App bootstrap, lifecycle, graceful shutdown
├── server.go          # HTTP server, routing, middleware mounting
├── context.go         # Request context with DB, Logger, Config
├── session.go         # Session management
├── cache/             # Cache with memory and database stores
├── flash/             # Flash messages for PRG pattern
├── inertia/           # Inertia.js adapter for React SSR
├── sqlite/            # SQLite manager with WAL, transactions
├── middleware/        # Concurrency, helmet, rate limiter, recovery
├── testsupport/       # Test helpers for DB and server
└── config/            # Base config interface
```

## Core Concepts

### Application Bootstrap

```go
app, err := cartridge.NewApplication(cartridge.ApplicationOptions{
    Config:            cfg,
    Logger:            logger,
    DBManager:         dbManager,
    RouteMountFunc:    mountRoutes,
    BackgroundWorkers: []cartridge.BackgroundWorker{jobsManager},
})
app.Run() // Blocks, handles signals, graceful shutdown
```

### Handler Signature

Single signature for all handlers:

```go
func(ctx *cartridge.Context) error
```

Context provides:
- `ctx.Ctx` - embedded `*fiber.Ctx` for all HTTP methods
- `ctx.DB()` - GORM database connection
- `ctx.Logger` - structured logger
- `ctx.Config` - runtime config

### Route Configuration

```go
func mountRoutes(srv *cartridge.Server) {
    // Basic route
    srv.Get("/", homeHandler)

    // With config
    srv.Post("/api/items", createHandler, &cartridge.RouteConfig{
        WriteConcurrency:   true,              // SQLite write queue
        EnableCORS:         true,              // CORS headers
        EnableCSRF:         cartridge.Bool(true),
        EnableSecFetchSite: cartridge.Bool(false),
        RateLimit:          100,               // requests per minute
    })

    // Route groups
    admin := srv.Group("/admin", authMiddleware)
    admin.Get("/dashboard", dashboardHandler)
}
```

## SQLite Package

```go
import "github.com/karloscodes/cartridge/sqlite"

// Manager setup
cfg := sqlite.Config{
    Path:         "data.db",
    MaxOpenConns: 1,
    MaxIdleConns: 1,
    EnableWAL:    true,
    TxImmediate:  true,
    BusyTimeout:  5000,
    Logger:       logger,
}
manager := sqlite.NewManager(cfg)
db, err := manager.Connect()

// Transactions with PerformWrite (serialized writes)
err := sqlite.PerformWrite(db, func(tx *gorm.DB) error {
    return tx.Create(&record).Error
})

// WAL checkpoint
manager.CheckpointWAL("FULL")
```

## Inertia.js Integration

For React SSR with server-side props:

```go
import "github.com/karloscodes/cartridge/inertia"

func dashboardHandler(ctx *cartridge.Context) error {
    return inertia.RenderPage(ctx.Ctx, "Dashboard", inertia.Props{
        "user":    currentUser,
        "metrics": dashboardMetrics,
    })
}
```

Frontend receives props via `window.__PAGE_DATA__`.

## Flash Messages

PRG (Post-Redirect-Get) pattern:

```go
import "github.com/karloscodes/cartridge/flash"

// Set flash before redirect
flash.SetFlash(ctx.Ctx, "success", "Item created")
return ctx.Redirect("/items", fiber.StatusFound)

// Get flash in next request (auto-clears)
msg := flash.GetFlash(ctx.Ctx, "success")
```

## Cache

```go
import "github.com/karloscodes/cartridge/cache"

// Memory cache
store := cache.NewMemoryStore()

// Database cache (persisted)
store := cache.NewDatabaseStore(db)

// Usage
store.Set("key", value, 5*time.Minute)
value, found := store.Get("key")
store.Delete("key")
```

## Session Management

```go
sessionMgr := cartridge.NewSessionManager(cartridge.SessionConfig{
    CookieName:   "_session",
    Secret:       cfg.GetPrivateKey(),
    Expiration:   24 * time.Hour,
    SecureCookie: cfg.IsProduction(),
})
srv.SetSessionManager(sessionMgr)

// In handler
session := ctx.Session()
session.Set("user_id", userID)
session.Save()
```

## Middleware

### Built-in (auto-applied)
- Recovery (panic handling)
- Request logging
- Compression

### Per-route
```go
&cartridge.RouteConfig{
    WriteConcurrency:   true,  // SQLite write serialization
    EnableCORS:         true,  // CORS headers
    EnableCSRF:         cartridge.Bool(true),
    EnableSecFetchSite: cartridge.Bool(true),
    RateLimit:          100,   // per minute
}
```

### Custom middleware
```go
import cartridgemiddleware "github.com/karloscodes/cartridge/middleware"

// Sec-Fetch-Site validation
cartridgemiddleware.SecFetchSite(cartridgemiddleware.SecFetchConfig{
    AllowedModes: []string{"navigate", "same-origin"},
})
```

## Test Support

```go
import "github.com/karloscodes/cartridge/testsupport"

func TestHandler(t *testing.T) {
    // Setup test DB
    db := testsupport.SetupTestDB(t)

    // Setup test server
    srv := testsupport.NewTestServer(t, db, mountRoutes)

    // Make request
    resp := srv.Get("/api/items")
    assert.Equal(t, 200, resp.StatusCode)
}
```

## Patterns

### Handler with DB write
```go
func createItem(ctx *cartridge.Context) error {
    var input CreateItemInput
    if err := ctx.BodyParser(&input); err != nil {
        return ctx.Status(400).JSON(fiber.Map{"error": "invalid input"})
    }

    item := &Item{Name: input.Name}
    if err := sqlite.PerformWrite(ctx.DB(), func(tx *gorm.DB) error {
        return tx.Create(item).Error
    }); err != nil {
        return ctx.Status(500).JSON(fiber.Map{"error": "failed to create"})
    }

    return ctx.JSON(item)
}
```

### PRG form submission
```go
func handleForm(ctx *cartridge.Context) error {
    // Process form...
    if err != nil {
        flash.SetFlash(ctx.Ctx, "error", err.Error())
        return ctx.Redirect("/form", fiber.StatusFound)
    }

    flash.SetFlash(ctx.Ctx, "success", "Saved!")
    return ctx.Redirect("/form", fiber.StatusFound)
}
```

### Inertia page with flash
```go
func showPage(ctx *cartridge.Context) error {
    return inertia.RenderPage(ctx.Ctx, "Page", inertia.Props{
        "data":    data,
        "flash":   flash.GetAllFlash(ctx.Ctx),
    })
}
```

## Import Paths

```go
import (
    "github.com/karloscodes/cartridge"
    "github.com/karloscodes/cartridge/cache"
    "github.com/karloscodes/cartridge/flash"
    "github.com/karloscodes/cartridge/inertia"
    "github.com/karloscodes/cartridge/sqlite"
    "github.com/karloscodes/cartridge/testsupport"
    cartridgemiddleware "github.com/karloscodes/cartridge/middleware"
)
```
