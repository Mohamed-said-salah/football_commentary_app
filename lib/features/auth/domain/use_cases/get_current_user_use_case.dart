import 'package:dartz/dartz.dart';
import 'package:football_commentary_app/core/error/failures.dart';
import 'package:football_commentary_app/features/auth/domain/entities/user_entity.dart';
import 'package:football_commentary_app/features/auth/domain/repos/auth_repo.dart';

class GetCurrentUserUseCase {
  final AuthRepo _authRepo;

  GetCurrentUserUseCase(this._authRepo);

  Future<Either<Failure, UserEntity?>> call() async {
    return await _authRepo.getCurrentUser();
  }
}

