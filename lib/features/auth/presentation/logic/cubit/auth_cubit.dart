import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_commentary_app/features/auth/domain/use_cases/google_sign_in_use_case.dart';
import 'package:football_commentary_app/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:football_commentary_app/features/auth/domain/use_cases/get_current_user_use_case.dart';
import 'package:football_commentary_app/features/auth/presentation/logic/cubit/auth_state.dart';
import 'package:football_commentary_app/features/auth/domain/repos/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  final GoogleSignInUseCase _googleSignInUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final AuthRepo _authRepo;

  AuthCubit({
    required GoogleSignInUseCase googleSignInUseCase,
    required SignOutUseCase signOutUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
    required AuthRepo authRepo,
  }) : _googleSignInUseCase = googleSignInUseCase,
       _signOutUseCase = signOutUseCase,
       _getCurrentUserUseCase = getCurrentUserUseCase,
       _authRepo = authRepo,
       super(AuthInitial()) {
    // Check authentication status when cubit is created
    _initializeAuth();
  }

  Future<void> _initializeAuth() async {
    print('🔐 AUTH CUBIT: Initializing authentication...');
    await checkAuthStatus();
  }

  Future<void> signInWithGoogle() async {
    print('🔐 AUTH CUBIT: Starting Google sign in...');
    emit(AuthLoading());

    final result = await _googleSignInUseCase();
    result.fold(
      (failure) {
        print('❌ AUTH CUBIT: Google sign in failed: ${failure.message}');
        emit(AuthError(failure.message));
      },
      (user) {
        print('✅ AUTH CUBIT: Google sign in successful for user: ${user.name}');
        emit(AuthAuthenticated(user));
      },
    );
  }

  Future<void> signOut() async {
    print('🔐 AUTH CUBIT: Starting sign out...');
    emit(AuthLoading());

    final result = await _signOutUseCase();
    result.fold(
      (failure) {
        print('❌ AUTH CUBIT: Sign out failed: ${failure.message}');
        emit(AuthError(failure.message));
      },
      (_) {
        print('✅ AUTH CUBIT: Sign out successful');
        emit(AuthUnauthenticated());
      },
    );
  }

  Future<void> checkAuthStatus() async {
    print('🔐 AUTH CUBIT: Checking authentication status...');
    emit(AuthLoading());

    final result = await _getCurrentUserUseCase();
    result.fold(
      (failure) {
        print('❌ AUTH CUBIT: Get current user failed: ${failure.message}');
        emit(AuthError(failure.message));
      },
      (user) {
        if (user != null) {
          print('✅ AUTH CUBIT: User is authenticated: ${user.name}');
          emit(AuthAuthenticated(user));
        } else {
          print('❌ AUTH CUBIT: No authenticated user found');
          emit(AuthUnauthenticated());
        }
      },
    );
  }

  Future<bool> isUserLoggedIn() async {
    print('🔐 AUTH CUBIT: Checking if user is logged in...');
    final isLoggedIn = await _authRepo.isUserLoggedIn();
    print('🔐 AUTH CUBIT: User logged in: $isLoggedIn');
    return isLoggedIn;
  }

  // Force refresh authentication status
  Future<void> refreshAuthStatus() async {
    print('🔐 AUTH CUBIT: Refreshing authentication status...');
    await checkAuthStatus();
  }

  // Check if current token is valid and refresh if needed
  Future<bool> ensureValidToken() async {
    print('🔐 AUTH CUBIT: Ensuring valid token...');

    if (state is AuthAuthenticated) {
      try {
        // This will trigger token refresh if needed
        await _authRepo.getCurrentUser();
        print('🔐 AUTH CUBIT: Token is valid');
        return true;
      } catch (e) {
        print('🔐 AUTH CUBIT: Token validation failed: $e');
        // Token might be expired, try to refresh auth status
        await refreshAuthStatus();
        return state is AuthAuthenticated;
      }
    }

    return false;
  }
}
