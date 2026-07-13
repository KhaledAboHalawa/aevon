import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/auth/data/datasource/auth_data_source.dart';
import 'package:aevon/features/auth/data/mapper/auth_response_mapper.dart';
import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/domain/entities/sign_in_entity.dart';
import 'package:aevon/features/auth/domain/repositories/sign_in_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _signInDataSource;
  AuthRepoImpl(this._signInDataSource);
  @override
  Future<Result<SignInEntity>> singInWithREST(SignInRequest request) async {
    final result = await _signInDataSource.singInWithREST(request);
    return result.when(
      success: (data) => Success<SignInEntity>(data.toSignInEntity()),
      error: (error) => Error<SignInEntity>(error),
    );
  }
}
