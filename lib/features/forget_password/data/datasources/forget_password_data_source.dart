import 'package:aevon/core/shared/data/datasource/api_executer.dart';
import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/core/utils/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ForgetPasswordDataSource {
  final Dio dio;
  ForgetPasswordDataSource({required this.dio});

  Future<Result<void>> forgetPassword({required String email}) async =>
      await executeApiCall<void>(
        apiCall: () async =>
            await dio.post(ApiConstants.forgetPassword, data: {'email': email}),
        parser: (_) {},
      );

  Future<Result<void>> verifyCode({required String code}) async =>
      await executeApiCall<void>(
        apiCall: () async =>
            await dio.post(ApiConstants.verifyCode, data: {'resetCode': code}),
        parser: (_) {},
      );

  Future<Result<void>> resetPassword({
    required String email,
    required String password,
  }) async => await executeApiCall<void>(
    apiCall: () async => await dio.post(
      ApiConstants.resetPassword,
      data: {'email': email, 'newPassword': password},
    ),
    parser: (_) {},
  );
}
