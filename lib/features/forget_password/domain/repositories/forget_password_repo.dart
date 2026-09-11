import 'package:aevon/core/shared/data/model/result.dart';

abstract class ForgetPasswordRepo {
  Future<Result<void>> forgetPassword({required String email});
  Future<Result<void>> verifyCode({required String code});
  Future<Result<void>> resetPassword({
    required String email,
    required String password,
  });
}