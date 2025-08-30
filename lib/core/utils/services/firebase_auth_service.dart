import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  FirebaseAuthService() {
    // Listen to authentication state changes
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      log('Firebase Auth State Changed: ${user?.uid ?? 'No User'}');
    });
    
    // Listen to user ID token changes (for token refresh)
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      log('Firebase ID Token Changed: ${user?.uid ?? 'No User'}');
    });
  }

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      
      // Force token refresh to ensure we have a valid token
      await userCredential.user?.getIdToken(true);
      
      log('User signed in successfully: ${userCredential.user?.uid}');
      return userCredential.user;
    } catch (e) {
      log('Error signing in with Google: $e');
      return null;
    }
  }

  bool isLoggedIn() {
    final user = FirebaseAuth.instance.currentUser;
    final isLoggedIn = user != null;
    log('Checking if user is logged in: $isLoggedIn (UID: ${user?.uid})');
    return isLoggedIn;
  }

  User? getCurrentUser() {
    final user = FirebaseAuth.instance.currentUser;
    log('Getting current user: ${user?.uid ?? 'No User'}');
    return user;
  }

  Future<void> signOut() async {
    try {
      log('Signing out user: ${FirebaseAuth.instance.currentUser?.uid}');
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      log('User signed out successfully');
    } catch (e) {
      log('Error signing out: $e');
      rethrow;
    }
  }

  // Get current user's ID token
  Future<String?> getIdToken() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final token = await user.getIdToken(true); // Force refresh
        log('Got ID token for user: ${user.uid}');
        return token;
      }
      return null;
    } catch (e) {
      log('Error getting ID token: $e');
      return null;
    }
  }

  // Check if token is expired or about to expire
  Future<bool> isTokenValid() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final tokenResult = await user.getIdTokenResult();
        final expirationTime = tokenResult.expirationTime;
        final currentTime = DateTime.now();
        
        if (expirationTime != null) {
          // Check if token expires in the next 5 minutes
          final timeUntilExpiry = expirationTime.difference(currentTime);
          final isValid = timeUntilExpiry.inMinutes > 5;
          log('Token validity check: $isValid (expires in ${timeUntilExpiry.inMinutes} minutes)');
          return isValid;
        }
      }
      return false;
    } catch (e) {
      log('Error checking token validity: $e');
      return false;
    }
  }
}

