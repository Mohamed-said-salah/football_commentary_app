import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvironmentVariables {
  static String _footballApiKey = '';
  static String _agoraAppId = '';
  static String _footballApiBaseUrl = '';
  static String _firebaseAndroidApiKey = '';
  static String _firebaseAndroidAppId = '';
  static String _firebaseAndroidMessagingSenderId = '';
  static String _firebaseIosApiKey = '';
  static String _firebaseIosAppId = '';
  static String _firebaseIosMessagingSenderId = '';
  static String _firebaseAndroidClientId = '';
  static String _firebaseIosClientId = '';

  static String get footballApiKey => _footballApiKey;
  static String get agoraAppId => _agoraAppId;
  static String get footballApiBaseUrl => _footballApiBaseUrl;
  static String get firebaseAndroidApiKey => _firebaseAndroidApiKey;
  static String get firebaseAndroidAppId => _firebaseAndroidAppId;
  static String get firebaseAndroidMessagingSenderId =>
      _firebaseAndroidMessagingSenderId;
  static String get firebaseIosApiKey => _firebaseIosApiKey;
  static String get firebaseIosAppId => _firebaseIosAppId;
  static String get firebaseIosMessagingSenderId =>
      _firebaseIosMessagingSenderId;
  static String get firebaseAndroidClientId => _firebaseAndroidClientId;
  static String get firebaseIosClientId => _firebaseIosClientId;

  static Future<void> init() async {
    const String fileName = '.env';
    await dotenv.load(fileName: fileName);

    _footballApiKey = dotenv.env['FOOTBALL_API_KEY'] ?? '';
    _agoraAppId = dotenv.env['AGORA_APP_ID'] ?? '';
    _footballApiBaseUrl = dotenv.env['FOOTBALL_API_BASE_URL'] ?? '';
    _firebaseAndroidApiKey = dotenv.env['FIREBASE_ANDROID_API_KEY'] ?? '';
    _firebaseAndroidAppId = dotenv.env['FIREBASE_ANDROID_APP_ID'] ?? '';
    _firebaseAndroidMessagingSenderId =
        dotenv.env['FIREBASE_ANDROID_MESSAGING_SENDER_ID'] ?? '';
    _firebaseIosApiKey = dotenv.env['FIREBASE_IOS_API_KEY'] ?? '';
    _firebaseIosAppId = dotenv.env['FIREBASE_IOS_APP_ID'] ?? '';
    _firebaseIosMessagingSenderId =
        dotenv.env['FIREBASE_IOS_MESSAGING_SENDER_ID'] ?? '';
    _firebaseAndroidClientId = dotenv.env['FIREBASE_ANDROID_CLIENT_ID'] ?? '';
    _firebaseIosClientId = dotenv.env['FIREBASE_IOS_CLIENT_ID'] ?? '';
  }
}

