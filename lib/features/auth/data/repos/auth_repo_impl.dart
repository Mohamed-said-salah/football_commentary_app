import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:football_commentary_app/core/error/failures.dart';
import 'package:football_commentary_app/core/utils/services/firebase_auth_service.dart';
import 'package:football_commentary_app/features/auth/domain/entities/user_entity.dart';
import 'package:football_commentary_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepoImpl(this._firebaseAuthService);

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await _firebaseAuthService.signInWithGoogle();
      if (user != null) {
        final userEntity = _createUserEntity(user);
        log('✅ AuthRepo: Created user entity: ${userEntity.name} (${userEntity.email})');
        return Right(userEntity);
      } else {
        return const Left(AuthFailure('Google sign in cancelled'));
      }
    } catch (e) {
      log('❌ AuthRepo: Google sign in failed: $e');
      return Left(AuthFailure('Google sign in failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _firebaseAuthService.signOut();
      return const Right(null);
    } catch (e) {
      log('❌ AuthRepo: Sign out failed: $e');
      return Left(AuthFailure('Sign out failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final user = _firebaseAuthService.getCurrentUser();
      if (user != null) {
        final userEntity = _createUserEntity(user);
        log('✅ AuthRepo: Got current user: ${userEntity.name} (${userEntity.email})');
        return Right(userEntity);
      } else {
        log('❌ AuthRepo: No current user found');
        return const Right(null);
      }
    } catch (e) {
      log('❌ AuthRepo: Get current user failed: $e');
      return Left(AuthFailure('Get current user failed: ${e.toString()}'));
    }
  }

  @override
  Future<bool> isUserLoggedIn() async {
    try {
      final isLoggedIn = _firebaseAuthService.isLoggedIn();
      log('🔐 AuthRepo: User logged in: $isLoggedIn');
      return isLoggedIn;
    } catch (e) {
      log('❌ AuthRepo: Check login status failed: $e');
      return false;
    }
  }

  @override
  Future<Either<Failure, String?>> getIdToken() async {
    try {
      final token = await _firebaseAuthService.getIdToken();
      log('✅ AuthRepo: Got ID token: ${token != null ? 'Token received' : 'No token'}');
      return Right(token);
    } catch (e) {
      log('❌ AuthRepo: Get ID token failed: $e');
      return Left(AuthFailure('Get ID token failed: ${e.toString()}'));
    }
  }

  @override
  Future<bool> isTokenValid() async {
    try {
      final isValid = await _firebaseAuthService.isTokenValid();
      log('🔐 AuthRepo: Token valid: $isValid');
      return isValid;
    } catch (e) {
      log('❌ AuthRepo: Check token validity failed: $e');
      return false;
    }
  }

  // Helper method to create UserEntity with proper name handling
  UserEntity _createUserEntity(User firebaseUser) {
    String userName = _extractUserName(firebaseUser);
    
    log('🔍 AuthRepo: Creating user entity with name: "$userName"');
    log('🔍 AuthRepo: Firebase user displayName: "${firebaseUser.displayName}"');
    log('🔍 AuthRepo: Firebase user email: "${firebaseUser.email}"');
    
    return UserEntity(
      id: firebaseUser.uid,
      name: userName,
      email: firebaseUser.email ?? '',
      photoUrl: firebaseUser.photoURL,
    );
  }

  // Extract user name with multiple fallbacks
  String _extractUserName(User firebaseUser) {
    // First priority: Firebase display name
    if (firebaseUser.displayName != null && firebaseUser.displayName!.isNotEmpty) {
      log('✅ Using Firebase display name: ${firebaseUser.displayName}');
      return firebaseUser.displayName!;
    }

    // Second priority: Extract from email (before @ symbol)
    if (firebaseUser.email != null && firebaseUser.email!.isNotEmpty) {
      final emailParts = firebaseUser.email!.split('@');
      if (emailParts.isNotEmpty && emailParts[0].isNotEmpty) {
        final emailName = emailParts[0];
        // Capitalize first letter and replace dots/underscores with spaces
        final formattedName = emailName
            .replaceAll('.', ' ')
            .replaceAll('_', ' ')
            .split(' ')
            .map((part) => part.isNotEmpty ? part[0].toUpperCase() + part.substring(1).toLowerCase() : '')
            .where((part) => part.isNotEmpty)
            .join(' ');
        
        if (formattedName.isNotEmpty) {
          log('✅ Using formatted email name: $formattedName');
          return formattedName;
        }
      }
    }

    // Third priority: Use first part of UID
    if (firebaseUser.uid.isNotEmpty) {
      final uidName = firebaseUser.uid.substring(0, firebaseUser.uid.length > 8 ? 8 : firebaseUser.uid.length);
      log('✅ Using UID-based name: $uidName');
      return 'User $uidName';
    }

    // Final fallback
    log('⚠️ Using fallback name: Anonymous User');
    return 'Anonymous User';
  }
}

