# Attend Mobile

Flutter app for members and curators: live flows, QR-based presence, and offline-aware UX. It consumes [attend-backend](https://github.com/Alex-Ioana/attend-backend) APIs. Subscriptions are handled on the web, not in-app.

## Documentation

- [Documentation index](docs/README.md)
- [UI design notes](docs/DESIGN.md) — theme (light + dark) and reference artwork
- [Project context](CONTEXT.md) — scope and boundaries for this repo
- [Memories](MEMORIES.md) — decisions, open questions, and risks
- [Changelog](CHANGELOG.md)

## Status

Repository initialized with documentation, design reference image, and git; Flutter application scaffold is not present yet.

## Target stack

- Flutter
- **Android:** primary development target first.
- **iOS:** add on a Mac when ready for signing and store submission.

## Setup (once Flutter project exists)

1. Install [Flutter](https://docs.flutter.dev/get-started/install) and Android toolchain.
2. `flutter pub get`
3. Run on an emulator or device per `flutter run`.

## Notes

- Proof of presence starts with short-lived venue QR challenges (backend is source of truth).
- See `docs/design/app-design-proposal.jpg` for the current UI reference (dark); implement light theme alongside dark.
