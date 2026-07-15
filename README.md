# DiGA LAB

Educational Flutter app that helps doctors practise prescribing Digital Health Applications (DiGAs) through clinical scenario simulations.

> **Disclaimer:** Academic prototype for Digital Health Programming coursework. Not intended for clinical use.

**Live demo:** https://diga-411dd.web.app  
**GitHub:** https://github.com/Thuvarakan-97/diga  
**Course report:** [DH_Programming_Report.md](DH_Programming_Report.md)

---

## Features

### Implemented
- Email/password and Google sign-in via Firebase Auth
- Six clinical domains with scenario unlock progression
- Unified 5-question exams with answer review
- Pass/fail celebration animation (falling confetti)
- English and German localisation
- Home, Modules, Companion, Progress, and Profile screens
- Firebase Hosting deployment for web
- GitHub Actions workflow for Android APK builds

### Rule-based / mock
- Post-exam learning report built from incorrect answers, question rationales, weak phases, and predefined templates (no live Gemini or OpenAI API)
- Gamification XP/badges may use local mock data when Firebase profile data is unavailable
- Progress dashboard metrics currently use demo data

### Planned
- Live Gemini (or similar) API for richer AI coaching
- Persist scenario progress and learning reports across app restarts
- Per-scenario question banks

---

## Tech stack

| Area | Technology |
|------|------------|
| Framework | Flutter / Dart |
| State management | Riverpod |
| Routing | go_router |
| Backend | Firebase Auth, Cloud Firestore, Hosting, Analytics, Storage |
| CI | GitHub Actions |
| Localisation | Flutter gen-l10n (`app_en.arb`, `app_de.arb`) |

---

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel)
- Chrome or Edge for web development
- (Optional) [Android Studio](https://developer.android.com/studio) + Android SDK for local APK builds
- (Optional) [Firebase CLI](https://firebase.google.com/docs/cli) for hosting deploy
- (Optional) Node.js / npm if installing Firebase CLI via npm

---

## Getting started

```bash
git clone https://github.com/Thuvarakan-97/diga.git
cd diga
flutter pub get
```

### Run

```bash
# Web
flutter run -d chrome

# Android (requires Android SDK)
flutter run -d android
```

### Build

```bash
# Web
flutter build web --release

# Android APK
flutter build apk --release
```

### Deploy web (Firebase Hosting)

```bash
firebase login
firebase deploy --only hosting
```

App URL: https://diga-411dd.web.app

---

## Firebase

| Setting | Value |
|---------|--------|
| Project ID | `diga-411dd` |
| Android package | `com.diga.digaapp` |
| Web app | `diga-web` |
| Config file | `lib/firebase_options.dart` |

Enable in Firebase Console:
- Authentication → Email/Password
- Authentication → Google (optional)
- Cloud Firestore
- Hosting

---

## Project structure

```text
lib/
  main.dart
  firebase_options.dart
  app/                 # bootstrap, router, theme, main shell
  core/                # routes, colors, spacing, feature flags
  features/
    auth/              # login, register, Firebase auth
    simulation/        # exam screens, question banks, results
    ai_support/        # recommendations, learning reports
    diga_modules/      # clinical domains and scenarios
    companion/         # prescription companion
    gamification/      # XP, badges, streaks
    home/              # dashboard
    progress/          # progress dashboard
    profile/           # settings and personal details
  l10n/                # EN/DE arb and generated localisations
  shared/              # shared models and widgets
android/
web/
.github/workflows/     # APK build workflow
firestore.rules
firebase.json
```

---

## Useful commands

```bash
flutter pub get
flutter gen-l10n
flutter analyze
flutter test
flutter run -d chrome
flutter build web --release
flutter build apk --release
firebase deploy --only hosting
```

---

## Disclaimer

Prototype for academic Digital Health Programming coursework. Not intended for clinical use.
