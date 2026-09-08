import 'package:aevon/features/workouts/domain/usecases/get_muscles_groups_use_case.dart';
import 'package:aevon/features/workouts/presentation/cubit/workouts_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/presentation/cubit/base_state.dart';
import 'workouts_state.dart';

@singleton
class WorkoutsCubit extends Cubit<WorkoutsState> {
  final GetMusclesGroupsUseCase _getMusclesGroupsUseCase;
  WorkoutsCubit({required this._getMusclesGroupsUseCase})
    : super(const WorkoutsState.initial()) {
    _getMuscleGroups();
  }

  void doIntent(WorkoutsEvent event) {
    event.when(
      getMuscleGroups: _getMuscleGroups,
      selectMuscleGroup: _selectMuscleGroup,
    );
  }

  void _getMuscleGroups() async {
    emit(state.copyWith(muscleGroupsState: const BaseState.loading()));
    final result = await _getMusclesGroupsUseCase();
    result.when(
      success: (data) {
        emit(
          state.copyWith(
            muscleGroupsState: BaseState.loaded(data),
            selectedMuscleGroupId: data.first.id,
            selectedMuscleGroupIndex: 0,
          ),
        );
      },
      error: (error) {
        emit(state.copyWith(muscleGroupsState: BaseState.error(error.message)));
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
  }
}
