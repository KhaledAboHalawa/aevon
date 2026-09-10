import 'package:aevon/core/shared/data/model/result.dart';

import '../entity/muscle_group_intity.dart';
import '../entity/prime_mover_entity.dart';

abstract class WorkoutsRepo {
  Future<Result<List<MuscleGroupIntity>>> getMuscleGroups();
  Future<Result<List<PrimeMoverEntity>>> getPrimeMover({
    String? muscleGroupId,
  });
}
