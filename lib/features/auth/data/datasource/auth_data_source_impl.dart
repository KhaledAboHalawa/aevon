import 'package:aevon/core/network/api_executer.dart';
import 'package:aevon/core/shared/auth_session/datasource/local_storage/auth_session.dart';
import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/core/utils/app_constants.dart';
import 'package:aevon/features/auth/data/datasource/auth_data_source.dart';
import 'package:aevon/features/auth/data/models/auth_request.dart';
import 'package:aevon/features/auth/data/models/auth_respons.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final Dio _dio;
  final AuthSession _authSession;
  AuthDataSourceImpl(this._dio, this._authSession);
  @override
  Future<Result<AuthResonse>> singInWithREST(SignInRequest request) async {
    final resutl = await executeApiCall<AuthResonse>(
      apiCall: () async =>
          await _dio.post(ApiConstants.signIn, data: request.toJson()),
      parser: (data) => AuthResonse.fromJson(data),
    );

    return resutl..when(
      success: (data) async {
        _authSession.saveUserInfo(data.user);
        _authSession.saveToken(token: data.token!);
      },
      error: (failure) {},
    );
  }

  @override
  Future<Result<AuthResonse>> singUpWithREST(SignUpRequest request) async {
    final resutl = await executeApiCall<AuthResonse>(
      apiCall: () async =>
          await _dio.post(ApiConstants.signUp, data: request.toJson()),
      parser: (data) => AuthResonse.fromJson(data),
    );
    return resutl..when(
      success: (data) async {
        _authSession.saveUserInfo(data.user);
        _authSession.saveToken(token: data.token!);
      },
      error: (failure) {},
    );
  }
}
