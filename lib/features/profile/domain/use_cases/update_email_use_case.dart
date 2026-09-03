import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/profile/domain/reposetory/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateEmailUseCase {
  final EditProfileRepo _repo;
  UpdateEmailUseCase(this._repo);

  Future<Result<bool>> call(String email) => _repo.updateEmail(email);
}
