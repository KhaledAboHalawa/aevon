import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/profile/domain/reposetory/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateLastNameUseCase {
  final EditProfileRepo _repo;
  UpdateLastNameUseCase(this._repo);

  Future<Result<bool>> call(String lastName) =>
      _repo.updateLastName(lastName);
}
