import 'package:aevon/core/shared/data/model/result.dart';
import 'package:aevon/features/workouts/data/data_source/workouts_data_source.dart';
import 'package:aevon/features/workouts/domain/entity/muscle_group_intity.dart';
import 'package:aevon/features/workouts/domain/repo/workouts_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WorkoutsRepo)
class WorkoutsRepoImpl implements WorkoutsRepo {
  final WorkoutsDataSource _workoutsDataSource;
  WorkoutsRepoImpl(this._workoutsDataSource);

  @override
  Future<Result<List<MuscleGroupIntity>>> getMuscleGroups() async {
    final result = await _workoutsDataSource.getMuscleGroups();
    return result.when(
      success: (data) {
        return Success(
          data.musclesGroup!
              .map(
                (e) => MuscleGroupIntity(id: e?.id ?? "", name: e?.name ?? ""),
              )
              .toList(),
        );
      },
      error: (error) {
        return Error(error);
      },
    );
  }
}
