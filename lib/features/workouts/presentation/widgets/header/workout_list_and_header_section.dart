import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:flutter/material.dart';

import 'workout_list_item.dart';

class WorkoutListAndHeaderSection extends StatelessWidget {
  const WorkoutListAndHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 100,
      title: Text(
        'Workout',
        style: AppFont.balooThambi2SemiBold(
          color: AppColors.white,
          fontSize: 24,
        ),
      ),
      actions: [const SizedBox.shrink()],
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 30),
        child: SizedBox(
          width: double.infinity,
          height: 30,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            padding: const .symmetric(horizontal: 16),
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return WorkoutListItem(
                isSelected: index == 0,
                title: 'workout$index',
              );
            },
          ),
        ),
      ),
    );
  }
}
