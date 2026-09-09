import 'package:aevon/core/shared/presentation/cubit/base_state.dart';
import 'package:aevon/features/workouts/domain/entity/muscle_group_intity.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entity/prime_mover_entity.dart';

class WorkoutsState extends Equatable {
  final BaseState<List<MuscleGroupIntity>> muscleGroupsState;
  final String? selectedMuscleGroupId;
  final int? selectedMuscleGroupIndex;
  final BaseState<List<PrimeMoverEntity>> primeMoverState;
  const WorkoutsState.initial()
    : muscleGroupsState = const BaseState<List<MuscleGroupIntity>>(
        status: StateStatus.initial,
      ),
      selectedMuscleGroupId = null,
      selectedMuscleGroupIndex = null,
      primeMoverState = const BaseState<List<PrimeMoverEntity>>(
        status: StateStatus.initial,
      );

  const WorkoutsState({
    required this.muscleGroupsState,
    this.selectedMuscleGroupId,
    this.selectedMuscleGroupIndex,
    required this.primeMoverState,
  });

  @override
  List<Object?> get props => [
    muscleGroupsState,
    selectedMuscleGroupId,
    selectedMuscleGroupIndex,
    primeMoverState,
  ];

  WorkoutsState copyWith({
    BaseState<List<MuscleGroupIntity>>? muscleGroupsState,
    String? selectedMuscleGroupId,
    int? selectedMuscleGroupIndex,
    BaseState<List<PrimeMoverEntity>>? primeMoverState,
  }) {
    return WorkoutsState(
      muscleGroupsState: muscleGroupsState ?? this.muscleGroupsState,
      selectedMuscleGroupId:
          selectedMuscleGroupId ?? this.selectedMuscleGroupId,
      selectedMuscleGroupIndex:
          selectedMuscleGroupIndex ?? this.selectedMuscleGroupIndex,
      primeMoverState: primeMoverState ?? this.primeMoverState,
    );
  }
}
