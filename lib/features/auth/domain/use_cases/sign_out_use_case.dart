import 'package:dartz/dartz.dart';
import 'package:football_commentary_app/core/error/failures.dart';
import 'package:football_commentary_app/features/auth/domain/repos/auth_repo.dart';

class SignOutUseCase {
  final AuthRepo _authRepo;

  SignOutUseCase(this._authRepo);

  Future<Either<Failure, void>> call() async {
    return await _authRepo.signOut();
  }
}

