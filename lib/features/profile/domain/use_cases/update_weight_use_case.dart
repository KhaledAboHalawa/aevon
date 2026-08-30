import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/profile/domain/reposetory/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateWeightUseCase {
  final EditProfileRepo _repo;
  UpdateWeightUseCase(this._repo);

  Future<Result<bool>> call(double weight) => _repo.updateWeight(weight);
}
