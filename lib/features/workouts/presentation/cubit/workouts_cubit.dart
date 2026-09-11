import 'package:aevon/features/workouts/domain/usecases/get_muscles_groups_use_case.dart';
import 'package:aevon/features/workouts/presentation/cubit/workouts_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/presentation/cubit/base_state.dart';
import '../../domain/entity/muscle_group_intity.dart';
import '../../domain/entity/prime_mover_entity.dart';
import '../../domain/usecases/get_prime_mover_use_case.dart';
import 'workouts_state.dart';

@singleton
class WorkoutsCubit extends Cubit<WorkoutsState> {
  final GetMusclesGroupsUseCase _getMusclesGroupsUseCase;
  final GetPrimeMoverUseCase _getPrimeMoverUseCase;
  WorkoutsCubit({
    required this._getMusclesGroupsUseCase,
    required this._getPrimeMoverUseCase,
  }) : super(const WorkoutsState.initial()) {
    _getMuscleGroups();
    _getPrimeMover();
  }

  void doIntent(WorkoutsEvent event) {
    event.when(
      getMuscleGroups: _getMuscleGroups,
      selectMuscleGroup: _selectMuscleGroup,
      getPrimeMover: _getPrimeMover,
    );
  }

  void _getMuscleGroups() async {
    if (state.muscleGroupsState.isLoaded) return;
    emit(
      state.copyWith(
        muscleGroupsState: BaseState.loading(
          data: MuscleGroupIntity.dummyMuscleGroups,
        ),
      ),
    );
    final result = await _getMusclesGroupsUseCase();
    result.when(
      success: (data) {
        emit(
          state.copyWith(
            muscleGroupsState: BaseState.loaded([
              MuscleGroupIntity(id: "", name: "full body"),
              ...data,
            ]),
            selectedMuscleGroupId: '',
            selectedMuscleGroupIndex: 0,
          ),
        );
      },
      error: (error) {
        emit(
          state.copyWith(
            muscleGroupsState: BaseState.error(
              error.message,
              data: MuscleGroupIntity.dummyMuscleGroups,
            ),
          ),
        );
      },
    );
  }

  void _selectMuscleGroup(String id, int index) {
    emit(
      state.copyWith(
        selectedMuscleGroupId: id,
        selectedMuscleGroupIndex: index,
      ),
    );
    _getPrimeMover(id);
  }

  void _getPrimeMover([String? muscleGroupId]) async {
    emit(
      state.copyWith(
        primeMoverState: BaseState.loading(
          data: PrimeMoverEntity.dummyPrimeMovers,
        ),
      ),
    );
    final result = await _getPrimeMoverUseCase(muscleGroupId);
    result.when(
      success: (data) {
        emit(state.copyWith(primeMoverState: BaseState.loaded(data)));
      },
      error: (error) {
        emit(state.copyWith(primeMoverState: BaseState.error(error.message)));
      },
    );
  }
}
