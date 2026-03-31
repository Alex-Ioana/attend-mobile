# Attend Mobile Memories

## Current decisions
- Flutter is the target stack.
- **Ship light and dark themes**; the pencil reference (`docs/design/app-design-proposal.jpg`) is dark-only — light must be designed to the same component set.
- **Android first**; iOS build and store flow on a Mac later.
- Mobile apps are free and do not process subscriptions.
- Mobile depends on attend-backend APIs.
- QR-based presence verification is the initial proof mechanism.
- **Phase 1 State**: We chose **Riverpod** for robust dependency injection and state handling, specifically to support our mock-first strategy and offline caching in the future.
- **Phase 1 Routing**: We chose **GoRouter** to manage role-based shell navigation (Clubber vs Curator vs Space).

## UX constraints
- Keep the product useful in poor signal environments.
- Make QR scan/redemption fast and hard to misuse.
- Treat ephemeral content as short-lived and lightweight.

## Open decisions
- Exact state-management approach in Flutter: Resolved -> Riverpod.
- Local storage strategy for offline cache and session data: Likely Isar or Hive (TBD in Phase 2).
- Push notification strategy and provider.

## Risks to keep visible
- Overcomplicating offline sync too early (sticking to mock API for PoC).
- Building around unstable backend contracts before API v1 is fixed.
- Platform-specific camera/background quirks affecting scan flow.
