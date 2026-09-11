import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/auth/domain/entities/sign_in_entity.dart';

abstract class AuthRepo {
  Future<Result<AuthEntity>> singInWithREST(SignInRequest request);
  Future<Result<AuthEntity>> singUpWithREST(SignUpRequest request);
  Result<User> fetchUserInfo();
}
