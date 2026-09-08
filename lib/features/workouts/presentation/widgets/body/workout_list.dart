import 'package:flutter/material.dart';

import 'workout_card.dart';

class WorkoutList extends StatelessWidget {
  const WorkoutList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 120, top: 22),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 17,
        ),
        itemCount: 16,
        itemBuilder: (context, index) {
          return const WorkoutCard();
        },
      ),
    );
  }
}
