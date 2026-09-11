import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/workouts/domain/entity/muscle_group_intity.dart';
import 'package:aevon/features/workouts/domain/repo/workouts_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetMusclesGroupsUseCase {
  final WorkoutsRepo workoutsRepo;
  GetMusclesGroupsUseCase({required this.workoutsRepo});

  Future<Result<List<MuscleGroupIntity>>> call() async =>
      await workoutsRepo.getMuscleGroups();
}
