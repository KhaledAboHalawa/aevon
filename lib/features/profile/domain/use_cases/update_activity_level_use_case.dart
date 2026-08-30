import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/auth/data/models/user_model.dart';
import 'package:aevon/features/profile/domain/reposetory/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateActivityLevelUseCase {
  final EditProfileRepo _repo;
  UpdateActivityLevelUseCase(this._repo);

  Future<Result<bool>> call(ActivityLevel activityLevel) =>
      _repo.updateActivityLevel(activityLevel);
}
