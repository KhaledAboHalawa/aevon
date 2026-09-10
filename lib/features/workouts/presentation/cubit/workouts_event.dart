import 'package:equatable/equatable.dart';

sealed class WorkoutsEvent extends Equatable {
  void when({
    required Function() getMuscleGroups,
    required Function(String id, int index) selectMuscleGroup,
    required Function(String? id) getPrimeMover,
  }) {
    switch (this) {
      case GetMuscleGroupsEvent():
        getMuscleGroups();
      case SelectMuscleGroupEvent event:
        selectMuscleGroup(event.id, event.index);
      case GetPrimeMoverEvent event:
        getPrimeMover(event.muscleGroupId);
    }
  }

  @override
  List<Object?> get props => [];
}

class GetMuscleGroupsEvent extends WorkoutsEvent {
  @override
  List<Object?> get props => [];
}

class SelectMuscleGroupEvent extends WorkoutsEvent {
  final String id;
  final int index;
  SelectMuscleGroupEvent({required this.id, required this.index});
  @override
  List<Object?> get props => [id, index];
}

class GetPrimeMoverEvent extends WorkoutsEvent {
  final String muscleGroupId;
  GetPrimeMoverEvent({required this.muscleGroupId});
  @override
  List<Object?> get props => [muscleGroupId];
}