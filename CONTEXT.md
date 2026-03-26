Attend mobile repo context

Purpose
- Primary live product for members and curators.
- Handles QR scanning, presence actions, live content, and low-connectivity venue usage.

Product constraints
- Mobile app is free on Android and iOS.
- No payment processing inside the mobile environment.
- Mobile interacts with the shared backend engine by API.
- Presence proof starts from venue QR challenges.

Architecture direction
- Framework target: Flutter.
- **Platform rollout:** Android first; iOS build and App Store release planned on macOS hardware later.
- Keep mobile focused on session handling, live flows, offline-aware UX, and device capabilities.
- Avoid putting durable business rules in the app.

Likely areas
- auth/session flows
- QR scanner and redemption flow
- member home and live activity
- curator live shoutouts/content
- ephemeral content handling
- offline caching/sync for venue conditions

UI and theming
- Visual design references live under `docs/design/` (see [DESIGN.md](docs/DESIGN.md)).
- The product must offer **both light and dark** themes; reference mockups may show dark only.

Working rule
- This repo is the main live client, but the backend remains the source of truth.
