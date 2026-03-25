# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Run

This is an iOS 17+ SwiftUI app managed with an Xcode project (not SPM). The project is generated from `project.yml` using [XcodeGen](https://github.com/yonaskolb/xcodegen).

```bash
# Regenerate Xcode project from project.yml
xcodegen generate

# Build from command line
xcodebuild -project Convora.xcodeproj -scheme Convora -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 16' build

# Run tests (no test target currently exists)
```

There are **no external dependencies** — the app uses only Apple frameworks (SwiftUI, AVFoundation, StoreKit, UserNotifications).

## Architecture

**Pattern:** SwiftUI + @Observable (iOS 17 Observation framework) — not traditional MVVM with @StateObject/@EnvironmentObject.

**State flow:** `ConvoraApp` creates all managers as `@State` and passes them into the view hierarchy via SwiftUI environment. Views read from managers directly.

### Managers (Services/)

All stateful managers are `@Observable` classes:

- **ProgressManager** — tracks completed days, streak count, onboarding status. Persists to UserDefaults.
- **PurchaseManager** — StoreKit in-app purchases (monthly/annual/lifetime). Gates access to weeks 2-4.
- **LanguageManager** — selected audio language preference. Persists to UserDefaults.
- **TTSManager** — AVSpeechSynthesizer wrapper for text-to-speech playback across 5 languages.

Stateless services are enums with static methods:
- **NotificationManager** — daily reminder scheduling via UserNotifications.
- **ReviewManager** — StoreKit review prompts at milestone days (7, 14, 21).

### Content Model

The app is a 28-day communication course split into 4 weeks. Course content is defined as static data in `Data/CourseData.swift` and `Data/CourseDataPart2.swift`. Translations for 4 non-English languages live in `Data/Translations/` (ES, FR, PT, DE), indexed via `LessonTranslations`.

Key types (`Models/DayLesson.swift`):
- `DayLesson` — day number, title, icon, duration, lesson text, exercise, key takeaways
- `Exercise` — title, instructions, challenge text
- `CourseWeek` — title, subtitle, list of DayLesson items

Navigation uses typed routes: `WeekRoute`, `LessonRoute`, `ExerciseRoute`, `PaywallRoute`.

### Paywall Logic

Week 1 (days 1-7) is free. Weeks 2-4 require a premium purchase. Access is gated in `PurchaseManager.canAccessDay()` and checked in `WeekView` when navigating to a lesson.

### Design System (Theme/)

`ConvoraTheme` defines the "Midnight Ember" palette — dark-mode only with glass morphism styling (ultraThinMaterial). Each week has a distinct accent color (gold, teal, rose, violet). Use `ConvoraTheme.*` constants for colors, spacing, and corner radii. The `Color(hex:)` initializer is in `Extensions/Color+Theme.swift`.

## Key Conventions

- The app is **dark mode only** (`preferredColorScheme(.dark)` set at root).
- Glass card styling is applied via the `GlassCard` component or `.glassCard()` view modifier.
- StoreKit product IDs: `com.convora.app.monthly`, `com.convora.app.annual`, `com.convora.app.lifetime`.
- Haptic feedback uses SwiftUI's `.sensoryFeedback()` modifier.
- All TTS text is cleaned (markdown/emoji stripped) before speaking via `TTSManager`.
