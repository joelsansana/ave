# Hábitos

Uma aplicação Flutter para ajudar Católicos a construir hábitos diários de fé.

## Getting Started

### Prerequisites

- Flutter SDK 3.0+
- Dart 3.0+
- Android SDK (for Android builds)
- Firebase project (for Auth & Firestore)

### Install Dependencies

```bash
cd habitos
flutter pub get
```

### Run

```bash
flutter run
```

### Build APK

```bash
flutter build apk --release
```

The APK will be at `build/app/outputs/flutter-apk/app-release.apk`.

## Features

### Implemented
- ✅ **Tracking de hábitos diários** — Create and track Catholic habits with streaks
- ✅ **Calendário litúrgico** — View liturgical calendar with readings
- ✅ **Leituras diárias** — Daily devotional readings (Via Sacra/Via Dolorosa)
- ✅ **Splash Screen** — Purple-themed launch screen with app icon
- ✅ **Offline Support** — Firestore persistence for offline data access
- ✅ **Push Notification Settings** — UI to configure daily reminders, habit reminders, and NFP reminders
- ✅ **Profile** — Statistics (total habits, streak days, total days) and settings
- ✅ **Firebase Auth** — Sign in with Google

### Em Desenvolvimento
- 🔄 **Santo do Dia** — Daily saint information
- 🔄 **Lectio Divina** — Guided prayer and scripture reading
- 🔄 **Journal de fé com insights de IA** — AI-powered faith journal
- 🔄 **Perfis familiares** — Family profiles and sharing
- 🔄 **Push Notifications (backend)** — Actual FCM delivery requires Firebase setup

## Screens

- **Home** — Habits list + daily tracking
- **Calendar** — Liturgical calendar with sequences
- **Read** — Daily devotional readings
- **NFP** — Fertility awareness tracking (in development)
- **Profile** — Statistics, settings, notifications, account

## Tech Stack

- Flutter (iOS, Android, Web)
- Firebase (Auth, Firestore, Messaging)
- Riverpod (state management)
- flutter_local_notifications (local notifications)
- Google Sign-In

## Architecture

```
lib/
├── core/              # Core utilities
├── features/          # Feature modules
│   ├── habits/        # Habit tracking
│   ├── calendar/      # Liturgical calendar
│   ├── readings/      # Daily readings
│   ├── nfp/           # Fertility tracking
│   └── profile/       # User profile & settings
├── services/          # Firebase services
├── l10n/              # Localization (Portuguese)
└── main.dart          # App entry point
```

## Nome

"Hábitos" é um jogo de palavras:
- **Hábitos** = Daily habits (o que a app faz)
- **Hábito** = Religious habit (veste talar)

## License

MIT
