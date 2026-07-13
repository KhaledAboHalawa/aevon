import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/data/models/auth_respons.dart';

abstract class AuthDataSource {
  Future<Result<SignInResonse>> singInWithREST(SignInRequest request);
}
