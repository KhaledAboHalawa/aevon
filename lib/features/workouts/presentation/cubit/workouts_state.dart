import 'package:aevon/core/shared/presentation/cubit/base_state.dart';
import 'package:aevon/features/workouts/domain/entity/muscle_group_intity.dart';
import 'package:equatable/equatable.dart';

class WorkoutsState extends Equatable {
  final BaseState<List<MuscleGroupIntity>> muscleGroupsState;
  final String? selectedMuscleGroupId;
  final int? selectedMuscleGroupIndex;
  const WorkoutsState.initial()
    : muscleGroupsState = const BaseState<List<MuscleGroupIntity>>(
        status: StateStatus.initial,
      ),
      selectedMuscleGroupId = null,
      selectedMuscleGroupIndex = null;

  const WorkoutsState({
    required this.muscleGroupsState,
    this.selectedMuscleGroupId,
    this.selectedMuscleGroupIndex,
  });

  @override
  List<Object?> get props => [muscleGroupsState, selectedMuscleGroupId,selectedMuscleGroupIndex];

  WorkoutsState copyWith({
    BaseState<List<MuscleGroupIntity>>? muscleGroupsState,
    String? selectedMuscleGroupId,
    int? selectedMuscleGroupIndex,
  }) {
    return WorkoutsState(
      muscleGroupsState: muscleGroupsState ?? this.muscleGroupsState,
      selectedMuscleGroupId: selectedMuscleGroupId ?? this.selectedMuscleGroupId,
      selectedMuscleGroupIndex: selectedMuscleGroupIndex ?? this.selectedMuscleGroupIndex,
    );
  }
}
