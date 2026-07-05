import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:aevon/features/onboarding/presentation/widgets/onboarding_card.dart';
import 'package:aevon/features/onboarding/presentation/widgets/slid_show_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  final OnboardingCubit _onboardingCubit = getIt<OnboardingCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _onboardingCubit,
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Column(
            children: [
              SlidShowSection(currentPage: _onboardingCubit.index),
              OnboardingCard(),
            ],
          );
        },
      ),
    );
  }
}
