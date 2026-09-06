import 'package:flutter/material.dart';

import '../widgets/header/workout_list_and_header_section.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [WorkoutListAndHeaderSection()]);
  }
}
