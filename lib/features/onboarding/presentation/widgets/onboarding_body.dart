import 'dart:developer';

import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/router/app_routes.dart';
import 'package:aevon/core/theme/app_colors.dart';
import 'package:aevon/core/theme/app_font.dart';
import 'package:aevon/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:aevon/features/onboarding/presentation/cubit/onboarding_events.dart';
import 'package:aevon/features/onboarding/presentation/widgets/onboarding_card.dart';
import 'package:aevon/features/onboarding/presentation/widgets/slid_show_section.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  final OnboardingCubit _onboardingCubit = getIt<OnboardingCubit>();
  late bool isLtr;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isLtr = Directionality.of(context) == TextDirection.ltr;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _onboardingCubit,
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          log(state.toString());
          return Stack(
            children: [
              Column(
                children: [
                  SlidShowSection(currentPage: _onboardingCubit.index),
                  SizedBox(height: 200),
                ],
              ),
              Positioned(
                bottom: 0,
                child: OnboardingCard(index: _onboardingCubit.index),
              ),
              Positioned(
                right: isLtr ? 0 : null,
                left: isLtr ? null : 0,
                top: 0,
                child: TextButton(
                  onPressed: () =>
                      _onboardingCubit.doIntent(OnboardingSkipEvent()),
                  child: Text(
                    AppLocalizations.of(context)!.skip,
                    style: AppFont.balooThambi2Regular(
                      fontSize: 14,
                      color: AppColors.textGrey,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        listener: (BuildContext context, OnboardingState state) {
          if (state is OnboardingFinished) {
            context.go(AppRoutes.home);
          }
        },
      ),
    );
  }
}
