# FitBody App UI

A comprehensive Flutter application designed to provide users with a complete fitness and wellness experience. This app offers workout tracking, nutrition guidance, progress monitoring, and community features to help users achieve their health goals.

## Features

### Authentication

- **Sign In/Sign Up**: Secure user authentication with email and password
- **Social Login**: Support for Facebook, Google, and Apple sign-in
- **Password Recovery**: Forgot password functionality with email reset
- **Set New Password**: Secure password reset flow

### Home Dashboard

- **Personalized Greeting**: Welcome message with motivational content
- **Top Menu Navigation**: Quick access to Workout, Progress Tracking, Nutrition, and Community
- **Workout Recommendations**: Horizontal scroll of featured workouts with images, duration, and calorie info
- **Weekly Challenges**: Prominent banner for special workout challenges
- **Article & Tips**: Grid view of health articles and fitness tips

### Workout Management

- **Workout Categories**: Organized by difficulty levels (Beginner, Intermediate, Advanced)
- **Exercise Details**: Comprehensive workout plans with rounds and exercises
- **Progress Tracking**: Timer, repetition, and duration tracking for each exercise
- **Workout History**: Track completed sessions and streaks

### Progress Tracking

- **Visual Charts**: Syncfusion charts for progress visualization
- **Statistics**: Calorie burn, workout duration, and achievement tracking
- **Goal Setting**: Set and monitor fitness goals
- **Timeline**: Date-based progress timeline

### Nutrition

- **Meal Planning**: Healthy recipe suggestions
- **Calorie Tracking**: Monitor daily nutritional intake
- **Dietary Guidance**: Personalized nutrition recommendations

### Community

- **Social Features**: Connect with other fitness enthusiasts
- **Challenges**: Participate in community fitness challenges
- **Sharing**: Share achievements and progress

### Notifications

- **Push Notifications**: Workout reminders and updates
- **In-App Notifications**: System and user notifications
- **Customizable Alerts**: Personalized notification preferences

### Profile Management

- **User Profile**: Personal information and avatar
- **Settings**: App preferences and configurations
- **Favorites**: Save favorite workouts and articles

### Additional Features

- **Dark Mode**: Automatic theme switching based on system settings
- **Offline Support**: Cached images and data for offline access
- **Animations**: Smooth transitions and micro-interactions using Animate_Do
- **Neumorphic UI**: Modern neumorphic design elements
- **Glassmorphism**: Glass-like UI effects for enhanced visual appeal

## Technology Stack

- **Framework**: Flutter 3.8.1+
- **State Management**: GetX
- **UI Components**:
  - Neumorphic UI (flutter_neumorphic)
  - Glassmorphism (glassmorphism_ui)
  - Advanced Switches (flutter_advanced_switch)
  - Spinkit Loading Animations (flutter_spinkit)
- **Charts**: Syncfusion Flutter Charts
- **Image Handling**: Cached Network Image
- **Date/Time**: Easy Date Timeline, Intl
- **Icons**: Font Awesome Flutter
- **Database**: Sqflite for local storage
- **Routing**: GetX Navigation

## Project Structure

```
lib/
├── app.dart                 # Main app configuration and routing
├── main.dart               # App entry point
├── config/
│   ├── appassets/          # Asset management
│   ├── route/              # App routing configuration
│   └── theme/              # Theme and styling
├── core/
│   └── data/               # Static data and models
├── modules/
│   ├── auth/               # Authentication screens
│   │   ├── signin/
│   │   ├── signup/
│   │   └── forgot/
│   └── home/               # Home and main screens
│       └── views/
│           ├── home_screen.dart
│           ├── profile/
│           ├── search/
│           ├── setup/
│           └── splash/
└── modules/items/          # Feature-specific components
    ├── profile_items/
    ├── recommnt/
    ├── settings/
    └── top_menu_home/
        ├── Community/
        ├── Nutrition/
        ├── Progresstracking/
        └── work_out/
```

## Setup Instructions

### Prerequisites

- Flutter SDK 3.8.1 or higher
- Dart SDK
- Android Studio or VS Code with Flutter extensions
- Android/iOS emulator or physical device

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/fitbody_app_ui.git
   cd fitbody_app_ui
   ```

2. **Install dependencies**:

   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

### Platform-Specific Setup

#### Android

- Ensure Android SDK is installed
- Set up Android emulator or connect physical device
- Run: `flutter run` (Android will be selected automatically)

#### iOS

- macOS with Xcode installed
- Set up iOS Simulator or connect physical device
- Run: `flutter run` (iOS will be selected automatically)

#### Web

- Run: `flutter run -d chrome`

## Key Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  # State Management
  get: ^4.7.2

  # UI Libraries
  flutter_neumorphic:
    git: https://github.com/den0206/Flutter-Neumorphic.git
  glassmorphism_ui: ^0.3.0
  animate_do: ^4.2.0

  # Charts and Data Visualization
  syncfusion_flutter_charts: ^30.2.6+1

  # Image and Media
  cached_network_image: ^3.4.1
  cached_network_image_web: ^1.0.1

  # Utilities
  intl: ^0.20.2
  easy_date_timeline: ^2.0.9
  font_awesome_flutter: ^10.9.0

  # Database
  sqflite: ^2.3.0
```

## App Architecture

### State Management

The app uses GetX for state management, providing:

- Reactive state updates
- Dependency injection
- Route management
- Internationalization support

### Navigation

- GetX-based routing system
- Named routes for all screens
- Nested navigation support

### Data Management

- Static data stored in `core/data/`
- Local database using Sqflite
- Cached network images for performance

### UI Design

- Dark theme with neon yellow accents
- Purple color scheme for primary elements
- Responsive design for different screen sizes
- Custom neumorphic and glassmorphism effects

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Screenshots

(Add screenshots of the app here when available)

## Contact

For questions or support, please contact:

- Email: your-email@example.com
- GitHub: [your-username](https://github.com/your-username)

---

**Note**: This is a UI-focused Flutter application. Backend integration and API connections are not included in this version.
