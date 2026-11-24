# University Survival System

University Survival System is a mobile-first platform designed to help university students manage their academic life and university services.

## Main Features

- Authentication & Onboarding
- Courses & Prerequisites
- GPA & Academic Progress
- Academic Registration
- Academic Results
- Academic Schedule
- Summer Courses
- Study Planner
- Deadlines & Notifications
- University Guide
- University FAQ
- Anime Gamification

## Actors

- Student
- Admin

## Project Documentation

### Requirements
- User Stories
- Use Cases

### Gherkin Features
- Authentication
- Courses
- GPA
- Registration
- Results
- Schedule
- Summer Courses
- Study Planner
- Deadlines
- University Guide
- FAQ
- Gamification

---

# Flutter Mobile Application

The Flutter application is the mobile frontend for the University Survival System. It currently runs on sample data, so every screen works without a backend.

## Run the App

This folder holds the Flutter app code (`lib/` and `pubspec.yaml`) without the Android and iOS platform folders.

Generate the platform folders once with Flutter:

```bash
flutter create university_survival_system
```

Then copy this folder's `lib/`, `pubspec.yaml`, and `analysis_options.yaml` into the generated project, replacing the existing files.

Delete the default `test/widget_test.dart`, then run:

```bash
cd university_survival_system
flutter pub get
flutter run
```

The app uses `google_fonts`, which downloads Inter and Plus Jakarta Sans on first launch. Therefore, the first run requires an internet connection.

## Project Structure

```text
lib/
  main.dart                  app entry and theme
  theme/app_theme.dart       colors, text styles, Material theme
  data/sample_data.dart      sample courses, grades, options
  widgets/                   shared widgets and Pip mascot
  screens/
    setup_screen.dart        university / faculty / program / level
    app_shell.dart           bottom navigation (5 tabs)
    home_screen.dart         dashboard
    courses_screen.dart      courses for the chosen level
    gpa_screen.dart          GPA calculator
    planner_screen.dart      week strip, sessions, deadlines
    guide_screen.dart        university guide and FAQs
    companion_screen.dart    gamification (Pip, quests, badges)
```

## Profile Photo Permissions

The profile photo feature uses the `image_picker` package.

After generating the platform folders:

- **iOS:** Add `NSPhotoLibraryUsageDescription` and `NSCameraUsageDescription` to `ios/Runner/Info.plist`, each with a short explanation.
- **Android:** No extra configuration is needed for gallery access. Camera works out of the box.
- **Web:** Gallery only; the camera option is hidden.

## What Works Now

- **Profile:** Choose Male or Female to change the avatar icon, or add a photo from the gallery or camera. The avatar on Home opens the Profile screen. The photo is kept in memory only until storage and backend integration are added.
- **Setup:** Each field opens a picker; Continue opens the app.
- **GPA Calculator:** Change any grade or add a course and both GPAs recalculate (4.0 scale, previous 34 credit hours at 3.32).
- **Home:** Tick tasks, open the companion, and navigate to other tabs.
- **Planner, Guide, Courses:** Static content with working selection and expanding FAQs.

## Next Steps

1. Backend and database (universities, faculties, programs, courses, users).
2. Replace `sample_data.dart` with API calls.
3. Task form and local notifications for deadlines.
4. XP and quests driven by completed tasks.