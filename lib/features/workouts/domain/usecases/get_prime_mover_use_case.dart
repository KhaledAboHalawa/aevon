import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/workouts/domain/entity/prime_mover_entity.dart';
import 'package:aevon/features/workouts/domain/repo/workouts_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPrimeMoverUseCase {
  final WorkoutsRepo workoutsRepo;
  GetPrimeMoverUseCase(this.workoutsRepo);
  Future<Result<List<PrimeMoverEntity>>> call(String? muscleGroupId) async {
    return await workoutsRepo.getPrimeMover(muscleGroupId: muscleGroupId);
  }
}