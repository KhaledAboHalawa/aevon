import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/forget_password/data/datasources/forget_password_data_source.dart';
import 'package:aevon/features/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ForgetPasswordDataSource dataSource;
  ForgetPasswordRepoImpl(this.dataSource);

  @override
  Future<Result<void>> forgetPassword({required String email}) async =>
      await dataSource.forgetPassword(email: email);

  @override
  Future<Result<void>> resetPassword({
    required String email,
    required String password,
  }) async => await dataSource.resetPassword(email: email, password: password);

  @override
  Future<Result<void>> verifyCode({required String code}) async =>
      await dataSource.verifyCode(code: code);
}
