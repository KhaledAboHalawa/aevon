import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/profile/domain/reposetory/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateFirstNameUseCase {
  final EditProfileRepo _repo;
  UpdateFirstNameUseCase(this._repo);

  Future<Result<bool>> call(String firstName) =>
      _repo.updateFirstName(firstName);
}
