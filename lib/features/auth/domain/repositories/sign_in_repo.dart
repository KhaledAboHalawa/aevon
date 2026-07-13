import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/domain/entities/sign_in_entity.dart';

abstract class AuthRepo {
  Future<Result<SignInEntity>> singInWithREST(SignInRequest request);
}
