import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  late final GoogleSignIn _googleSignIn;

  FirebaseAuthService() {
    // Configure Google Sign-In with proper scopes
    _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

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
      // Sign out from any existing Google session first
      await _googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      log('🔍 Google Sign-In Account Info:');
      log('  - Display Name: ${googleUser.displayName}');
      log('  - Email: ${googleUser.email}');
      log('  - Photo URL: ${googleUser.photoUrl}');
      log('  - ID: ${googleUser.id}');

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

      // Update the user profile with Google account information
      if (userCredential.user != null) {
        await _updateUserProfile(userCredential.user!, googleUser);
      }

      log('User signed in successfully: ${userCredential.user?.uid}');
      log('User display name: ${userCredential.user?.displayName}');
      log('User email: ${userCredential.user?.email}');
      return userCredential.user;
    } catch (e) {
      log('Error signing in with Google: $e');
      return null;
    }
  }

  // Update user profile with Google account information
  Future<void> _updateUserProfile(
    User firebaseUser,
    GoogleSignInAccount googleUser,
  ) async {
    try {
      // Check if we need to update the profile
      bool needsUpdate = false;
      String? displayName = firebaseUser.displayName;
      String? photoURL = firebaseUser.photoURL;

      // Update display name if it's empty or different from Google
      if (displayName == null ||
          displayName.isEmpty ||
          displayName != googleUser.displayName) {
        displayName = googleUser.displayName;
        needsUpdate = true;
        log('Updating display name to: $displayName');
      }

      // Update photo URL if it's empty or different from Google
      if (photoURL == null ||
          photoURL.isEmpty ||
          photoURL != googleUser.photoUrl) {
        photoURL = googleUser.photoUrl;
        needsUpdate = true;
        log('Updating photo URL to: $photoURL');
      }

      // Only update if there are changes
      if (needsUpdate) {
        await firebaseUser.updateDisplayName(displayName);
        if (photoURL != null) {
          await firebaseUser.updatePhotoURL(photoURL);
        }
        log('User profile updated successfully');
      }
    } catch (e) {
      log('Error updating user profile: $e');
      // Don't throw error here as the sign-in was successful
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
    log('Current user display name: ${user?.displayName ?? 'No Name'}');
    log('Current user email: ${user?.email ?? 'No Email'}');
    return user;
  }

  Future<void> signOut() async {
    try {
      log('Signing out user: ${FirebaseAuth.instance.currentUser?.uid}');
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.signOut();
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
          log(
            'Token validity check: $isValid (expires in ${timeUntilExpiry.inMinutes} minutes)',
          );
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
