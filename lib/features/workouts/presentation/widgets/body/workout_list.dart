import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/shared/presentation/cubit/base_state.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../cubit/workouts_cubit.dart';
import '../../cubit/workouts_event.dart';
import '../../cubit/workouts_state.dart';
import 'workout_card.dart';

class WorkoutList extends StatelessWidget {
  const WorkoutList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 120, top: 22),
      sliver: BlocConsumer<WorkoutsCubit, WorkoutsState>(
        buildWhen: (previous, current) =>
            previous.primeMoverState != current.primeMoverState ||
            current.muscleGroupsState.isError,
        listener: (BuildContext context, state) {
          if (state.primeMoverState.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.primeMoverState.error ?? "error")),
            );
          }
        },
        builder: (BuildContext context, state) {
          if (state.primeMoverState.isError ||
              state.muscleGroupsState.isError) {
            return SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  Text(
                    state.primeMoverState.error ?? '',
                    style: AppFont.balooThambi2Bold(
                      fontSize: 22,
                      color: AppColors.textGrey,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    backgroundColor: AppColors.mainOrange,
                    title: "Try Again",
                    isLoading: false,
                    isExpanded: true,
                    onPressed: () {
                      context.read<WorkoutsCubit>()
                        ..doIntent(GetPrimeMoverEvent())
                        ..doIntent(GetMuscleGroupsEvent());
                    },
                  ),
                ],
              ),
            );
          }
          return Skeletonizer.sliver(
            enabled:  state.primeMoverState.isLoading,
            effect: const ShimmerEffect(
              baseColor: Color.fromARGB(255, 70, 70, 70),
              highlightColor: Color.fromARGB(255, 109, 109, 109),
            ),
            child: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 17,
              ),
              itemCount: state.primeMoverState.data?.length ?? 0,
              itemBuilder: (context, index) {
                return WorkoutCard(entity: state.primeMoverState.data![index]);
              },
            ),
          );
        },
      ),
    );
  }
}
