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
        final userEntity = UserEntity(
          id: user.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
          photoUrl: user.photoURL,
        );
        return Right(userEntity);
      } else {
        return const Left(AuthFailure('Google sign in cancelled'));
      }
    } catch (e) {
      return Left(AuthFailure('Google sign in failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _firebaseAuthService.signOut();
      return const Right(null);
    } catch (e) {
      return Left(AuthFailure('Sign out failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final user = _firebaseAuthService.getCurrentUser();
      if (user != null) {
        final userEntity = UserEntity(
          id: user.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
          photoUrl: user.photoURL,
        );
        return Right(userEntity);
      } else {
        return const Right(null);
      }
    } catch (e) {
      return Left(AuthFailure('Get current user failed: ${e.toString()}'));
    }
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return _firebaseAuthService.isLoggedIn();
  }

  @override
  Future<Either<Failure, String?>> getIdToken() async {
    try {
      final token = await _firebaseAuthService.getIdToken();
      return Right(token);
    } catch (e) {
      return Left(AuthFailure('Get ID token failed: ${e.toString()}'));
    }
  }

  @override
  Future<bool> isTokenValid() async {
    try {
      return await _firebaseAuthService.isTokenValid();
    } catch (e) {
      return false;
    }
  }
}

