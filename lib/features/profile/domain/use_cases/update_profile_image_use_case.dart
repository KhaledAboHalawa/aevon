import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/profile/domain/reposetory/edit_profile_repo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateProfileImageUseCase {
  final EditProfileRepo _repo;
  UpdateProfileImageUseCase(this._repo);

  Future<Result<bool>> call(XFile file) => _repo.updateProfileImage(file);
}
