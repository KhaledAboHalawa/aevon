import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/forget_password/domain/repositories/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ForgetPasswordUseCase {
  final ForgetPasswordRepo forgetPasswordRepo;
  const ForgetPasswordUseCase({required this.forgetPasswordRepo});
  
  Future<Result<void>> call({required String email}) =>
      forgetPasswordRepo.forgetPassword(email: email);
}