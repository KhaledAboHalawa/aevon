import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/auth/domain/repositories/sign_in_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchUserInfoUseCase {
  final AuthRepo authRepo;
  FetchUserInfoUseCase({required this.authRepo});

  Result<User> call() => authRepo.fetchUserInfo();
}
