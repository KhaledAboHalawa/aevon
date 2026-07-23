import 'package:aevon/core/shared/data/datasource/api_executer.dart';
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
  AuthDataSourceImpl(this._dio);
  @override
  Future<Result<AuthResonse>> singInWithREST(SignInRequest request) async {
    return await executeApiCall<AuthResonse>(
      apiCall: () async =>
          await _dio.post(ApiConstants.signIn, data: request.toJson()),
      parser: (data) => AuthResonse.fromJson(data),
    );
  }

  @override
  Future<Result<AuthResonse>> singUpWithREST(SignUpRequest request) async {
    return await executeApiCall<AuthResonse>(
      apiCall: () async =>
          await _dio.post(ApiConstants.signUp, data: request.toJson()),
      parser: (data) => AuthResonse.fromJson(data),
    );
  }
}
