import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/domain/entities/sign_in_entity.dart';
import 'package:aevon/features/auth/domain/repositories/sign_in_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpUseCase {
  final AuthRepo authRepo;
  SignUpUseCase({required this.authRepo});

  Future<Result<AuthEntity>> call(SignUpRequest request) => authRepo.singUpWithREST(request);
}