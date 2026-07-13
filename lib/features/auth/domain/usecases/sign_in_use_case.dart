import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/domain/entities/sign_in_entity.dart';
import 'package:aevon/features/auth/domain/repositories/sign_in_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInUseCase {
  final AuthRepo _repo;
  SignInUseCase({required this._repo});

  Future<Result<SignInEntity>> call(SignInRequest request) =>
      _repo.singInWithREST(request);
}
