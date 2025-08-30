# Football Commentary App

A Flutter application for live football matches with voice chat commentary rooms using clean architecture pattern.

## Features

- **Splash Screen**: Welcome screen with app branding
- **Google Authentication**: Secure login using Google Sign-In
- **Live Matches**: Real-time football matches from Football API
- **Voice Chat Rooms**: Create and join voice commentary rooms using Agora.io
- **Real-time Database**: Firebase Realtime Database for room management
- **Clean Architecture**: Follows clean architecture principles with proper separation of concerns

## Architecture

This project follows Clean Architecture principles with the following structure:

```
lib/
├── core/                           # Core functionality
│   ├── di/                        # Dependency injection
│   ├── env/                       # Environment variables
│   ├── error/                     # Error handling
│   ├── networking/                # API services and networking
│   ├── router/                    # App routing
│   ├── theme/                     # App theming
│   └── utils/                     # Utilities and services
├── features/                      # Feature modules
│   ├── auth/                      # Authentication feature
│   │   ├── data/                  # Data layer (repositories, models)
│   │   ├── domain/                # Domain layer (entities, use cases)
│   │   └── presentation/          # Presentation layer (UI, cubits)
│   ├── matches/                   # Matches feature
│   ├── voice_chat/                # Voice chat feature
│   ├── splash/                    # Splash screen feature
│   └── language/                  # Localization feature
└── generated/                     # Generated files (localization)
```

## Dependencies

### Core Dependencies
- `flutter_bloc` & `bloc` - State management
- `get_it` - Dependency injection
- `dio` & `retrofit` - HTTP client and API integration
- `freezed` & `json_serializable` - Code generation for models
- `dartz` - Functional programming (Either type)

### Firebase
- `firebase_core` - Firebase core functionality
- `firebase_auth` - Authentication
- `firebase_database` - Realtime database
- `firebase_messaging` - Push notifications
- `google_sign_in` - Google authentication

### Voice Chat
- `agora_rtc_engine` - Voice calling functionality
- `permission_handler` - Runtime permissions

### UI & Utilities
- `flutter_screenutil` - Screen adaptation
- `flutter_localizations` - Internationalization
- `intl` - Date formatting and localization
- `font_awesome_flutter` - Icons
- `flutter_portal` - Advanced UI components

## Setup Instructions

### 1. Environment Variables

Create a `.env` file in the root directory with the following variables:

```env
# API Keys
FOOTBALL_API_KEY=your_football_api_key_here
AGORA_APP_ID=your_agora_app_id_here

# Firebase Configuration
FIREBASE_ANDROID_API_KEY=your_firebase_android_api_key
FIREBASE_ANDROID_APP_ID=your_firebase_android_app_id
FIREBASE_ANDROID_MESSAGING_SENDER_ID=your_firebase_android_messaging_sender_id
FIREBASE_IOS_API_KEY=your_firebase_ios_api_key
FIREBASE_IOS_APP_ID=your_firebase_ios_app_id
FIREBASE_IOS_MESSAGING_SENDER_ID=your_firebase_ios_messaging_sender_id
FIREBASE_ANDROID_CLIENT_ID=your_firebase_android_client_id
FIREBASE_IOS_CLIENT_ID=your_firebase_ios_client_id

# API Base URLs
FOOTBALL_API_BASE_URL=https://v3.football.api-sports.io
```

### 2. API Keys Setup

#### Football API
1. Visit [API-Football](https://www.api-football.com/)
2. Sign up and get your API key
3. Add it to the `.env` file as `FOOTBALL_API_KEY`

#### Agora.io
1. Visit [Agora.io](https://www.agora.io/)
2. Create a project and get your App ID
3. Add it to the `.env` file as `AGORA_APP_ID`

#### Firebase
1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Enable Authentication with Google Sign-In
3. Enable Realtime Database
4. Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
5. Add Firebase configuration to `.env` file

### 3. Firebase Setup

#### Android
1. Place `google-services.json` in `android/app/`
2. Add the following to `android/app/build.gradle`:
```gradle
apply plugin: 'com.google.gms.google-services'
```

#### iOS
1. Place `GoogleService-Info.plist` in `ios/Runner/`
2. Configure URL schemes in `ios/Runner/Info.plist`

### 4. Permissions

#### Android (`android/app/src/main/AndroidManifest.xml`)
```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
```

#### iOS (`ios/Runner/Info.plist`)
```xml
<key>NSMicrophoneUsageDescription</key>
<string>This app needs access to microphone for voice chat</string>
<key>NSCameraUsageDescription</key>
<string>This app needs access to camera for video chat</string>
```

### 5. Code Generation

Run the following commands to generate necessary code:

```bash
# Generate freezed models
flutter packages pub run build_runner build

# Generate localization files
flutter pub get
```

## Running the App

1. Ensure all dependencies are installed:
```bash
flutter pub get
```

2. Run the app:
```bash
flutter run
```

## Project Structure Details

### Core Layer
- **Dependency Injection**: Uses GetIt for service location
- **Networking**: Dio + Retrofit for API calls
- **Error Handling**: Custom failure classes with Either type
- **Routing**: Centralized routing with route stack management
- **Environment**: Secure environment variable management

### Features
Each feature follows the same structure:
- **Data Layer**: API models, repository implementations
- **Domain Layer**: Entities, repository interfaces, use cases
- **Presentation Layer**: UI widgets, BLoC/Cubit state management

### State Management
- Uses BLoC pattern with Cubit for simpler state management
- Hydrated BLoC for persistent state (language preferences)
- Proper separation between business logic and UI

## API Integration

### Football API
- Fetches live matches and match details
- Handles different match statuses (live, finished, scheduled)
- Proper error handling and loading states

### Firebase Realtime Database
- Real-time voice chat room management
- Participant tracking
- Room creation and joining functionality

### Agora.io Voice SDK
- Voice calling functionality
- User management in voice channels
- Mute/unmute controls

## Testing

The app includes proper error handling and loading states for all network operations. Test the following scenarios:

1. **Authentication Flow**
   - Google Sign-In success/failure
   - Auto-login on app restart

2. **Matches Screen**
   - Loading live matches
   - Loading matches by date
   - Error handling for API failures

3. **Voice Chat**
   - Creating rooms
   - Joining/leaving rooms
   - Voice functionality with Agora

## Deployment

Before deploying:
1. Update Firebase configuration for production
2. Implement proper Agora token server for production use
3. Configure proper API rate limiting
4. Test on both Android and iOS devices

## Contributing

1. Follow the established clean architecture pattern
2. Add proper error handling for all network operations
3. Include loading states for better UX
4. Write unit tests for use cases and repositories
5. Follow the existing code style and naming conventions

## ScreenShots 🖼️
<div align='center'>
  <img height="460px" src="https://github.com/user-attachments/assets/81278f72-2d4b-4c56-8b66-d4b8ffde3253">
  <img height="460px" src="https://github.com/user-attachments/assets/92e0851b-f681-40c6-b6ad-0512d6133380">
  <img height="460px" src="https://github.com/user-attachments/assets/194cf666-2e42-40da-a798-ba580abfc064">
  <img height="460px" src="https://github.com/user-attachments/assets/f8b107bf-671a-43cd-b7a9-160f4c29db73">
  <img height="460px" src="https://github.com/user-attachments/assets/245428c6-3831-46f6-88f5-adcc36e36a80">
  <img height="460px" src="https://github.com/user-attachments/assets/a510e11d-c48c-43f9-bc9c-6b59dea24014">
  <img height="460px" src="https://github.com/user-attachments/assets/34910a1d-2f5c-477e-992e-9de13a6fb9f8">
  <img height="460px" src="https://github.com/user-attachments/assets/03a21bf7-383f-4c23-a777-6bb1e5e5a040">
  <img height="460px" src="https://github.com/user-attachments/assets/8ec187d1-f917-4b02-b9a0-902ad1c734d1">
  <img height="460px" src="https://github.com/user-attachments/assets/00013109-0d76-4aca-8052-50c2c674f67b">
  <img height="460px" src="https://github.com/user-attachments/assets/9cdbb352-ed25-49ee-bf4f-0ac467f7142a">
<hr/>
</div>

## License

This project is for educational purposes and follows the clean architecture pattern for Flutter development.

# football_commentary_app
