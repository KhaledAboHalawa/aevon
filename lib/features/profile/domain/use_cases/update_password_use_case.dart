import 'package:aevon/core/shared/data/model/result.dart';
import 'package:injectable/injectable.dart';

import '../reposetory/edit_profile_repo.dart';

@LazySingleton()
class UpdatePasswordUseCase {
  final EditProfileRepo editProfileRepo;
  const UpdatePasswordUseCase({required this.editProfileRepo});

  Future<Result<bool>> call({
    required String currentPassword,
    required String newPassword,
  }) async =>
      await editProfileRepo.updatePassword(currentPassword, newPassword);
}
