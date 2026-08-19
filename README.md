# Flixora

**Stream Beyond Limits**

Flixora is a premium Flutter streaming client for movies and series. It combines a cinematic dark UI, Clean Architecture, and bilingual support (English / Persian) to deliver a modern entertainment experience on mobile.

[![Flutter](https://img.shields.io/badge/Flutter-3.8+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.8+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/License-Private-lightgrey)](#)

---

## Highlights

- **Cinematic home** — hero banners, continue watching, recommendations, trending, and new releases
- **Pulse Discover** — mood-based discovery with AI-style match scores, smart collections, social pulse, and watch streaks
- **Advanced player** — Chewie + `video_player` with fullscreen, playback speed, and subtitle options
- **Premium dark theme** — Material 3, glassmorphism, neon accents, and motion-first UI
- **Production architecture** — feature modules, Riverpod, GetIt, Dio, and typed error handling
- **Localization** — English and Persian (`fa`) via Flutter gen-l10n

---

## Screens

| Tab | Purpose |
| --- | --- |
| **Home** | Personalized catalog, hero carousel, and media rows |
| **Discover** | Mood orbs, AI pulse hero, interactive previews, live-style social feed |
| **Downloads** | Offline library (placeholder in the current shell) |
| **Profile** | Account and preferences (placeholder in the current shell) |

---

## Tech stack

| Layer | Choice |
| --- | --- |
| UI | Flutter, Material 3, Google Fonts, glassmorphism |
| State | Riverpod |
| DI | GetIt |
| Backend | Supabase |
| HTTP | Dio |
| Player | `video_player`, Chewie |
| Images | cached_network_image |
| Motion | flutter_animate, animations, shimmer, staggered lists |
| Data | json_serializable, dartz (`Either` failures) |
| i18n | `intl`, `lib/l10n` ARB files |

---

## Architecture

The app follows **Clean Architecture** with a shared `core` layer and feature modules.

```
lib/
├── core/                 # Theme, network, errors, DI, routing, utils
├── l10n/                 # Generated + ARB localization
└── features/
    ├── home/             # Catalog (data / domain / presentation)
    ├── discover/         # Mood-based discovery UI
    ├── player/           # Full-screen playback
    └── subscription/     # Plan entities
```

Each feature is split into:

- **Domain** — entities, repository contracts, use cases
- **Data** — models, remote/local sources, repository implementations
- **Presentation** — pages, widgets, Riverpod providers

Feature folders keep data, domain, and presentation separate so the UI can evolve independently of catalog sources.

---

## Getting started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) **3.8+**
- Dart SDK bundled with Flutter
- Android Studio / Xcode (or VS Code) for device tooling

### Setup

```bash
git clone https://github.com/mehdii7saadat-stack/flixora_app.git
cd flixora_app
flutter pub get
```

Configure backend credentials in `lib/main.dart` before running. Use your Supabase project URL and **anon / publishable** key. Never commit a service-role key.

### Run

```bash
flutter run
```

### Analyze & test

```bash
flutter analyze
flutter test
```

### Code generation

When models or Riverpod annotations change:

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Design system

The visual language lives in `lib/core/theme/app_theme.dart`:

- Dark cinematic surfaces
- Accent cyan / neon gradients
- Glass panels and soft elevation
- Consistent type scale via Inter (Google Fonts)

Responsive helpers in `lib/core/utils/app_utils.dart` adapt layout for phone, tablet, and desktop widths.

---

## Localization

| Locale | Language |
| --- | --- |
| `en` | English (template) |
| `fa` | Persian |

ARB sources: `lib/l10n/app_en.arb`, `lib/l10n/app_fa.arb`  
Config: `l10n.yaml`

---

## Roadmap

- [ ] Wire Discover and Home to live catalog APIs
- [ ] Complete Downloads and Profile flows
- [ ] Auth, watchlist sync, and subscription checkout
- [ ] Trailer previews in Discover cards
- [ ] CI (analyze + tests) on pull requests

---

## Contributing

1. Create a feature branch from `main`
2. Keep UI work inside the matching feature folder
3. Run `flutter analyze` before opening a pull request
4. Describe UX intent and test notes in the PR body

---

## License

Private project. All rights reserved unless a license file is added to this repository.

---

Built with Flutter for the next generation of streaming.
