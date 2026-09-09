import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../cubit/workouts_cubit.dart';
import '../cubit/workouts_event.dart';
import '../widgets/body/workout_list.dart';
import '../widgets/header/workout_category_list_and_header_section.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  late final WorkoutsCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = getIt<WorkoutsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: const CustomScrollView(
        scrollCacheExtent: ScrollCacheExtent.pixels(800),
        slivers: [WorkoutCategoryListAndHeaderSection(), WorkoutList()],
      ),
    );
  }
}
