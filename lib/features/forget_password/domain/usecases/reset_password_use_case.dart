import 'package:aevon/features/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/data/model/result.dart';

@lazySingleton
class ResetPasswordUseCase {
  final ForgetPasswordRepo forgetPasswordRepo;
  ResetPasswordUseCase({required this.forgetPasswordRepo});

  Future<Result<void>> call({
    required String email,
    required String password,
  }) =>
      forgetPasswordRepo.resetPassword(email: email, password: password);
}