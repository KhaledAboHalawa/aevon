import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/data/models/auth_respons.dart';

abstract class AuthDataSource {
  Future<Result<AuthResonse>> singInWithREST(SignInRequest request);

  Future<Result<AuthResonse>> singUpWithREST(SignUpRequest request);
}
