import 'package:aevon/core/di/dependency_injection.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_animated_botton.dart';
import 'package:aevon/core/shared/presentation/widgets/custom_button.dart';
import 'package:aevon/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:aevon/features/onboarding/presentation/cubit/onboarding_events.dart';
import 'package:aevon/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class NavSection extends StatefulWidget {
  const NavSection({super.key});

  @override
  State<NavSection> createState() => _NavSectionState();
}

class _NavSectionState extends State<NavSection> {
  bool isFirstLoad = true;
  late OnboardingCubit onboardingCubit;
  late AppLocalizations locale;
  @override
  initState() {
    super.initState();
    onboardingCubit = getIt<OnboardingCubit>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstLoad) {
      locale = AppLocalizations.of(context)!;
      isFirstLoad = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: (onboardingCubit.index == 0)
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceBetween,
      children: [
        if (onboardingCubit.index != 0)
          CustomButton(
            isLoading: false,
            onPressed: () {
              onboardingCubit.doIntent(const OnboardingPreviousEvent());
            },
            backgroundColor: Colors.transparent,
            title: locale.back,
          ),
        Flexible(
          child: AnimatedSizeButton(
            onPressed: () {
              onboardingCubit.index == 2
                  ? onboardingCubit.doIntent(const OnboardingDoneEvent())
                  : onboardingCubit.doIntent(const OnboardingNextEvent());
            },
            title: onboardingCubit.index == 2 ? locale.doIt : locale.next,
            isExpanded: (onboardingCubit.index == 0),
          ),
        ),
      ],
    );
  }
}
