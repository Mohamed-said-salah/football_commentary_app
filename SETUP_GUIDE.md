# Football Commentary App - Complete Setup Guide

This guide will walk you through setting up the Football Commentary App from scratch.

## Prerequisites

- Flutter SDK (3.0.0 or higher)
- Android Studio / Xcode for mobile development
- Firebase account
- API-Football account
- Agora.io account

## Step 1: Clone and Setup Project

1. Extract the project files to your desired location
2. Open terminal in the project directory
3. Run `flutter pub get` to install dependencies

## Step 2: API Keys Setup

### 2.1 Football API Setup

1. **Visit API-Football Website**
   - Go to [https://www.api-football.com/](https://www.api-football.com/)
   - Click "Sign Up" to create an account

2. **Get API Key**
   - After registration, go to your dashboard
   - Copy your API key from the dashboard
   - Note: Free tier allows 100 requests per day

3. **Test API Key**
   - You can test your API key using curl:
   ```bash
   curl -X GET "https://v3.football.api-sports.io/fixtures?live=all" \
   -H "X-RapidAPI-Key: YOUR_API_KEY" \
   -H "X-RapidAPI-Host: v3.football.api-sports.io"
   ```

### 2.2 Agora.io Setup

1. **Create Agora Account**
   - Visit [https://www.agora.io/](https://www.agora.io/)
   - Sign up for a free account

2. **Create Project**
   - Go to Agora Console
   - Click "Create Project"
   - Choose "Secured mode: APP ID + Token" for production
   - For testing, you can use "Testing mode: APP ID"

3. **Get App ID**
   - Copy the App ID from your project dashboard
   - Note: For production, you'll need to implement a token server

## Step 3: Firebase Setup

### 3.1 Create Firebase Project

1. **Go to Firebase Console**
   - Visit [https://console.firebase.google.com/](https://console.firebase.google.com/)
   - Click "Create a project"
   - Enter project name: `football-commentary-app`
   - Enable Google Analytics (optional)

2. **Enable Authentication**
   - Go to Authentication > Sign-in method
   - Enable "Google" provider
   - Add your app's SHA-1 fingerprint for Android

3. **Enable Realtime Database**
   - Go to Realtime Database
   - Click "Create Database"
   - Choose "Start in test mode" for development
   - Select your preferred location

4. **Database Rules (for development)**
   ```json
   {
     "rules": {
       ".read": "auth != null",
       ".write": "auth != null"
     }
   }
   ```

### 3.2 Android Configuration

1. **Add Android App**
   - In Firebase Console, click "Add app" > Android
   - Package name: `com.example.football_commentary_app`
   - Download `google-services.json`

2. **Place Configuration File**
   - Put `google-services.json` in `android/app/` directory

3. **Update build.gradle files**
   
   **Project-level** (`android/build.gradle`):
   ```gradle
   dependencies {
       classpath 'com.google.gms:google-services:4.3.15'
   }
   ```
   
   **App-level** (`android/app/build.gradle`):
   ```gradle
   apply plugin: 'com.google.gms.google-services'
   
   dependencies {
       implementation 'com.google.firebase:firebase-analytics'
   }
   ```

4. **Get SHA-1 Fingerprint**
   ```bash
   cd android
   ./gradlew signingReport
   ```
   - Copy the SHA-1 from the debug keystore
   - Add it to Firebase Console > Project Settings > Your apps

### 3.3 iOS Configuration

1. **Add iOS App**
   - In Firebase Console, click "Add app" > iOS
   - Bundle ID: `com.example.footballCommentaryApp`
   - Download `GoogleService-Info.plist`

2. **Place Configuration File**
   - Put `GoogleService-Info.plist` in `ios/Runner/` directory
   - Add it to Xcode project

3. **Update Info.plist**
   ```xml
   <key>CFBundleURLTypes</key>
   <array>
       <dict>
           <key>CFBundleURLName</key>
           <string>REVERSED_CLIENT_ID</string>
           <key>CFBundleURLSchemes</key>
           <array>
               <string>YOUR_REVERSED_CLIENT_ID</string>
           </array>
       </dict>
   </array>
   ```

## Step 4: Environment Variables

1. **Create .env file**
   - Copy `example.env` to `.env` in the root directory

2. **Fill in your API keys**
   ```env
   # API Keys
   FOOTBALL_API_KEY=your_actual_football_api_key
   AGORA_APP_ID=your_actual_agora_app_id

   # Firebase Configuration (get these from Firebase Console)
   FIREBASE_ANDROID_API_KEY=your_android_api_key
   FIREBASE_ANDROID_APP_ID=your_android_app_id
   FIREBASE_ANDROID_MESSAGING_SENDER_ID=your_messaging_sender_id
   FIREBASE_IOS_API_KEY=your_ios_api_key
   FIREBASE_IOS_APP_ID=your_ios_app_id
   FIREBASE_IOS_MESSAGING_SENDER_ID=your_ios_messaging_sender_id
   FIREBASE_ANDROID_CLIENT_ID=your_android_client_id
   FIREBASE_IOS_CLIENT_ID=your_ios_client_id

   # API Base URLs
   FOOTBALL_API_BASE_URL=https://v3.football.api-sports.io
   ```

3. **Where to find Firebase values**
   - Go to Firebase Console > Project Settings > General
   - Scroll down to "Your apps" section
   - Click on your Android/iOS app
   - Copy the values from the configuration

## Step 5: Permissions Setup

### 5.1 Android Permissions

Update `android/app/src/main/AndroidManifest.xml`:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- Internet permission -->
    <uses-permission android:name="android.permission.INTERNET" />
    
    <!-- Agora permissions -->
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.BLUETOOTH" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />

    <application
        android:label="Football Commentary"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
        <!-- Your activities here -->
    </application>
</manifest>
```

### 5.2 iOS Permissions

Update `ios/Runner/Info.plist`:

```xml
<dict>
    <!-- Existing keys -->
    
    <!-- Microphone permission -->
    <key>NSMicrophoneUsageDescription</key>
    <string>This app needs access to microphone for voice chat commentary</string>
    
    <!-- Camera permission (if needed later) -->
    <key>NSCameraUsageDescription</key>
    <string>This app needs access to camera for video features</string>
    
    <!-- Your URL schemes from Firebase -->
    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleURLName</key>
            <string>REVERSED_CLIENT_ID</string>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>YOUR_REVERSED_CLIENT_ID_FROM_FIREBASE</string>
            </array>
        </dict>
    </array>
</dict>
```

## Step 6: Code Generation

Run the following commands to generate necessary code:

```bash
# Install dependencies
flutter pub get

# Generate freezed models and JSON serialization
flutter packages pub run build_runner build --delete-conflicting-outputs

# If you make changes to models later, run:
flutter packages pub run build_runner watch
```

## Step 7: Testing the Setup

### 7.1 Test API Connections

1. **Test Football API**
   - Run the app and navigate to matches screen
   - Check if matches are loading properly
   - Look for any API errors in the console

2. **Test Firebase Authentication**
   - Try Google Sign-In
   - Check Firebase Console > Authentication > Users

3. **Test Realtime Database**
   - Create a voice chat room
   - Check Firebase Console > Realtime Database > Data

4. **Test Agora Voice**
   - Join a voice chat room
   - Test microphone permissions
   - Try mute/unmute functionality

### 7.2 Common Issues and Solutions

**Issue: Google Sign-In not working on Android**
- Solution: Make sure SHA-1 fingerprint is added to Firebase
- Get SHA-1: `cd android && ./gradlew signingReport`

**Issue: Football API returning 403 Forbidden**
- Solution: Check your API key and request limits
- Verify the API key in .env file

**Issue: Agora voice not working**
- Solution: Check microphone permissions
- Verify Agora App ID is correct

**Issue: Firebase connection issues**
- Solution: Verify google-services.json/GoogleService-Info.plist are in correct locations
- Check if Firebase services are enabled

## Step 8: Running the App

1. **Start an emulator or connect a device**

2. **Run the app**
   ```bash
   flutter run
   ```

3. **For release build**
   ```bash
   flutter build apk --release  # Android
   flutter build ios --release  # iOS
   ```

## Step 9: Production Considerations

### 9.1 Agora Token Server
For production, implement a token server for Agora:
- Create a backend service to generate Agora tokens
- Update the voice chat cubit to fetch tokens from your server

### 9.2 Firebase Security Rules
Update Realtime Database rules for production:
```json
{
  "rules": {
    "voice_chat_rooms": {
      ".read": "auth != null",
      ".write": "auth != null",
      "$roomId": {
        ".validate": "newData.hasChildren(['name', 'created_by', 'created_at'])"
      }
    },
    "voice_chat_participants": {
      ".read": "auth != null",
      ".write": "auth != null"
    }
  }
}
```

### 9.3 API Rate Limiting
- Monitor your Football API usage
- Implement caching for frequently requested data
- Consider upgrading to a paid plan if needed

## Troubleshooting

### Build Issues
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Dependency Conflicts
```bash
# Update dependencies
flutter pub upgrade
```

### Platform-specific Issues
```bash
# Android
cd android && ./gradlew clean

# iOS
cd ios && rm -rf Pods Podfile.lock && pod install
```

## Support

If you encounter issues:
1. Check the console logs for error messages
2. Verify all API keys are correct
3. Ensure all permissions are granted
4. Check Firebase Console for any service issues
5. Refer to the official documentation for each service

## Next Steps

After successful setup:
1. Customize the app theme and branding
2. Add more football leagues and competitions
3. Implement push notifications for match updates
4. Add user profiles and preferences
5. Implement room moderation features
6. Add match statistics and live scores

