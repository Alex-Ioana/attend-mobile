# Attend Mobile

Flutter app for members and curators: live flows, QR-based presence, and offline-aware UX. It consumes [attend-backend](https://github.com/Alex-Ioana/attend-backend) APIs. Subscriptions are handled on the web, not in-app.

## Documentation

- [Documentation index](docs/README.md)
- [UI design notes](docs/DESIGN.md) — theme (light + dark) and reference artwork
- [Project context](CONTEXT.md) — scope and boundaries for this repo
- [Memories](MEMORIES.md) — decisions, open questions, and risks
- [Changelog](CHANGELOG.md)

## Status

**Phase 1 (Proof of Concept)** architecture has been established.
The app currently runs using a **Mock API Data Layer** injected via Riverpod. This allows the UI shells (Clubber, Curator, Space) and the Glassmorphic design system to be tested locally.

## Target stack

- Flutter
- **Android:** primary development target first.
- **iOS:** add on a Mac when ready for signing and store submission.

## Running Locally (Phase 1 PoC)

1. Ensure Flutter is installed and an emulator/device is connected.
2. Run `flutter pub get`.
3. Run `dart run build_runner build -d` if you modify Freezed models.
4. Run `flutter run` to launch the app.
