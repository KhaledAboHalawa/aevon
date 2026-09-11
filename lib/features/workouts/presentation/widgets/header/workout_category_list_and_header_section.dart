import 'package:aevon/core/shared/presentation/cubit/base_state.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../domain/entity/muscle_group_intity.dart';
import '../../cubit/workouts_cubit.dart';
import '../../cubit/workouts_state.dart';
import 'workout_category_list_item.dart';

class WorkoutCategoryListAndHeaderSection extends StatefulWidget {
  const WorkoutCategoryListAndHeaderSection({super.key});

  @override
  State<WorkoutCategoryListAndHeaderSection> createState() =>
      _WorkoutCategoryListAndHeaderSectionState();
}

class _WorkoutCategoryListAndHeaderSectionState
    extends State<WorkoutCategoryListAndHeaderSection> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void didUpdateWidget(
    covariant WorkoutCategoryListAndHeaderSection oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);
    _scrollToSelectedCategory(
      context.read<WorkoutsCubit>().state.selectedMuscleGroupIndex ?? 0,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSelectedCategory(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (index < 0) return;
      double itemWidth = 112; //width of one card + 16px spacing
      double scrollPosition = index * itemWidth;
      _scrollController.animateTo(
        scrollPosition,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyActions: false,
      pinned: true,
      snap: true,
      floating: true,
      shadowColor: AppColors.blur,
      title: Text(
        'Workout',
        style: AppFont.balooThambi2SemiBold(
          color: AppColors.white,
          fontSize: 24,
        ),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 40),
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: BlocConsumer<WorkoutsCubit, WorkoutsState>(
            buildWhen: (previous, current) =>
                previous.muscleGroupsState != current.muscleGroupsState,
            listenWhen: (previous, current) {
              return previous.muscleGroupsState != current.muscleGroupsState ||
                  previous.selectedMuscleGroupIndex !=
                      current.selectedMuscleGroupIndex;
            },
            listener: (BuildContext context, WorkoutsState state) {
              if (state.muscleGroupsState.isError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.muscleGroupsState.error!)),
                );
              }
              _scrollToSelectedCategory(state.selectedMuscleGroupIndex ?? 0);
            },
            builder: (context, state) {
              return Skeletonizer(
                enabled:
                    state.muscleGroupsState.isLoading ||
                    state.muscleGroupsState.isError,
                effect: const ShimmerEffect(
                  baseColor: Color.fromARGB(255, 70, 70, 70),
                  highlightColor: Color.fromARGB(255, 109, 109, 109),
                ),
                child: ListView.separated(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.muscleGroupsState.data?.length ?? 0,
                  padding: const .symmetric(horizontal: 16),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return WorkoutCategoryListItem(
                      key: ValueKey(
                        state.muscleGroupsState.data?[index].id ?? "",
                      ),
                      muscleGroupIntity:
                          state.muscleGroupsState.data?[index] ??
                          MuscleGroupIntity.dummyMuscleGroups[index],
                      index: index,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
