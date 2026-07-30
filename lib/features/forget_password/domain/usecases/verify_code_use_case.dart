import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class VerifyCodeUseCase {
  final ForgetPasswordRepo forgetPasswordRepo;
  VerifyCodeUseCase({required this.forgetPasswordRepo});
  Future<Result<void>> call({required String code}) =>
      forgetPasswordRepo.verifyCode(code: code);
}
