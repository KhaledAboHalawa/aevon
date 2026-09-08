import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/features/workouts/domain/entity/muscle_group_intity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font.dart';
import '../../cubit/workouts_cubit.dart';
import '../../cubit/workouts_event.dart';
import '../../cubit/workouts_state.dart';

class WorkoutCategoryListItem extends StatefulWidget {
  const WorkoutCategoryListItem({
    super.key,
    required this.muscleGroupIntity,
    required this.index,
  });
  final int index;
  final MuscleGroupIntity muscleGroupIntity;
  @override
  State<WorkoutCategoryListItem> createState() =>
      _WorkoutCategoryListItemState();
}

class _WorkoutCategoryListItemState extends State<WorkoutCategoryListItem> {
  late final WorkoutsCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = getIt<WorkoutsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WorkoutsCubit, WorkoutsState, String>(
      bloc: _cubit,
      selector: (state) => state.selectedMuscleGroupId ?? "",
      builder: (context, id) {
        bool isSelected = id == widget.muscleGroupIntity.id;
        return GestureDetector(
          behavior: .translucent,
          onTap: () {
            if (!isSelected) {
              _cubit.doIntent(
                SelectMuscleGroupEvent(
                  id: widget.muscleGroupIntity.id,
                  index: widget.index,
                ),
              );
            }
          },
          child: AnimatedContainer(
            key: ValueKey(widget.muscleGroupIntity.name),
            margin: const EdgeInsets.only(top: 10),
            alignment: .center,
            padding: const .symmetric(horizontal: 8),
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.mainOrange : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              widget.muscleGroupIntity.name,
              textAlign: .center,
              style: AppFont.balooThambi2Bold(
                fontSize: 14,
                color: isSelected ? AppColors.white : AppColors.textGrey,
              ),
            ),
          ),
        );
      },
    );
  }
}
