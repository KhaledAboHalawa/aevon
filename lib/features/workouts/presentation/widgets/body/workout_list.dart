import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared/presentation/cubit/base_state.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../domain/entity/prime_mover_entity.dart';
import '../../cubit/workouts_cubit.dart';
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
            previous.primeMoverState != current.primeMoverState,
        listener: (BuildContext context, state) {
          if (state.primeMoverState.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.primeMoverState.error ?? "error")),
            );
          }
        },
        builder: (BuildContext context, state) {
          late List<PrimeMoverEntity> primeMover;
          if (state.primeMoverState.isLoading) {
            return const SliverToBoxAdapter(
              child: SizedBox(
                height: 500,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppColors.white,

                    strokeWidth: 2,
                  ),
                ),
              ),
            );
          } else if (state.primeMoverState.isError) {
            return const SliverToBoxAdapter(
              child: Center(child: Text('Error')),
            );
          } else if (state.primeMoverState.isLoaded) {
            primeMover = state.primeMoverState.data ?? [];
            if (primeMover.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(child: Text('No muscle groups')),
              );
            }
          }
          return SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 17,
            ),
            itemCount: primeMover.length,
            itemBuilder: (context, index) {
              return WorkoutCard(entity: primeMover[index]);
            },
          );
        },
      ),
    );
  }
}
