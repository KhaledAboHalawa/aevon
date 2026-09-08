import 'package:aevon/core/shared/data/model/result.dart';

import '../entity/muscle_group_intity.dart';

abstract class WorkoutsRepo {
  Future<Result<List<MuscleGroupIntity>>> getMuscleGroups();
}
