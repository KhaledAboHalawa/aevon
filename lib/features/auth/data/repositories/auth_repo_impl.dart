import 'dart:developer';

import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/auth/data/datasource/auth_data_source.dart';
import 'package:aevon/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:aevon/features/auth/data/mapper/auth_response_mapper.dart';
import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/domain/entities/sign_in_entity.dart';
import 'package:aevon/features/auth/domain/repositories/sign_in_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _authDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  AuthRepoImpl(this._authDataSource, this._authLocalDataSource);
  @override
  Future<Result<AuthEntity>> singInWithREST(SignInRequest request) async {
    final result = await _authDataSource.singInWithREST(request);
    return result.when(
      success: (data) async {
        await _authLocalDataSource.saveToken(data.token);
        return Success<AuthEntity>(data.toSignInEntity());
      },
      error: (error) => Error<AuthEntity>(error),
    );
  }

  @override
  Future<Result<AuthEntity>> singUpWithREST(SignUpRequest request) async {
    final result = await _authDataSource.singUpWithREST(request);
    return result.when(
      success: (data) async {
        await _authLocalDataSource.saveToken(data.token);
        return Success<AuthEntity>(data.toSignInEntity());
      },
      error: (error) => Error<AuthEntity>(error),
    );
  }
}
