import 'dart:ui';

import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:aevon/features/onboarding/presentation/cubit/onboarding_events.dart';
import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = getIt<OnboardingCubit>();
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1),
        child: Container(
          height: 275,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 31.5),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome to Aevon',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Discover the world of Aevon and explore its features.',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      onboardingCubit.doIntent(OnboardingPreviousEvent());
                    },
                    child: const Text('Previous'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onboardingCubit.doIntent(OnboardingNextEvent());
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
